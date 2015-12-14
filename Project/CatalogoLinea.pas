unit CatalogoLinea;

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
  FireDAC.Comp.UI, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TFormCatalogoLinea = class(TForm)
    cxGridCentroCostos: TcxGrid;
    cxGridCentroCostosDBTableView1: TcxGridDBTableView;
    cxGridCentroCostosLevel1: TcxGridLevel;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    FDGUIxWaitCursorLinea: TFDGUIxWaitCursor;
    FDTableLinea: TFDTable;
    DataSourceLinea: TDataSource;
    cxGridCentroCostosDBTableView1id_linea: TcxGridDBColumn;
    cxGridCentroCostosDBTableView1descripcion: TcxGridDBColumn;
    cxGridCentroCostosDBTableView1centro_costos: TcxGridDBColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButtonModificarClick(Sender: TObject);
    procedure SpeedButtonEliminarClick(Sender: TObject);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCatalogoLinea: TFormCatalogoLinea;

implementation

{$R *.dfm}

uses LineaProducto, CentroCostos, DataModuleInventarios;

procedure TFormCatalogoLinea.FormActivate(Sender: TObject);
begin
  DataSourceLinea.DataSet.Refresh;
end;

procedure TFormCatalogoLinea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormCatalogoLinea.SpeedButtonAgregarClick(Sender: TObject);
begin
  FormLineaProducto.Show;
  FormLineaProducto.Editlinea.Setfocus;
  FormLineaProducto.BitBtnGuardar.Caption:='&Guardar';

end;

procedure TFormCatalogoLinea.SpeedButtonEliminarClick(Sender: TObject);
var
  linea:String;
  Delete:Integer;
begin
  linea:=DataSourceLinea.DataSet.Fields[0].AsString;
    begin
      Delete:=Application.MessageBox('┐Estas seguro de borrar el registro seleccionado?','íConfirmando!',MB_YESNOCANCEL);
        if Delete=IDYES then
          begin
            With FormLineaProducto.FDQueryLinea do //borra linea
              begin
                 sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."Linea" where id_linea=:param1');
                 Params[0].AsString:=linea;
                 ExecSQL;
                 DataSourceLinea.DataSet.Refresh;
              end;
          end;
    end;

end;

procedure TFormCatalogoLinea.SpeedButtonModificarClick(Sender: TObject);
var
  linea:String;
begin

  linea:=DataSourceLinea.DataSet.Fields[0].AsString;
With DataModule1.FDQueryLinea do //consulta y modifica la linea del producto
              begin
                 Close;
                 sql.Clear;
                 Sql.Add('select id_linea,descripcion,centro_costos');
                 Sql.Add('from "CMSoftware"."Linea" where id_linea=:param1');
                 Params[0].AsString:=linea;
                 open;

            With FormLineaProducto do
               begin
                 EditLinea.Text:=Fields[0].AsString;
                 EditDescripcion.Text:=Fields[1].AsString;
                 ComboBoxCuentaContable.Text:=Fields[2].AsString;
                BitBtnGuardar.Caption:='&Modificar';
               end;
             end;
  FormLineaProducto.Show;

end;

procedure TFormCatalogoLinea.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
