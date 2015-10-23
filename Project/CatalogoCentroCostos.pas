unit CatalogoCentroCostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridCustomPopupMenu,
  cxGridPopupMenu, FireDAC.Comp.UI, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFormCatalogoCentroCostos = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonBuscar: TSpeedButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    cxGridCentroCostosDBTableView1: TcxGridDBTableView;
    cxGridCentroCostosLevel1: TcxGridLevel;
    cxGridCentroCostos: TcxGrid;
    DataSourceCentroCostos: TDataSource;
    FDGUIxWaitCursorcentroCostos: TFDGUIxWaitCursor;
    cxGridPopupMenuCentroCostos: TcxGridPopupMenu;
    FDTableCentroCostos: TFDTable;
    cxGridCentroCostosDBTableView1id_cuenta: TcxGridDBColumn;
    cxGridCentroCostosDBTableView1descripcion: TcxGridDBColumn;
    cxGridCentroCostosDBTableView1tipo: TcxGridDBColumn;
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCatalogoCentroCostos: TFormCatalogoCentroCostos;

implementation

{$R *.dfm}

uses CentroCostos, DataModuleInventarios;

procedure TFormCatalogoCentroCostos.FormActivate(Sender: TObject);
begin
  DataSourceCentroCostos.DataSet.Refresh;
end;

procedure TFormCatalogoCentroCostos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormCatalogoCentroCostos.SpeedButtonAgregarClick(Sender: TObject);
begin
  FormCentroCostos.Show;
  FormCentroCostos.EditCuenta.Setfocus;
  FormCentroCostos.BitBtnGuardar.Caption:='&Guardar';

end;

procedure TFormCatalogoCentroCostos.SpeedButtonEliminarClick(Sender: TObject);
var
  cuenta_contable:String;
  Delete:Integer;
begin
  Cuenta_contable:=DataSourceCentroCostos.DataSet.Fields[0].AsString;
    begin
      Delete:=Application.MessageBox('¿Estas seguro de borrar el registro seleccionado?','¡Confirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With FormCentroCostos.FDQueryCentroCostos do //borra el centro de costos
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Centro_costos" where id_cuenta=:param1');
                 Params[0].AsString:=cuenta_contable;
                 ExecSQL;
                 DataSourceCentroCostos.DataSet.Refresh;
              end;
          end;
    end;

end;

procedure TFormCatalogoCentroCostos.SpeedButtonModificarClick(Sender: TObject);
var
  cuenta:String;
begin

  cuenta:=DataSourceCentroCostos.DataSet.Fields[0].AsString;
With DataModule1.FDQueryCentroCostos do //consulta y modifica el centro de costos
              begin
                 Close;
                 sql.Clear;
                 Sql.Add('select id_cuenta,descripcion,tipo');
                 Sql.Add('from "CMSoftware"."Centro_costos" where id_cuenta=:param1');
                 Params[0].AsString:=cuenta;
                 open;

            With FormCentroCostos do
               begin
                 EditCuenta.Text:=Fields[0].AsString;
                 EditDescripcion.Text:=Fields[1].AsString;
                 ComboBoxTipo.Text:=Fields[2].AsString;
                BitBtnGuardar.Caption:='&Modificar';
               end;
  end;
  FormCentroCostos.Show;
end;

procedure TFormCatalogoCentroCostos.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
