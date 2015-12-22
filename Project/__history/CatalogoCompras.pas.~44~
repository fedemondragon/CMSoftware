unit CatalogoCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,StrUtils,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomPopupMenu, cxGridPopupMenu, FireDAC.Comp.UI;

type
  TFormCatalogoCompras = class(TForm)
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEstatus: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    cxGridCompras: TcxGrid;
    cxGridComprasDBTableView1: TcxGridDBTableView;
    cxGridComprasLevel1: TcxGridLevel;
    SpeedButton1: TSpeedButton;
    FDGUIxWaitCursorCompras: TFDGUIxWaitCursor;
    cxGridPopupMenuCompras: TcxGridPopupMenu;
    FDTableCompras: TFDTable;
    DataSourceCompras: TDataSource;
    cxGridComprasDBTableView1num_compra: TcxGridDBColumn;
    cxGridComprasDBTableView1id_proveedor: TcxGridDBColumn;
    cxGridComprasDBTableView1fecha_compra: TcxGridDBColumn;
    cxGridComprasDBTableView1tipo_compra: TcxGridDBColumn;
    cxGridComprasDBTableView1num_orden: TcxGridDBColumn;
    cxGridComprasDBTableView1almacen: TcxGridDBColumn;
    cxGridComprasDBTableView1subtotal: TcxGridDBColumn;
    cxGridComprasDBTableView1iva: TcxGridDBColumn;
    cxGridComprasDBTableView1total: TcxGridDBColumn;
    cxGridComprasDBTableView1descuento: TcxGridDBColumn;
    cxGridComprasDBTableView1id_usuario: TcxGridDBColumn;
    cxGridComprasDBTableView1estatus: TcxGridDBColumn;
    FDQueryCompras: TFDQuery;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonEstatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FolioUsuario:Integer;
  end;

var
  FormCatalogoCompras: TFormCatalogoCompras;

implementation

{$R *.dfm}

uses catalogoProveedor, Compra, AltaCompra, DataModuleInventarios, MainMenu;

procedure TFormCatalogoCompras.FormActivate(Sender: TObject);
begin
  DataSourceCompras.DataSet.Refresh;
end;

procedure TFormCatalogoCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormCatalogoCompras.SpeedButton1Click(Sender: TObject);
begin
  TFormCatalogoProveedores.Create(Self).Show;
end;

procedure TFormCatalogoCompras.SpeedButtonAgregarClick(Sender: TObject);
begin
   FormAltacompra.Show;
   FormAltacompra.ComboBoxTipoCompra.SetFocus;

  With datamodule1.fdQueryusuario do
   Begin
     Sql.Clear;
     Sql.Add('Select "CMSoftware"."Folios".num_folio,"CMSoftware"."Folios".serie from "CMSoftware"."Folios","CMSoftware"."Usuario" where "CMSoftware"."Usuario".id_usuario=:param1 ');
     Sql.Add('and  "CMSoftware"."Folios".id_folio = "CMSoftware"."Usuario"."id_folioOC"');
     Params[0].AsInteger:=StrToInt(RightStr(FormMAinMenu.StatusBarMainMenu.Panels[0].Text,3));
     open;
     FolioUsuario:=Fields[0].AsInteger;
     FormAltacompra.EditNumeroCompra.Text:=Fields[1].AsString+''+Fields[0].AsString;
     FormAltacompra.LabelFolio.Caption:=Fields[0].AsString;
     FormAltacompra.Caption:='Alta de compra '+' '+'[Compra Núm. ' +FormAltacompra.EditNumeroCompra.Text+']';
   End;
     FormAltacompra.DateTimePickerFecha.Date:=Date;
end;

procedure TFormCatalogoCompras.SpeedButtonEstatusClick(Sender: TObject);
Var
  Delete:Integer;
begin
  Delete:=Application.MessageBox('¿Desea Cancelar este documento?','¡Confirmando!',MB_YESNO);
  if Delete=IDYES then
     Begin
     if DataSourceCompras.dataset.fields[11].AsString='Cancelado' then
     ShowMessage('El documento ya se encuentra cancelado') else
       Begin
        With FDQueryCompras do
        Begin
          Sql.Clear;
          Sql.Add('Update "CMSoftware"."Encabezado_compra" set estatus=:param1 where num_compra=:param2');
          Params[0].AsString:='Cancelado';
          Params[1].AsString:=DataSourceCompras.DataSet.Fields[0].AsString;
          ExecSQL;
          DataSourceCompras.DataSet.Refresh;
        End;
     End;
    End
    else
end;

procedure TFormCatalogoCompras.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
