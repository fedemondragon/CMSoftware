unit ProgramacionOrdenes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ToolWin, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridCustomPopupMenu,
  cxGridPopupMenu, Vcl.Menus,cxGridExportLink;

type
  TFormProgramacionOrdenes = class(TForm)
    cxGridProgramacion: TcxGrid;
    cxGridProgramacionDBTableView1: TcxGridDBTableView;
    cxGridProgramacionLevel1: TcxGridLevel;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEstatus: TSpeedButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    DateTimePickerStart: TDateTimePicker;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    DateTimePickerFinish: TDateTimePicker;
    FDQueryProgramacion: TFDQuery;
    DataSourceProgramacion: TDataSource;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    FDQueryProgramacionid: TFMTBCDField;
    FDQueryProgramacionstart: TSQLTimeStampField;
    FDQueryProgramacionfinish: TSQLTimeStampField;
    FDQueryProgramacioncaption: TWideStringField;
    FDQueryProgramacionlocation: TWideStringField;
    FDQueryProgramacionmessage: TWideStringField;
    FDQueryProgramacionid_solicitud: TWideStringField;
    FDQueryProgramacionestatus: TWideStringField;
    cxGridProgramacionDBTableView1id: TcxGridDBColumn;
    cxGridProgramacionDBTableView1start: TcxGridDBColumn;
    cxGridProgramacionDBTableView1finish: TcxGridDBColumn;
    cxGridProgramacionDBTableView1caption: TcxGridDBColumn;
    cxGridProgramacionDBTableView1location: TcxGridDBColumn;
    cxGridProgramacionDBTableView1message: TcxGridDBColumn;
    cxGridProgramacionDBTableView1id_solicitud: TcxGridDBColumn;
    cxGridProgramacionDBTableView1estatus: TcxGridDBColumn;
    ToolButton4: TToolButton;
    PopupMenuProgramacion: TPopupMenu;
    AltadeOrdendeservicio1: TMenuItem;
    Cancelarprogramacin1: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButtonImprimir: TSpeedButton;
    SaveDialogOrdenesServicio: TSaveDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonEstatusClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AltadeOrdendeservicio1Click(Sender: TObject);
    procedure Cancelarprogramacin1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgramacionOrdenes: TFormProgramacionOrdenes;

implementation

{$R *.dfm}

uses Login, OrdenServicio, DataModuleInventarios;

procedure TFormProgramacionOrdenes.AltadeOrdendeservicio1Click(Sender: TObject);
Var
    FolioUsuario:Integer;
begin
  if DataSourceProgramacion.dataset.fields[7].AsString='CANCELADO' then
     ShowMessage('El documento ya se encuentra cancelado') else
        if DataSourceProgramacion.dataset.fields[7].AsString='ASIGNADO' then
     ShowMessage('El documento ya se encuentra asignado') else
     Begin
      FormOrdenServicio.show;
      FormOrdenServicio.DateTimePickerFecha.SetFocus;
      FormOrdenServicio.DateTimePickerFecha.Date:=Date;

      With datamodule1.fdQueryusuario do
       Begin
         Sql.Clear;
         Sql.Add('Select "CMSoftware"."Folios".num_folio,"CMSoftware"."Folios".serie from "CMSoftware"."Folios","CMSoftware"."Usuario" where "CMSoftware"."Usuario".id_usuario=:param1 ');
         Sql.Add('and  "CMSoftware"."Folios".id_folio = "CMSoftware"."Usuario"."id_folioOT"');
         Params[0].AsInteger:=FormLogin.Usuario;
         open;
         FolioUsuario:=Fields[0].AsInteger;
         FormOrdenServicio.EditId_Orden.Text:=Fields[1].AsString+''+Fields[0].AsString;
         FormOrdenServicio.LabelFolio.Caption:=Fields[0].AsString;
         FormOrdenServicio.Caption:='Alta de Orden de Servicio '+' '+'[N�m. ' +FormOrdenServicio.EditId_Orden.Text+']';
       End;
         FormOrdenServicio.EditID_programacion.text:=DataSourceProgramacion.DataSet.FieldByName('id').AsString;
     end;
end;

procedure TFormProgramacionOrdenes.Cancelarprogramacin1Click(Sender: TObject);
Var
  ID,Delete:Integer;
begin
  Delete:=Application.MessageBox('�Desea Cancelar este documento?','�Confirmando!',MB_YESNO);
  if Delete=IDYES then
     Begin
       ID:=StrToInt(DataSourceProgramacion.DataSet.Fields[0].AsString);
     if DataSourceProgramacion.dataset.fields[7].AsString='CANCELADO' then
     ShowMessage('El documento ya se encuentra cancelado') else

      With FDQueryProgramacion do
       Begin
         Sql.Clear;
         Sql.Add('Update "CMSoftware"."Agenda" set estatus=:param1,id_usuario=:param2 where id=:param3 ');
         Params[0].AsString:='CANCELADO';
         Params[1].AsInteger:=FormLogin.Usuario;
         Params[2].AsInteger:=ID;

         ExecSQL;
         ShowMessage('�Documento Cancelado!');
        End;
  with FDQueryProgramacion do
   Begin
     Sql.Clear;
     Sql.Add('Select * from "CMSoftware"."Agenda" order by id');
     Open;
     DataSourceProgramacion.DataSet.Refresh;
   End;
     End;

end;

procedure TFormProgramacionOrdenes.FormActivate(Sender: TObject);
begin
 with FDQueryProgramacion do
   Begin
     Sql.Clear;
     Sql.Add('Select * from "CMSoftware"."Agenda" order by id');
     Open;
     DataSourceProgramacion.DataSet.Refresh;
   End;
end;

procedure TFormProgramacionOrdenes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action:=caFree;
end;

procedure TFormProgramacionOrdenes.SpeedButton1Click(Sender: TObject);
begin
 with FDQueryProgramacion do
   Begin
     Sql.Clear;
     Sql.Add('Select * from "CMSoftware"."Agenda" where start between :param1 and :param2');
     Params[0].AsDateTime:=DateTimePickerStart.DateTime;
     Params[1].AsDateTime:=DateTimePickerFinish.DateTime;
     Open;
     DataSourceProgramacion.DataSet.Refresh;
   End;
end;

procedure TFormProgramacionOrdenes.SpeedButton2Click(Sender: TObject);
begin
  with FDQueryProgramacion do
   Begin
     Sql.Clear;
     Sql.Add('Select * from "CMSoftware"."Agenda" order by id');
     Open;
     DataSourceProgramacion.DataSet.Refresh;
   End;
end;

procedure TFormProgramacionOrdenes.SpeedButtonAgregarClick(Sender: TObject);
Var
    FolioUsuario:Integer;
begin
  if DataSourceProgramacion.dataset.fields[7].AsString='CANCELADO' then
     ShowMessage('El documento ya se encuentra cancelado') else
        if DataSourceProgramacion.dataset.fields[7].AsString='ASIGNADO' then
     ShowMessage('El documento ya se encuentra asignado') else
     Begin
      FormOrdenServicio.show;
      FormOrdenServicio.DateTimePickerFecha.SetFocus;
      FormOrdenServicio.DateTimePickerFecha.Date:=Date;

      With datamodule1.fdQueryusuario do
       Begin
         Sql.Clear;
         Sql.Add('Select "CMSoftware"."Folios".num_folio,"CMSoftware"."Folios".serie from "CMSoftware"."Folios","CMSoftware"."Usuario" where "CMSoftware"."Usuario".id_usuario=:param1 ');
         Sql.Add('and  "CMSoftware"."Folios".id_folio = "CMSoftware"."Usuario"."id_folioOT"');
         Params[0].AsInteger:=FormLogin.Usuario;
         open;
         FolioUsuario:=Fields[0].AsInteger;
         FormOrdenServicio.EditId_Orden.Text:=Fields[1].AsString+''+Fields[0].AsString;
         FormOrdenServicio.LabelFolio.Caption:=Fields[0].AsString;
         FormOrdenServicio.Caption:='Alta de Orden de Servicio '+' '+'[N�m. ' +FormOrdenServicio.EditId_Orden.Text+']';
       End;
         FormOrdenServicio.EditID_programacion.text:=DataSourceProgramacion.DataSet.FieldByName('id').AsString;
     end;

end;

procedure TFormProgramacionOrdenes.SpeedButtonEstatusClick(Sender: TObject);
Var
  ID,Delete:Integer;
begin
  Delete:=Application.MessageBox('�Desea Cancelar este documento?','�Confirmando!',MB_YESNO);
  if Delete=IDYES then
     Begin
       ID:=StrToInt(DataSourceProgramacion.DataSet.Fields[0].AsString);
     if DataSourceProgramacion.dataset.fields[7].AsString='CANCELADO' then
     ShowMessage('El documento ya se encuentra cancelado') else

      With FDQueryProgramacion do
       Begin
         Sql.Clear;
         Sql.Add('Update "CMSoftware"."Agenda" set estatus=:param1,id_usuario=:param2 where id=:param3 ');
         Params[0].AsString:='CANCELADO';
         Params[1].AsInteger:=FormLogin.Usuario;
         Params[2].AsInteger:=ID;

         ExecSQL;
         ShowMessage('�Documento Cancelado!');
        End;
  with FDQueryProgramacion do
   Begin
     Sql.Clear;
     Sql.Add('Select * from "CMSoftware"."Agenda" order by id');
     Open;
     DataSourceProgramacion.DataSet.Refresh;
   End;
     End;
end;

procedure TFormProgramacionOrdenes.SpeedButtonImprimirClick(Sender: TObject);
begin
    SaveDialogOrdenesServicio.Filter:='Hoja de C�lculo Excel (*.xls) | *.xls';
    SaveDialogOrdenesServicio.Title:=' Salvar listado como Hoja de C�lculo Excel';
     if SaveDialogOrdenesServicio.Execute then
  begin
	// Salva la informaci�n en un archivo de Excell.
	ExportGridToExcel(SaveDialogOrdenesServicio.FileName,cxGridProgramacion, False);
	MessageDlg('La informaci�n fu� salvada en ' + SaveDialogOrdenesServicio.FileName, mtInformation, [mbOk], 0);
  end;
end;

procedure TFormProgramacionOrdenes.SpeedButtonModificarClick(Sender: TObject);
Var
    FolioUsuario:Integer;
    ID_PROGRAMACION,ENTIDAD,TECNICO:Integer;

    NOMBRE_ENTIDAD,NOMBRE_TECNICO:String;
begin
  ID_PROGRAMACION:=DataSourceProgramacion.DataSet.Fields[0].AsInteger;
  if DataSourceProgramacion.dataset.fields[7].AsString='ASIGNADO' then
     Begin
          With DataModule1.FDQueryOrdenServicio do   //id del tecnico y entidad de servicio
           Begin
             Sql.Clear;
             Sql.Add('Select id_entidad,id_tecnico from "CMSoftware"."SolicitudServicio" where id_programacion=:param1');
             Params[0].AsInteger:=ID_PROGRAMACION;
             Open;
             TECNICO:=Fields[0].AsInteger;
             ENTIDAD:=Fields[1].AsInteger;
           End;

            With DataModule1.FDQueryEntidades do   //Resuelve Entidad
              Begin
                sql.Clear;
                sql.Add('Select nombre_entidad from "CMSoftware"."Entidades" where id_entidad=:param1');
                Params[0].AsInteger:=ENTIDAD;
                Open;
                NOMBRE_ENTIDAD:=Fields[0].AsString;
              End;
           With DataModule1.FDQueryUsuario do   //Resuelve T�cnico
              Begin
                sql.Clear;
                sql.Add('Select nombre from "CMSoftware"."Usuario" where id_usuario=:param1 ');
                Params[0].AsInteger:=TECNICO;
                Open;
                NOMBRE_TECNICO:=Fields[0].AsString;
              End;

       With DataModule1.FDQueryOrdenServicio do
        Begin
         Sql.Clear;
         Sql.Add('Select id_solicitud, id_programacion,');
         Sql.add('solicitante,fecha, observaciones');
         Sql.add('FROM "CMSoftware"."SolicitudServicio" WHERE id_programacion=:param1');
         Params[0].AsInteger:=ID_PROGRAMACION;
         Open;
           With FormOrdenServicio do
             Begin
               EditId_Orden.Text:=Fields[0].AsString;
               EditID_programacion.Text:=Fields[1].AsString;
               EditSolicitante.Text:=Fields[2].AsString;
               DateTimePickerFecha.Date:=Fields[3].AsDateTime;
               MemoObservaciones.Text:=Fields[4].AsString;
               ComboBoxEntidad.Text:=NOMBRE_ENTIDAD;
               ComboBoxTecnicos.Text:=NOMBRE_TECNICO;
             End;
        End;
        With FormOrdenServicio.FDQueryDetalleOS do
        Begin
            Sql.Clear;
            Sql.Add('SELECT  "Detalle_solicitud".partida,"Tipo_equipo".descripcion,"Equipo".tipo_equipo,"Detalle_solicitud".fecha,');
            Sql.Add('"Detalle_solicitud".descripcion_servicio,"Detalle_solicitud".estatus FROM "CMSoftware"."Detalle_solicitud","CMSoftware"."Equipo", "CMSoftware"."Tipo_equipo"' );
            Sql.Add('WHERE "Detalle_solicitud".id_tipo_equipo = "Tipo_equipo".id_tipo AND "Equipo".id_equipo = "Detalle_solicitud".id_equipo');
            Sql.Add('and "Detalle_solicitud".id_solicitud=:param1 ');
            Params[0].AsString:=FormOrdenServicio.EditId_Orden.Text;
            open;
            FormOrdenServicio.DataSourceDetalleOS.DataSet.Refresh;
          End;

        FormOrdenServicio.Show;
        FormOrdenServicio.Caption:='Orden de Servicio [Consulta]';

     End;

End;



procedure TFormProgramacionOrdenes.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
