unit CatalogoEquipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu,cxGridExportLink;

type
  TFormCatalogoEquipos = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    FDGUIxWaitCursorEquipos: TFDGUIxWaitCursor;
    DataSourceEquipos: TDataSource;
    cxGridPopupMenuEquipos: TcxGridPopupMenu;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxGridEquipos: TcxGrid;
    cxGridEquiposDBTableView1: TcxGridDBTableView;
    cxGridEquiposLevel1: TcxGridLevel;
    FDQueryEquipos: TFDQuery;
    FDQueryEquiposdescripcion: TWideStringField;
    FDQueryEquiposid_equipo: TFMTBCDField;
    FDQueryEquipostipo_equipo: TWideStringField;
    FDQueryEquiposcapacidad: TWideStringField;
    FDQueryEquiposidentificador: TWideStringField;
    FDQueryEquiposcodigo: TWideStringField;
    FDQueryEquiposprioridad: TWideStringField;
    FDQueryEquiposclasificacion1: TWideStringField;
    FDQueryEquiposclasificacion2: TWideStringField;
    FDQueryEquiposcentro_costos: TWideStringField;
    FDQueryEquiposobservaciones: TWideStringField;
    FDQueryEquiposruta: TWideStringField;
    FDQueryEquiposeconomico: TWideStringField;
    cxGridEquiposDBTableView1id_equipo: TcxGridDBColumn;
    cxGridEquiposDBTableView1tipo_equipo: TcxGridDBColumn;
    cxGridEquiposDBTableView1capacidad: TcxGridDBColumn;
    cxGridEquiposDBTableView1descripcion: TcxGridDBColumn;
    cxGridEquiposDBTableView1identificador: TcxGridDBColumn;
    cxGridEquiposDBTableView1codigo: TcxGridDBColumn;
    cxGridEquiposDBTableView1prioridad: TcxGridDBColumn;
    cxGridEquiposDBTableView1clasificacion1: TcxGridDBColumn;
    cxGridEquiposDBTableView1clasificacion2: TcxGridDBColumn;
    cxGridEquiposDBTableView1centro_costos: TcxGridDBColumn;
    cxGridEquiposDBTableView1observaciones: TcxGridDBColumn;
    cxGridEquiposDBTableView1ruta: TcxGridDBColumn;
    cxGridEquiposDBTableView1economico: TcxGridDBColumn;
    SaveDialogEquipos: TSaveDialog;
    FDQueryEquiposnombre_entidad: TWideStringField;
    cxGridEquiposDBTableView1nombre_entidad: TcxGridDBColumn;
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCatalogoEquipos: TFormCatalogoEquipos;

implementation

{$R *.dfm}

uses DataModuleInventarios, Proveedor, Equipo, CentroCostos, CatalogoEntidades,
  CatalogoTipoEquipo;

procedure TFormCatalogoEquipos.FormActivate(Sender: TObject);
begin
{  With FDQueryEquipos do
    Begin
      Sql.Clear;
      Sql.Add('SELECT "Tipo_equipo".descripcion, "Equipo".id_equipo,"Equipo".tipo_equipo, "Equipo".capacidad,');
      Sql.Add('"Equipo".identificador,"Equipo".codigo,"Equipo".prioridad,"Equipo".clasificacion1,"Equipo".clasificacion2,');
      Sql.Add('"Equipo".centro_costos,"Entidades".nombre_entidad,"Equipo".observaciones,"Equipo".ruta,"Equipo".economico');
      Sql.Add('FROM "CMSoftware"."Equipo","CMSoftware"."Tipo_equipo","CMSoftware"."Entidades" WHERE "Tipo_equipo".id_tipo = "Equipo".id_tipo and "Equipo".id_entidad = "Entidades".id_entidad order by id_equipo;');
      Open;
    End;  }


  DataSourceEquipos.DataSet.Refresh;



end;

procedure TFormCatalogoEquipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFormCatalogoEquipos.SpeedButton1Click(Sender: TObject);
begin
  TFormCatalogoEntidades.Create(Self).Show;
end;

procedure TFormCatalogoEquipos.SpeedButton2Click(Sender: TObject);
begin
  TFormCatalogoTipoEquipo.Create(Self).Show;
end;

procedure TFormCatalogoEquipos.SpeedButtonAgregarClick(Sender: TObject);
var
  equipo:Integer;
begin
     //Dame la ultima clave del equipo
  With  DataModule1.FDQueryEquipos do
      Begin
        Close;
        sql.Clear;
        Sql.add('Select max(id_equipo) from "CMSoftware"."Equipo"');
        open;
        equipo:=Fields[0].Asinteger + 1;
      End;
      //Asigna lave y abre modulo
  FormEquipos.Show;
  FormEquipos.TabbedNotebook1.PageIndex:=0;
  FormEquipos.Editid_equipo.text:=IntToStr(equipo);
  FormEquipos.EditEquipoNombre.SetFocus;
  FormEquipos.BitBtnGuardar.Caption:='&Guardar';
end;

procedure TFormCatalogoEquipos.SpeedButtonEliminarClick(Sender: TObject);
var
  equipo:Integer;
  Delete:Integer;
begin
  equipo:=StrToInt(DataSourceEquipos.DataSet.Fields[0].AsString);
    begin
      Delete:=Application.MessageBox('�Estas seguro de borrar el registro seleccionado?','�Confirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With DataModule1.FDQueryEquipos do //borra equipos
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Equipo" where id_equipo=:param1');
                 Params[0].AsInteger:=equipo;
                 ExecSQL;
                 DataSourceEquipos.DataSet.Refresh;
              end;
          end;
    end;


end;

procedure TFormCatalogoEquipos.SpeedButtonImprimirClick(Sender: TObject);
begin
    SaveDialogEquipos.Filter:='Hoja de C�lculo Excel (*.xls) | *.xls';
    SaveDialogEquipos.Title:=' Salvar listado como Hoja de C�lculo Excel';
     if SaveDialogEquipos.Execute then
  begin
	// Salva la informaci�n en un archivo de Excell.
	ExportGridToExcel(SaveDialogEquipos.FileName,cxGridEquipos, False);
	MessageDlg('La informaci�n fu� salvada en ' + SaveDialogEquipos.FileName, mtInformation, [mbOk], 0);
  end;


end;

procedure TFormCatalogoEquipos.SpeedButtonModificarClick(Sender: TObject);
var
  Equipos:Integer;
  TipoEquipo,ID_TIPO_EQUIPO,ENTIDAD:String;
begin
  FormEquipos.TabbedNotebook1.PageIndex:=0;
  Equipos:=strTOInt(DataSourceEquipos.DataSet.Fields[0].AsString);
         ID_TIPO_EQUIPO:=DataSourceEquipos.DataSet.Fields[2].AsString;
         ENTIDAD:=DataSourceEquipos.DataSet.Fields[10].AsString;


            With DataModule1.FDQueryEquipos do //consulta y modifica el centro de costos
              begin
                 sql.Clear;
                 Sql.Add('select id_equipo,tipo_equipo,capacidad,identificador,codigo,prioridad,clasificacion1,');
                 Sql.Add('clasificacion2,centro_costos,observaciones,campo_libre1,campo_libre2,campo_libre3,');
                 Sql.Add('descrip_libre1,descrip_libre2,descrip_libre3,id_tipo,ruta,economico');
                 Sql.Add('from "CMSoftware"."Equipo" where id_equipo=:param1');
                 Params[0].AsInteger:=Equipos;
                 open;

            With FormEquipos do
               begin
                 Editid_equipo.Text:=IntToStr(Equipos);
                 EditEquipoNombre.Text:=Fields[1].AsString;
                 EditCapacidad.Text:=Fields[2].AsString;
                 EditIdentificador.Text:=Fields[3].AsString;
                 EditCodigo.Text:=Fields[4].AsString;
                 ComboBoxPrioridad.Text:=Fields[5].AsString;
                 EditClasificacion1.Text:=Fields[6].AsString;
                 EditClasificacion2.Text:=Fields[7].AsString;
                 ComboBoxCentroCostos.Text:=Fields[8].AsString;
                 ComboBoxLocalizacion.Text:=ENTIDAD;
                 MemoObservaciones.Text:=Fields[9].AsString;
                 EditCampolibre1.Text:=Fields[10].AsString;
                 EditCampolibre2.Text:=Fields[11].AsString;
                 EditCampolibre3.Text:=Fields[12].AsString;
                 EditDescribe1.Text:=Fields[13].AsString;
                 EditDescribe2.Text:=Fields[14].AsString;
                 EditDescribe3.Text:=Fields[15].AsString;
                 EditRuta.Text:=Fields[17].AsString;
                 EditEconomico.Text:=Fields[18].AsString;
                 ComboBoxTipoEquipo.Text:=ID_TIPO_EQUIPO;
                BitBtnGuardar.Caption:='&Modificar';
               end;
  end;
  FormEquipos.Show;

end;

procedure TFormCatalogoEquipos.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
