unit MovimientosInventario;

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
  Vcl.Menus, FireDAC.Comp.UI, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,StrUtils,cxGridExportLink;

type
  TFormMovimientosInventario = class(TForm)
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonBuscar: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    cxGridMovimientosInventario: TcxGrid;
    cxGridMovimientosInventarioDBTableView1: TcxGridDBTableView;
    cxGridMovimientosInventarioLevel1: TcxGridLevel;
    FDGUIxWaitCursorMovimientosInventario: TFDGUIxWaitCursor;
    PopupMenuMovimientosInventario: TPopupMenu;
    DataSourceMovimientosInventario: TDataSource;
    FDQueryMovimientosInventario: TFDQuery;
    FDQueryMovimientosInventarionum_docto: TWideStringField;
    FDQueryMovimientosInventarioid_clave: TWideStringField;
    FDQueryMovimientosInventarioid_proveedor_cliente: TFMTBCDField;
    FDQueryMovimientosInventarioid_concepto: TFMTBCDField;
    FDQueryMovimientosInventariofecha: TDateField;
    FDQueryMovimientosInventariocosto: TFMTBCDField;
    FDQueryMovimientosInventariofolio: TWideStringField;
    FDQueryMovimientosInventariocosto_operado: TFMTBCDField;
    FDQueryMovimientosInventariocantidad: TFMTBCDField;
    FDQueryMovimientosInventarioalmacen: TFMTBCDField;
    FDQueryMovimientosInventariodescripcion: TWideStringField;
    cxGridMovimientosInventarioDBTableView1num_docto: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1id_clave: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1descripcion: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1id_proveedor_cliente: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1id_concepto: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1fecha: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1costo: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1folio: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1costo_operado: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1cantidad: TcxGridDBColumn;
    cxGridMovimientosInventarioDBTableView1almacen: TcxGridDBColumn;
    FDQueryMovimientosInventariolinea: TWideStringField;
    cxGridMovimientosInventarioDBTableView1linea: TcxGridDBColumn;
    SaveDialogMovsInve: TSaveDialog;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FolioUsuario:integer;
  end;

var
  FormMovimientosInventario: TFormMovimientosInventario;

implementation

{$R *.dfm}

uses AltaMovInventario, DataModuleInventarios, MainMenu, AltaCompra;

procedure TFormMovimientosInventario.FormActivate(Sender: TObject);
begin
  DataSourceMovimientosInventario.DataSet.Refresh;
end;

procedure TFormMovimientosInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMovimientosInventario.SpeedButtonAgregarClick(Sender: TObject);
begin

  FormAltaMovInv.show;
  FormAltaMovInv.EditOT.Enabled:=False;
With datamodule1.fdQueryusuario do
   Begin
     Sql.Clear;
     Sql.Add('Select "CMSoftware"."Folios".num_folio,"CMSoftware"."Folios".serie from "CMSoftware"."Folios","CMSoftware"."Usuario" where "CMSoftware"."Usuario".id_usuario=:param1 ');
     Sql.Add('and  "CMSoftware"."Folios".id_folio = "CMSoftware"."Usuario"."Id_folioMI"');
     Params[0].AsInteger:=StrToInt(RightStr(FormMAinMenu.StatusBarMainMenu.Panels[0].Text,3));
     open;
     FolioUsuario:=Fields[0].AsInteger;
     FormAltaMovInv.EditFolio.Text:=Fields[1].AsString+''+Fields[0].AsString;
     FormAltaMovInv.LabelFolio.Caption:=Fields[0].AsString;
     FormAltaMovInv.Caption:='Alta de Movimiento al Inventario '+' '+'[Mov. Núm. ' +FormAltaMovInv.EditFolio.Text+']';
   End;
     FormAltaMovInv.DateTimePickerFecha.Date:=Date;
     FormAltaMovInv.ComboBoxConcepto.SetFocus;
end;

procedure TFormMovimientosInventario.SpeedButtonBuscarClick(Sender: TObject);
begin
    SaveDialogMovsInve.Filter:='Hoja de Cálculo Excel (*.xls) | *.xls';
    SaveDialogMovsInve.Title:=' Salvar listado como Hoja de Cálculo Excel';
     if SaveDialogMovsInve.Execute then
  begin
	// Salva la información en un archivo de Excell.
	ExportGridToExcel(SaveDialogMovsInve.FileName,cxGridMovimientosInventario, False);
	MessageDlg('La información fué salvada en ' + SaveDialogMovsInve.FileName, mtInformation, [mbOk], 0);
  end;
end;

procedure TFormMovimientosInventario.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
