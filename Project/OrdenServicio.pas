unit OrdenServicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TFormOrdenServicio = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditId_Orden: TEdit;
    DateTimePickerFecha: TDateTimePicker;
    Label4: TLabel;
    Label2: TLabel;
    ComboBoxEntidad: TComboBox;
    EditSolicitante: TEdit;
    Label3: TLabel;
    ComboBoxTecnicos: TComboBox;
    Label5: TLabel;
    EditRuta: TEdit;
    EditEconomico: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    ComboBoxTipoEquipo: TComboBox;
    Label9: TLabel;
    ComboBoxEquipos: TComboBox;
    Label10: TLabel;
    MemoDescripcion: TMemo;
    Label11: TLabel;
    MemoObservaciones: TMemo;
    Label12: TLabel;
    LabelFolio: TLabel;
    cxGridDetalleOS: TcxGrid;
    cxGridDetalleOSDBTableView1: TcxGridDBTableView;
    cxGridDetalleOSLevel1: TcxGridLevel;
    SpeedButton3: TSpeedButton;
    FDQueryEncabezadoOS: TFDQuery;
    DataSourceDetalleOS: TDataSource;
    FDQueryDetalleOS: TFDQuery;
    cxGridDetalleOSDBTableView1tipo_equipo: TcxGridDBColumn;
    cxGridDetalleOSDBTableView1descripcion: TcxGridDBColumn;
    cxGridDetalleOSDBTableView1fecha: TcxGridDBColumn;
    cxGridDetalleOSDBTableView1descripcion_servicio: TcxGridDBColumn;
    cxGridPopupMenuOS: TcxGridPopupMenu;
    BitBtnAgregar: TBitBtn;
    cxGridDetalleOSDBTableView1partida: TcxGridDBColumn;
    FDQueryDetalleOrdenServicio: TFDQuery;
    FDQueryDetalleOSpartida: TFMTBCDField;
    FDQueryDetalleOSdescripcion: TWideStringField;
    FDQueryDetalleOStipo_equipo: TWideStringField;
    FDQueryDetalleOSfecha: TDateField;
    FDQueryDetalleOSdescripcion_servicio: TWideStringField;
    FDQueryDetalleOSestatus: TWideStringField;
    cxGridDetalleOSDBTableView1estatus: TcxGridDBColumn;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure ComboBoxEntidadDropDown(Sender: TObject);
    procedure ComboBoxTipoEquipoDropDown(Sender: TObject);
    procedure ComboBoxEquiposDropDown(Sender: TObject);
    procedure ComboBoxTecnicosDropDown(Sender: TObject);
    procedure DateTimePickerFechaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEntidadKeyPress(Sender: TObject; var Key: Char);
    procedure EditSolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxTecnicosKeyPress(Sender: TObject; var Key: Char);
    procedure EditRutaKeyPress(Sender: TObject; var Key: Char);
    procedure EditEconomicoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxTipoEquipoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEquiposKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnAgregarClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Clave_Entidad,Tecnicos,tipo_equipo,equipos,Partidas:Integer;
  end;

var
  FormOrdenServicio: TFormOrdenServicio;

implementation

{$R *.dfm}

uses DataModuleInventarios, Login, SolicitudServicio;

procedure TFormOrdenServicio.ComboBoxTecnicosDropDown(Sender: TObject);
begin
With DataModule1.FDQueryUsuario do
  begin
    Sql.Clear;
    Sql.Add('Select nombre from "CMSoftware"."Usuario" where tecnico=:param1 order by nombre ');
    Params[0].AsInteger:=1;
    Active:=True;
    ComboBoxTecnicos.Clear;
    while not DataModule1.FDQueryUsuario.Eof  do
    begin
      ComboBoxTecnicos.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;
end;

procedure TFormOrdenServicio.ComboBoxTecnicosKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      EditRuta.SetFocus;
    End;

end;

procedure TFormOrdenServicio.BitBtnAgregarClick(Sender: TObject);
begin
  With DataModule1.FDQueryEquipos do   //Resuelve  equipo
    Begin
      sql.Clear;
      sql.Add('Select id_equipo from "CMSoftware"."Equipo" where tipo_equipo=:param1');
      Params[0].AsString:=ComboBoxEquipos.Text;
      Open;
      equipos:=Fields[0].AsInteger;
    End;


   With DataModule1.FDQueryTipo_equipo do   //Resuelve Tipo de equipo
    Begin
      sql.Clear;
      sql.Add('Select id_tipo from "CMSoftware"."Tipo_equipo" where descripcion=:param1');
      Params[0].AsString:=ComboBoxTipoEquipo.Text;
      Open;
      tipo_equipo:=Fields[0].AsInteger;
    End;

 With FDQueryDetalleOrdenServicio do   //Inserta el detalle de la orden de servicio
    Begin
    Sql.Clear;
    Sql.Add('select count(id_solicitud) from "CMSoftware"."Detalle_solicitud" where id_solicitud=:param1');
    Params[0].AsString:=EditId_Orden.Text;
    Open;
    Partidas:=Fields[0].AsInteger+1;

    End;
 if ComboBoxTipoEquipo.Text='' then

        ShowMessage('Capture el tipo de equipo') else
  With FDQueryDetalleOrdenServicio do   //Inserta el detalle de la orden de servicio
   Begin
    Sql.Clear;
    Sql.Add('Insert into "CMSoftware"."Detalle_solicitud" (id_solicitud,fecha,id_equipo,id_tipo_equipo,descripcion_servicio,estatus,partida)');
    Sql.Add('values(:param1,:param2,:param3,:param4,:param5,:param6,:param7)');
    Params[0].AsString:=EditId_Orden.Text;
    Params[1].AsDate:=DateTimePickerFecha.Date;
    Params[2].AsInteger:=equipos;
    Params[3].AsInteger:=tipo_equipo;
    Params[4].AsString:=MemoDescripcion.Text;
    Params[5].AsString:='Pendiente';
    Params[6].AsInteger:=Partidas;
    ExecSQL;
   End;
   //Limpia campos de detalle
   ComboBoxTipoEquipo.Clear;
   ComboBoxEquipos.Clear;
   MemoDescripcion.text:='';
   With FDQueryDetalleOS do
    Begin
      Sql.Clear;
      Sql.Add('SELECT  "Detalle_solicitud".partida,"Tipo_equipo".descripcion,"Equipo".tipo_equipo,"Detalle_solicitud".fecha,');
      Sql.Add('"Detalle_solicitud".descripcion_servicio,"Detalle_solicitud".estatus FROM "CMSoftware"."Detalle_solicitud","CMSoftware"."Equipo", "CMSoftware"."Tipo_equipo"' );
      Sql.Add('WHERE "Detalle_solicitud".id_tipo_equipo = "Tipo_equipo".id_tipo AND "Equipo".id_equipo = "Detalle_solicitud".id_equipo');
      Sql.Add('and "Detalle_solicitud".id_solicitud=:param1 ');
      Params[0].AsString:=EditId_Orden.Text;
      open;
      DataSourceDetalleOS.DataSet.Refresh;
    End;

end;

procedure TFormOrdenServicio.ComboBoxEntidadDropDown(Sender: TObject);
begin
 With DataModule1.FDQueryEntidad do
  begin
    Sql.Clear;
    Sql.Add('Select nombre_entidad from "CMSoftware"."Entidades" order by nombre_entidad');
    Active:=True;
    ComboBoxEntidad.Clear;
    while not DataModule1.FDQueryEntidad.Eof  do
    begin
      ComboBoxEntidad.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;
end;

procedure TFormOrdenServicio.ComboBoxEntidadKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      EditSolicitante.SetFocus;
    End;

end;

procedure TFormOrdenServicio.ComboBoxEquiposDropDown(Sender: TObject);
begin
With DataModule1.FDQueryEquipos do
  begin
    Sql.Clear;
    Sql.Add('Select tipo_equipo from "CMSoftware"."Equipo" order by tipo_equipo');
    Active:=True;
    ComboBoxEquipos.Clear;
    while not DataModule1.FDQueryEquipos.Eof  do
    begin
      ComboBoxEquipos.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;
end;

procedure TFormOrdenServicio.ComboBoxEquiposKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      MemoDescripcion.SetFocus;
    End;

end;

procedure TFormOrdenServicio.ComboBoxTipoEquipoDropDown(Sender: TObject);
begin
 With DataModule1.FDQueryTipo_equipo do
  begin
    Sql.Clear;
    Sql.Add('Select descripcion from "CMSoftware"."Tipo_equipo" order by descripcion');
    Active:=True;
    ComboBoxTipoEquipo.Clear;
    while not DataModule1.FDQueryTipo_equipo.Eof  do
    begin
      ComboBoxTipoEquipo.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;
end;

procedure TFormOrdenServicio.ComboBoxTipoEquipoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      ComboBoxEquipos.SetFocus;
    End;

end;

procedure TFormOrdenServicio.DateTimePickerFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      ComboBoxEntidad.SetFocus;
    End;

end;

procedure TFormOrdenServicio.EditEconomicoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      ComboBoxTipoEquipo.SetFocus;
    End;

end;

procedure TFormOrdenServicio.EditRutaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
    Begin
      EditEconomico.SetFocus;
    End;

end;

procedure TFormOrdenServicio.EditSolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    Begin
      ComboBoxTecnicos.SetFocus;
    End;

end;

procedure TFormOrdenServicio.SpeedButtonAgregarClick(Sender: TObject);
Var
   Save,FolioOT:Integer;
begin
     Save:=Application.MessageBox('�Desea Guardar la Orden de Servicio y salir?','�Confirmando!',MB_YESNO);
        Begin
         if Save=IDYES then
          Begin
            With DataModule1.FDQueryEntidades do   //Resuelve Entidad
              Begin
                sql.Clear;
                sql.Add('Select id_entidad from "CMSoftware"."Entidades" where nombre_entidad=:param1');
                Params[0].AsString:=ComboBoxEntidad.Text;
                Open;
                Clave_Entidad:=Fields[0].AsInteger;
              End;
           With DataModule1.FDQueryUsuario do   //Resuelve T�cnico
              Begin
                sql.Clear;
                sql.Add('Select id_usuario from "CMSoftware"."Usuario" where nombre=:param1 ');
                Params[0].AsString:=ComboBoxTecnicos.Text;
                Open;
                Tecnicos:=Fields[0].AsInteger;
              End;
            With FDQueryEncabezadoOS do   //Inserta el encabezado de la orden de servicio
              Begin
                Sql.Clear;
                Sql.Add('Insert Into "CMSoftware"."SolicitudServicio" (id_solicitud,fecha,id_tecnico,');
                Sql.Add('id_entidad,observaciones,ruta,economico,estatus,tipoServicio,Solicitante,id_usuario)');
                Sql.Add('values(:param1,:param2,:param3,:param4,:param5,:param6,:param7,:param8,:param9,:param10,:param11)');
                Params[0].AsString:=EditId_Orden.Text;
                Params[1].AsDate:=DateTimePickerFecha.Date;
                Params[2].AsInteger:=Tecnicos;
                Params[3].AsInteger:=Clave_Entidad;
                Params[4].AsString:=MemoObservaciones.Text;
                Params[5].AsString:=EditRuta.Text;
                Params[6].AsString:=EditEconomico.Text;
                Params[7].AsInteger:=0;
                Params[8].AsString:='';
                Params[9].AsString:=EditSolicitante.Text;
                Params[10].AsInteger:=formLogin.Usuario;
                ExecSQL;
               End;
             With DataModule1.FDQueryUsuario do //actualiza el folio
             Begin
               Sql.Clear;
               Sql.Add('Select "id_folioOT" from "CMSoftware"."Usuario" where id_usuario=:param1');
              Params[0].AsInteger:=FormLogin.Usuario;
               Open;
               FolioOT:=Fields[0].AsInteger;
              End;

            With DataModule1.FDQueryfolios do
             Begin
               Sql.Clear;
               Sql.Add('Update "CMSoftware"."Folios" set num_folio=:param1 where id_folio=:param2');
               Params[0].AsInteger:=StrToInt(LabelFolio.Caption) +StrToInt('1');
               Params[1].AsInteger:=FolioOT;
               ExecSQL;
               ShowMessage('�rden de Servicio guardada �xitosamente');
             End;
               ComboBoxEntidad.Clear;
               EditSolicitante.Clear;
               ComboBoxTecnicos.Clear;
               EditRuta.Clear;
               EditEconomico.Clear;
               ComboBoxTipoEquipo.Clear;
               ComboBoxEquipos.Clear;
               MemoDescripcion.Clear;
               MemoObservaciones.Clear;
               DataSourceDetalleOS.DataSet.Close;
              close;
          End
          else

        End;


end;

procedure TFormOrdenServicio.SpeedButtonSalirClick(Sender: TObject);
var
  Save:Integer;
  OrdenServicio:Integer;
begin
  begin
      Save:=Application.MessageBox('�Desea Salir del registro de Orden de Servicio, no se guardar�n los registros capturados?','�Confirmando!',MB_YESNO);
        Begin
         if Save=IDYES then
           Begin
            With FDQueryDetalleOrdenServicio do
              Begin
              Sql.Clear;
              Sql.Add('Select count(id_solicitud) from "CMSoftware"."SolicitudServicio" where id_solicitud=:param1');
              Params[0].AsString:=EditId_Orden.Text;
              Open;
              OrdenServicio:=Fields[0].AsInteger;
            End;
              if OrdenServicio=0 then
                Begin
                 With FDQueryDetalleOrdenServicio do   //Borra registros capturados en el sistema
                  Begin
                    Sql.Clear;
                    Sql.Add('Delete  from "CMSoftware"."Detalle_solicitud" where id_solicitud=:param1');
                    Params[0].AsString:=EditId_Orden.Text;
                    ExecSQL;
                    close;
                    DataSourceDetalleOS.DataSet.Close;
                     ComboBoxEntidad.Clear;
                     EditSolicitante.Clear;
                     ComboBoxTecnicos.Clear;
                     EditRuta.Clear;
                     EditEconomico.Clear;
                     ComboBoxTipoEquipo.Clear;
                     ComboBoxEquipos.Clear;
                     MemoDescripcion.Clear;
                     MemoObservaciones.Clear;

                    End;
                  close;
                    DataSourceDetalleOS.DataSet.Close;
                   ComboBoxEntidad.Clear;
                   EditSolicitante.Clear;
                   ComboBoxTecnicos.Clear;
                   EditRuta.Clear;
                   EditEconomico.Clear;
                   ComboBoxTipoEquipo.Clear;
                   ComboBoxEquipos.Clear;
                   MemoDescripcion.Clear;
                   MemoObservaciones.Clear;

                End;


          End;
        End;
  end;
end;




end.
