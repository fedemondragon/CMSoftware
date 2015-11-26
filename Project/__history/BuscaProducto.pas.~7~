unit BuscaProducto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormBuscaProducto = class(TForm)
    EditDescripcion: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSourceBuscaProducto: TDataSource;
    FDQueryBuscaProducto: TFDQuery;
    EditId_producto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    FDQueryBuscaProductoid_clave: TWideStringField;
    FDQueryBuscaProductodescripcion: TWideStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuscaProducto: TFormBuscaProducto;

implementation

{$R *.dfm}

uses AltaCompra;

procedure TFormBuscaProducto.BitBtn1Click(Sender: TObject);
begin
  if EditId_producto.Text<>'' then
    With FDQueryBuscaProducto do
    begin
      Sql.Clear;
      Sql.Add('Select id_clave,descripcion from "CMSoftware"."Producto" where id_clave like :param1');
      Params[0].AsString:=EditId_producto.Text+'%';
      open;
    end
   else
  if EditDescripcion.Text<>'' then
    With FDQueryBuscaProducto do
    begin
      Sql.Clear;
      Sql.Add('Select id_clave,descripcion from "CMSoftware"."Producto" where descripcion like :param1');
      Params[0].AsString:=EditDescripcion.Text+'%';
      open;
    end;


end;

procedure TFormBuscaProducto.DBGrid1DblClick(Sender: TObject);
var
  id_clave:String;
begin
    id_clave:=DataSourceBuscaProducto.DataSet.Fields[0].AsString;
    FormAltacompra.EditProducto.Text:=id_clave;
    FormAltacompra.EditProducto.SetFocus;
    FormBuscaProducto.Close;

end;

end.
