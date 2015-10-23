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
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin;

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
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMovimientosInventario: TFormMovimientosInventario;

implementation

{$R *.dfm}

procedure TFormMovimientosInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMovimientosInventario.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.