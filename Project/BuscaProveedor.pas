unit BuscaProveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormBuscaProveedor = class(TForm)
    Panel1: TPanel;
    EditNombre: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSourceBuscaProveedor: TDataSource;
    FDQueryBuscaProveedor: TFDQuery;
    FDQueryBuscaProveedorid_proveedor: TFMTBCDField;
    FDQueryBuscaProveedornombre: TWideStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      id_proveedor:Integer;
  end;

var
  FormBuscaProveedor: TFormBuscaProveedor;

implementation

{$R *.dfm}

uses Compra, AltaCompra;

procedure TFormBuscaProveedor.BitBtn1Click(Sender: TObject);
begin
    With FDQueryBuscaProveedor do
    begin
      Sql.Clear;
      Sql.Add('Select id_proveedor,nombre from "CMSoftware"."Proveedor" where nombre like :param1');
      Params[0].AsString:=EditNombre.Text+'%';
      open;
    end;
end;

procedure TFormBuscaProveedor.DBGrid1DblClick(Sender: TObject);


begin
    id_proveedor:=StrToInt(DataSourceBuscaProveedor.DataSet.Fields[0].AsString);
    FormAltacompra.Editid_proveedor.Text:=IntToStr(id_proveedor);
    FormAltacompra.Editid_proveedor.SetFocus;
    FormBuscaProveedor.Close;




end;

end.
