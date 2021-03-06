unit catalogoProveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, cxGridCustomPopupMenu,
  cxGridPopupMenu, FireDAC.Stan.Intf, FireDAC.Comp.UI, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCatalogoProveedores = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    SpeedButtonBuscar: TSpeedButton;
    SpeedButtonImprimir: TSpeedButton;
    SpeedButtonSalir: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cxGridProveedorDBTableView1: TcxGridDBTableView;
    cxGridProveedorLevel1: TcxGridLevel;
    cxGridProveedor: TcxGrid;
    FDGUIxWaitCursorProveedor: TFDGUIxWaitCursor;
    cxGridPopupMenuProveedor: TcxGridPopupMenu;
    DataSourceProveedores: TDataSource;
    FDTableProveedores: TFDTable;
    cxGridProveedorDBTableView1id_proveedor: TcxGridDBColumn;
    cxGridProveedorDBTableView1nombre: TcxGridDBColumn;
    cxGridProveedorDBTableView1calle: TcxGridDBColumn;
    cxGridProveedorDBTableView1num_ext: TcxGridDBColumn;
    cxGridProveedorDBTableView1num_int: TcxGridDBColumn;
    cxGridProveedorDBTableView1cp: TcxGridDBColumn;
    cxGridProveedorDBTableView1poblacion: TcxGridDBColumn;
    cxGridProveedorDBTableView1estado: TcxGridDBColumn;
    cxGridProveedorDBTableView1municipio: TcxGridDBColumn;
    cxGridProveedorDBTableView1colonia: TcxGridDBColumn;
    cxGridProveedorDBTableView1pais: TcxGridDBColumn;
    cxGridProveedorDBTableView1clasificacion: TcxGridDBColumn;
    cxGridProveedorDBTableView1rfc: TcxGridDBColumn;
    cxGridProveedorDBTableView1telefono: TcxGridDBColumn;
    cxGridProveedorDBTableView1pagina_web: TcxGridDBColumn;
    cxGridProveedorDBTableView1centro_costos: TcxGridDBColumn;
    ToolBar2: TToolBar;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cuenta:Integer;
  end;

var
  FormCatalogoProveedores: TFormCatalogoProveedores;

implementation

{$R *.dfm}

uses DataModuleInventarios, Producto, Proveedor;

procedure TFormCatalogoProveedores.FormActivate(Sender: TObject);
begin
  DataSourceProveedores.DataSet.Refresh;
end;

procedure TFormCatalogoProveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TFormCatalogoProveedores.SpeedButtonAgregarClick(Sender: TObject);
begin
      //Dame la ultima clave del PROVEEDOR
  With  DataModuleInventarios.DataModule1.FDQueryproveedor do
      Begin
        Close;
        sql.Clear;
        Sql.add('Select max(id_proveedor) from "CMSoftware"."Proveedor"');
        open;
        cuenta:=Fields[0].Asinteger + 1;
      End;
      //Asigna lave y abre modulo
  FormProveedor.Show;
  FormProveedor.TabbedNotebook1.PageIndex:=0;
  FormProveedor.EditClave.text:=IntToStr(cuenta);
  FormProveedor.EditNombre.SetFocus;
  FormProveedor.BitBtnGuardar.Caption:='&Guardar';
end;

procedure TFormCatalogoProveedores.SpeedButtonModificarClick(Sender: TObject);
var
  Clave_proveedor:Integer;
begin
 FormProveedor.TabbedNotebook1.PageIndex:=0;
  Clave_proveedor:=StrToInt(DataSourceProveedores.DataSet.Fields[0].AsString);
With datamoduleinventarios.DataModule1.FDQueryProveedor do //consulta el proveedor
              begin
                 Close;
                 sql.Clear;
                 Sql.Add('select id_proveedor,nombre,calle,num_ext,num_int,cp,poblacion,estado,');
                 Sql.Add('municipio,colonia,pais,clasificacion,rfc,telefono,pagina_web,centro_costos,');
                 Sql.Add('observaciones,campolibre1,campolibre2,campolibre3,descrip_libre1,descrip_libre2,descrip_libre3,monto_comprado,fecha_ultima_comp');
                 Sql.Add('from "CMSoftware"."Proveedor" where id_proveedor=:param1');
                 Params[0].AsInteger:=Clave_proveedor;
                 open;

            With FormProveedor do
               begin
                 EditClave.Text:=Fields[0].AsString;
                 EditNombre.Text:=Fields[1].AsString;
                 EditCalle.Text:=Fields[2].AsString;
                 EditNumext.Text:=Fields[3].AsString;
                 EditNumint.Text:=Fields[4].AsString;
                 EditCP.Text:=Fields[5].AsString;
                 EditPoblacion.Text:=Fields[6].AsString;
                 EditEstado.Text:=Fields[7].AsString;
                 EditMunicipio.Text:=Fields[8].AsString;
                 EditColonia.Text:=Fields[9].AsString;
                 EditPais.Text:=Fields[10].AsString;
                 EditClasificacion.Text:=Fields[11].AsString;
                 EditRFC.Text:=Fields[12].AsString;
                 EditTel.Text:=Fields[13].AsString;
                 Editweb.Text:=Fields[14].AsString;
                 EditCentroCostos.Text:=Fields[15].AsString;
                 MemoObservaciones.Lines.Text:=Fields[16].AsString;
                 EditLibre1.Text:=Fields[17].AsString;
                 EditLibre2.Text:=Fields[18].AsString;
                 EditLibre3.Text:=Fields[19].AsString;
                 EditCampo1.Text:=Fields[20].AsString;
                 EditCampo2.Text:=Fields[21].AsString;
                 EditCampo3.Text:=Fields[22].AsString;
                 EditMonto.Text:=Fields[23].AsString;
                 EditFechaUltimaCompra.Text:=Fields[24].AsString;
                 BitBtnGuardar.Caption:='&Modificar';
               end;
  end;
  FormProveedor.Show;

end;

procedure TFormCatalogoProveedores.SpeedButtonEliminarClick(Sender: TObject);
var
  Clave_proveedor:Integer;
  Delete:Integer;
begin
  Clave_proveedor:=StrToInt(DataSourceProveedores.DataSet.Fields[0].AsString);
    begin
      Delete:=Application.MessageBox('┐Estas seguro de borrar el registro seleccionado?','íConfirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With datamoduleinventarios.DataModule1.FDQueryProveedor do //Inserta el producto nuevo
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Proveedor" where id_proveedor=:param1');
                 Params[0].AsInteger:=Clave_proveedor;
                 ExecSQL;
                 DataSourceProveedores.DataSet.Refresh;
              end;
          end;
    end;

end;

procedure TFormCatalogoProveedores.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
