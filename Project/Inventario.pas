unit Inventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, dxServerModeData,
  dxServerModeFireDACDataSource, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TFormInventario = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    cxGridInventariosDBTableView1: TcxGridDBTableView;
    cxGridInventariosLevel1: TcxGridLevel;
    cxGridInventarios: TcxGrid;
    DataSourceInventarios: TDataSource;
    FDTableInventarios: TFDTable;
    FDGUIxWaitCursorInventarios: TFDGUIxWaitCursor;
    cxGridInventariosDBTableView1id_clave: TcxGridDBColumn;
    cxGridInventariosDBTableView1descripcion: TcxGridDBColumn;
    cxGridInventariosDBTableView1tipo_producto: TcxGridDBColumn;
    cxGridInventariosDBTableView1linea: TcxGridDBColumn;
    cxGridInventariosDBTableView1control: TcxGridDBColumn;
    cxGridInventariosDBTableView1unidad_ent: TcxGridDBColumn;
    cxGridInventariosDBTableView1unidad_sal: TcxGridDBColumn;
    cxGridInventariosDBTableView1factor_uni: TcxGridDBColumn;
    cxGridInventariosDBTableView1unidad_emp: TcxGridDBColumn;
    cxGridInventariosDBTableView1precio_lista: TcxGridDBColumn;
    cxGridInventariosDBTableView1existencia: TcxGridDBColumn;
    cxGridInventariosDBTableView1stock_min: TcxGridDBColumn;
    cxGridInventariosDBTableView1stock_max: TcxGridDBColumn;
    SpeedButtonSalir: TSpeedButton;
    cxGridPopupMenuInventarios: TcxGridPopupMenu;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton5: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
  cuenta:Integer;

  end;

var
  FormInventario: TFormInventario;

implementation

{$R *.dfm}

uses Producto, DataModuleInventarios, CatalogoCentroCostos, CatalogoLinea,
  Almacenes, MovimientosInventario;

procedure TFormInventario.FormActivate(Sender: TObject);
begin
  DataSourceInventarios.DataSet.Refresh;
end;

procedure TFormInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormInventario.SpeedButton1Click(Sender: TObject);
begin
  TFormMovimientosInventario.Create(Self).Show;
end;

procedure TFormInventario.SpeedButton3Click(Sender: TObject);
begin
   TFormCatalogoLinea.Create(Self).Show;
end;

procedure TFormInventario.SpeedButton4Click(Sender: TObject);
begin
  TFormCatalogoCentroCostos.Create(SElf).Show;
end;

procedure TFormInventario.SpeedButton5Click(Sender: TObject);
begin
  FormAlmacenes.show;
end;

procedure TFormInventario.SpeedButtonAgregarClick(Sender: TObject);

begin


  FormProductos.Show;
  FormProductos.TabbedNotebook1.PageIndex:=0;
  FormProductos.Editid_producto.text:=IntToStr(cuenta);
  FormProductos.MemoDescripción.SetFocus;
  FormProductos.BitBtnGuardar.Caption:='&Guardar';
end;

procedure TFormInventario.SpeedButtonModificarClick(Sender: TObject);
var
  Clave_producto:String;
begin

  FormProductos.TabbedNotebook1.PageIndex:=0;
  Clave_producto:=DataSourceInventarios.DataSet.Fields[0].AsString;

With datamoduleinventarios.DataModule1.FDQueryProducto do //consulta el producto
              begin
                 Close;
                 sql.Clear;
                 Sql.Add('select id_clave,descripcion,tipo_producto,linea,control,');
                 Sql.Add('unidad_ent,unidad_sal,factor_uni,unidad_emp,precio_lista,moneda,centro_costos,impuesto,');
                 Sql.Add('existencia,stock_min,stock_max,proveedor,promedio,ultimo_costo,cantidad_acumulada,monto_acum,fecha_ult_com,observaciones,campolibre1,');
                 Sql.Add('campolibre2,campolibre3,descrip_libre1,descrip_libre2,descrip_libre3 from "CMSoftware"."Producto"');
                 Sql.Add('where id_clave=:param1');
                 Params[0].AsString:= Clave_producto;
                 open;

                 With FormProductos do
                  begin
                 Editid_producto.Text:=Fields[0].AsString;
                   MemoDescripción.Text:=Fields[1].AsString;

                    if Fields[2].AsString='1' then
                       RadioButtonProducto.Checked:=true else
                    if Fields[2].AsString='2' then
                       RadioButtonServicio.Checked:=true else
                    if Fields[2].AsString='3' then
                       RadioButtonKit.Checked:=true;


                 EditLinea.Text:=Fields[3].AsString;
                 EditControlAlmacen.text:=Fields[4].AsString;
                 EditUnidad_entrada.Text:=Fields[5].AsString;
                 EditUnidad_salida.Text:=Fields[6].AsString;
                 EditFactor_unidades.Text:=Fields[7].AsString;
                 EditUnidad_empaque.Text:=Fields[8].AsString;
                 EditPrecioLista.Text:=Fields[9].AsString;
                 EditMoneda.Text:=Fields[10].AsString;
                 EditCentroCostos.Text:=Fields[11].AsString;
                 EditIVA.Text:=Fields[12].AsString;
                 EditExistencia.Text:=Fields[13].AsString;
                 EditStockMin.Text:=Fields[14].AsString;
                 EditStockMax.Text:=Fields[15].AsString;
                 Editproveedor.Text:=Fields[16].AsString;
                 EditPromedio.Text:=Fields[17].AsString;
                 EditUltimo.Text:=Fields[18].AsString;
                 EditCantidadAcumulada.Text:=Fields[19].AsString;
                 EditmontoAcumulado.Text:=Fields[20].AsString;
                 EditFechaUltimaCompra.Text:=Fields[21].AsString;
                 MemoObserva.Text:=Fields[22].AsString;
                 EditCampoLibre1.Text:=Fields[23].AsString;
                 EditCampoLibre2.Text:=Fields[24].AsString;
                 EditCampoLibre3.Text:=Fields[25].AsString;
                 EditDescripcionLibre1.Text:=Fields[26].AsString;
                 EditDescripcionLibre2.Text:=Fields[27].AsString;
                 EditDescripcionLibre3.Text:=Fields[28].AsString;

                 BitBtnGuardar.Caption:='&Modificar';
                  end;
  end;
  FormProductos.Show;
end;

procedure TFormInventario.SpeedButtonEliminarClick(Sender: TObject);
var
  Clave_producto:String;
  Delete:Integer;
  Msg:string;
begin
  Clave_producto:=DataSourceInventarios.DataSet.Fields[0].AsString;
//  Msg:=DataSourceInventarios.DataSet.Fields[1].AsString;
    begin
      Delete:=Application.MessageBox('¿Estas seguro de borrar el registro seleccionado?','¡Confirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With datamoduleinventarios.DataModule1.FDQueryProducto do //Inserta el producto nuevo
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Producto" where id_clave=:param1');
                 Params[0].AsString:=Clave_producto;
                 ExecSQL;
                 DataSourceInventarios.DataSet.Refresh;
              end;
          end;
    end;
end;

procedure TFormInventario.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;


end.
