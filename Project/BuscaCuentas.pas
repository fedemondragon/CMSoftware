unit BuscaCuentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormBuscaCuentas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNombre: TEdit;
    BitBtnBusca: TBitBtn;
    BitBtnTodos: TBitBtn;
    DBGridCuenta: TDBGrid;
    DataSourceBuscaCuenta: TDataSource;
    FDQueryBuscaCuenta: TFDQuery;
    FDQueryBuscaCuentaid_cuenta: TWideStringField;
    FDQueryBuscaCuentadescripcion: TWideStringField;
    FDQueryBuscaCuentatipo: TWideStringField;
    procedure BitBtnBuscaClick(Sender: TObject);
    procedure BitBtnTodosClick(Sender: TObject);
    procedure DBGridCuentaDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cuenta,descripcion:String;
  end;

var
  FormBuscaCuentas: TFormBuscaCuentas;

implementation

{$R *.dfm}

uses DataModuleInventarios, OrdenServicio, BuscaEquipos, Equipo, Producto;

procedure TFormBuscaCuentas.BitBtnBuscaClick(Sender: TObject);
begin
    With FDQueryBuscaCuenta do
    begin
      Sql.Clear;
      Sql.Add('Select * from "CMSoftware"."Centro_costos" where descripcion like :param1 order by id_cuenta');
      Params[0].AsString:=EditNombre.Text+'%';
      open;
    end;

end;

procedure TFormBuscaCuentas.BitBtnTodosClick(Sender: TObject);
begin
    With FDQueryBuscaCuenta do
    begin
      Sql.Clear;
      Sql.Add('Select * from "CMSoftware"."Centro_costos" order by id_cuenta');
      open;
    end;

end;

procedure TFormBuscaCuentas.DBGridCuentaDblClick(Sender: TObject);
begin
if   FormBuscaCuentas.Caption='B�squeda de Centro de Costos [Equipos]' then
  Begin
  Cuenta:=DataSourceBuscaCuenta.DataSet.Fields[0].AsString;
  descripcion:=DataSourceBuscaCuenta.DataSet.Fields[1].AsString;
  FormEquipos.ComboBoxCentroCostos.text:=(Cuenta);
  FormEquipos.LabelCuenta.Caption:=descripcion;
  FormEquipos.ComboBoxCentroCostos.SetFocus;
  FormBuscaCuentas.Close;
  End
 else
if   FormBuscaCuentas.Caption='B�squeda de Centro de Costos [Producto]' then
  Begin
    Cuenta:=DataSourceBuscaCuenta.DataSet.Fields[0].AsString;
    FormProductos.EditCentroCostos.text:=(Cuenta);
    FormProductos.EditCentroCostos.SetFocus;
    FormBuscaCuentas.Close;
  End;

end;

procedure TFormBuscaCuentas.FormActivate(Sender: TObject);
begin
  BitBtnTodos.Click;
end;

end.