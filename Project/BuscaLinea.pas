unit BuscaLinea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormBuscaLinea = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNombre: TEdit;
    BitBtnBusca: TBitBtn;
    BitBtnTodos: TBitBtn;
    DBGridCuenta: TDBGrid;
    DataSourceBuscaLinea: TDataSource;
    FDQueryBuscaLinea: TFDQuery;
    FDQueryBuscaLineaid_linea: TWideStringField;
    FDQueryBuscaLineadescripcion: TWideStringField;
    FDQueryBuscaLineacentro_costos: TWideStringField;
    procedure BitBtnBuscaClick(Sender: TObject);
    procedure BitBtnTodosClick(Sender: TObject);
    procedure DBGridCuentaDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Linea:String;
  end;

var
  FormBuscaLinea: TFormBuscaLinea;

implementation

{$R *.dfm}

uses Producto, Equipo, BuscaCuentas;

procedure TFormBuscaLinea.BitBtnBuscaClick(Sender: TObject);
begin
    With FDQueryBuscaLinea do
    begin
      Sql.Clear;
      Sql.Add('Select * from "CMSoftware"."Linea" where descripcion like :param1 order by descripcion');
      Params[0].AsString:=EditNombre.Text+'%';
      open;
    end;
end;

procedure TFormBuscaLinea.BitBtnTodosClick(Sender: TObject);
begin
   With FDQueryBuscaLinea do
    begin
      Sql.Clear;
      Sql.Add('Select * from "CMSoftware"."Linea" order by descripcion');
      open;
    end;

end;

procedure TFormBuscaLinea.DBGridCuentaDblClick(Sender: TObject);

begin

  Linea:=DataSourceBuscaLinea.DataSet.Fields[0].AsString;
  FormProductos.EditLinea.text:=Linea;
  FormProductos.EditLinea.SetFocus;
  FormBuscaLinea.Close;

end;

procedure TFormBuscaLinea.FormActivate(Sender: TObject);
begin
  With FDQueryBuscaLinea do
    begin
      Sql.Clear;
      Sql.Add('Select * from "CMSoftware"."Linea" order by descripcion');
      open;
    end;

end;

end.
