unit SolicitudServicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormSolicitudServicio = class(TForm)
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEstatus: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    SpeedButtonSalir: TSpeedButton;
    cxGridCompras: TcxGrid;
    cxGridComprasDBTableView1: TcxGridDBTableView;
    cxGridComprasLevel1: TcxGridLevel;
    FDQueryOrdenesServicio: TFDQuery;
    DataSourceOrdenesServicio: TDataSource;
    FDQueryOrdenesServiciodescripcion: TWideStringField;
    FDQueryOrdenesServiciotipo_equipo: TWideStringField;
    FDQueryOrdenesServiciofecha: TDateField;
    FDQueryOrdenesServicioruta: TWideStringField;
    FDQueryOrdenesServicioeconomico: TWideStringField;
    FDQueryOrdenesServicioestatus: TFMTBCDField;
    FDQueryOrdenesServicioobservaciones: TWideStringField;
    FDQueryOrdenesServiciosolicitante: TWideStringField;
    FDQueryOrdenesServicioid_usuario: TFMTBCDField;
    FDQueryOrdenesServicionombre_entidad: TWideStringField;
    FDQueryOrdenesServicioid_solicitud: TWideStringField;
    cxGridComprasDBTableView1descripcion: TcxGridDBColumn;
    cxGridComprasDBTableView1tipo_equipo: TcxGridDBColumn;
    cxGridComprasDBTableView1fecha: TcxGridDBColumn;
    cxGridComprasDBTableView1ruta: TcxGridDBColumn;
    cxGridComprasDBTableView1economico: TcxGridDBColumn;
    cxGridComprasDBTableView1estatus: TcxGridDBColumn;
    cxGridComprasDBTableView1observaciones: TcxGridDBColumn;
    cxGridComprasDBTableView1solicitante: TcxGridDBColumn;
    cxGridComprasDBTableView1id_usuario: TcxGridDBColumn;
    cxGridComprasDBTableView1nombre_entidad: TcxGridDBColumn;
    cxGridComprasDBTableView1id_solicitud: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSolicitudServicio: TFormSolicitudServicio;

implementation

{$R *.dfm}

uses OrdenServicio, DataModuleInventarios, Login, AltaCompra;

procedure TFormSolicitudServicio.FormActivate(Sender: TObject);
begin
  With FDQueryOrdenesServicio do
   Begin
       SQl.Clear;
       Sql.Add('SELECT "Tipo_equipo".descripcion, "Equipo".tipo_equipo, "SolicitudServicio".fecha,  "SolicitudServicio".ruta,');
       Sql.Add( '"SolicitudServicio".economico, "SolicitudServicio".estatus,"SolicitudServicio".observaciones, "SolicitudServicio".solicitante,');
       Sql.Add('"SolicitudServicio".id_usuario,  "Entidades".nombre_entidad,  "SolicitudServicio".id_solicitud FROM   "CMSoftware"."Detalle_solicitud",');
       Sql.Add(' "CMSoftware"."SolicitudServicio", "CMSoftware"."Tipo_equipo", "CMSoftware"."Equipo",  "CMSoftware"."Entidades" WHERE   "Detalle_solicitud".id_tipo_equipo = "Tipo_equipo".id_tipo AND');
       Sql.Add('"SolicitudServicio".id_solicitud = "Detalle_solicitud".id_solicitud AND  "Equipo".id_equipo = "Detalle_solicitud".id_equipo AND   "Entidades".id_entidad = "SolicitudServicio".id_entidad');
       open;
   End;
end;

procedure TFormSolicitudServicio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action:=caFree;
end;

procedure TFormSolicitudServicio.SpeedButtonAgregarClick(Sender: TObject);
Var
    FolioUsuario:Integer;
begin
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

 end;

procedure TFormSolicitudServicio.SpeedButtonSalirClick(Sender: TObject);
begin
close;
end;

end.