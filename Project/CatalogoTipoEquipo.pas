unit CatalogoTipoEquipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridCustomPopupMenu, cxGridPopupMenu, FireDAC.Comp.UI, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,cxGridExportLink;

type
  TFormCatalogoTipoEquipo = class(TForm)
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    cxGridTipoEquipos: TcxGrid;
    cxGridTipoEquiposDBTableView1: TcxGridDBTableView;
    cxGridTipoEquiposLevel1: TcxGridLevel;
    FDGUIxWaitCursorTipoEquipo: TFDGUIxWaitCursor;
    cxGridPopupMenuTipoEquipo: TcxGridPopupMenu;
    FDTableTipoEquipo: TFDTable;
    SaveDialogTipoEquipos: TSaveDialog;
    DataSourceTipoEquipo: TDataSource;
    cxGridTipoEquiposDBTableView1id_tipo: TcxGridDBColumn;
    cxGridTipoEquiposDBTableView1descripcion: TcxGridDBColumn;
    cxGridTipoEquiposDBTableView1observaciones: TcxGridDBColumn;
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCatalogoTipoEquipo: TFormCatalogoTipoEquipo;

implementation

{$R *.dfm}

uses DataModuleInventarios, TipoEquipos, Equipo;

procedure TFormCatalogoTipoEquipo.FormActivate(Sender: TObject);
begin
  DataSourceTipoEquipo.DataSet.Refresh;
end;

procedure TFormCatalogoTipoEquipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormCatalogoTipoEquipo.SpeedButtonAgregarClick(Sender: TObject);
var
  Tipo_equipo:Integer;
begin
     //Dame la ultima clave del equipo
  With  DataModule1.FDQueryTipo_equipo do
      Begin
        Close;
        sql.Clear;
        Sql.add('Select max(id_tipo) from "CMSoftware"."Tipo_equipo"');
        open;
        Tipo_equipo:=Fields[0].Asinteger + 1;
      End;
      //Asigna lave y abre modulo
  FormTipoEquipos.Show;
  FormTipoEquipos.Editclave.text:=IntToStr(Tipo_equipo);
  FormTipoEquipos.EditTipoEquipo.SetFocus;
  FormTipoEquipos.BitBtnGuardar.Caption:='&Guardar';
end;

procedure TFormCatalogoTipoEquipo.SpeedButtonEliminarClick(Sender: TObject);
var
  Tipo_equipo:Integer;
  Delete:Integer;
begin
  TIpo_equipo:=StrToInt(DataSourceTipoEquipo.DataSet.Fields[0].AsString);
    begin
      Delete:=Application.MessageBox('¿Estas seguro de borrar el registro seleccionado?','¡Confirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With DataModule1.FDQueryEquipos do //borra tipo de equipos
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Tipo_equipo" where id_tipo=:param1');
                 Params[0].AsInteger:=Tipo_equipo;
                 ExecSQL;
                 DataSourceTipoEquipo.DataSet.Refresh;
              end;
          end;
    end;


end;

procedure TFormCatalogoTipoEquipo.SpeedButtonImprimirClick(Sender: TObject);

begin
    SaveDialogTipoEquipos.Filter:='Hoja de Cálculo Excel (*.xls) | *.xls';
    SaveDialogTipoEquipos.Title:=' Salvar listado como Hoja de Cálculo Excel';
     if SaveDialogTipoEquipos.Execute then
  begin
	// Salva la información en un archivo de Excell.
	ExportGridToExcel(SaveDialogTipoEquipos.FileName,cxGridTipoEquipos, False);
	MessageDlg('La información fué salvada en ' + SaveDialogTipoEquipos.FileName, mtInformation, [mbOk], 0);
  end;
end;


procedure TFormCatalogoTipoEquipo.SpeedButtonModificarClick(Sender: TObject);
var
  Tipo_Equipos:Integer;
begin
  Tipo_Equipos:=strTOInt(DataSourceTipoEquipo.DataSet.Fields[0].AsString);
With DataModule1.FDQueryTipo_equipo do //consulta y modifica el centro de costos
              begin
                 Close;
                 sql.Clear;
                 Sql.Add('select id_tipo,descripcion,obseRvaciones');
                 Sql.Add('from "CMSoftware"."Tipo_equipo" where id_tipo=:param1');
                 Params[0].AsInteger:=Tipo_Equipos;
                 open;

            With FormTipoEquipos do
               begin
                 EditClave.Text:=IntToStr(TIpo_Equipos);
                 EditTipoEquipo.Text:=Fields[1].AsString;
                 MemoObservaciones.Text:=Fields[2].AsString;
                BitBtnGuardar.Caption:='&Modificar';
               end;
  end;
  FormTipoEquipos.Show;
end;

procedure TFormCatalogoTipoEquipo.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
