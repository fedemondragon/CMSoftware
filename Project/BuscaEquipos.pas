unit BuscaEquipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormBuscaEquipos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNombre: TEdit;
    BitBtnBusca: TBitBtn;
    BitBtnTodos: TBitBtn;
    DBGridEquipos: TDBGrid;
    DataSourceBuscaEquipos: TDataSource;
    FDQueryBuscaEquipos: TFDQuery;
    FDQueryBuscaEquiposid_equipo: TFMTBCDField;
    FDQueryBuscaEquipostipo_equipo: TWideStringField;
    FDQueryBuscaEquiposcapacidad: TWideStringField;
    FDQueryBuscaEquiposidentificador: TWideStringField;
    FDQueryBuscaEquiposcodigo: TWideStringField;
    FDQueryBuscaEquiposclasificacion1: TWideStringField;
    FDQueryBuscaEquiposruta: TWideStringField;
    FDQueryBuscaEquiposeconomico: TWideStringField;
    procedure BitBtnBuscaClick(Sender: TObject);
    procedure BitBtnTodosClick(Sender: TObject);
    procedure DBGridEquiposDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_TIPO:Integer;
    Equipo:String;
  end;

var
  FormBuscaEquipos: TFormBuscaEquipos;

implementation

{$R *.dfm}

uses OrdenServicio, AltaCompra, BuscaProveedor, DataModuleInventarios;

procedure TFormBuscaEquipos.BitBtnBuscaClick(Sender: TObject);
begin
 Begin
     With FDQueryBuscaEquipos do
    begin
      Sql.Clear;
      Sql.Add('Select id_equipo,tipo_equipo,capacidad,identificador,codigo,clasificacion1,ruta,economico from "CMSoftware"."Equipo" where tipo_equipo like :param1 ');
      Params[0].AsString:=EditNombre.Text+'%';
      open;
    end;
end;
end;

procedure TFormBuscaEquipos.BitBtnTodosClick(Sender: TObject);
begin
 Begin
       With FDQueryBuscaEquipos do
    begin
      Sql.Clear;
      Sql.Add('Select id_equipo,tipo_equipo,capacidad,identificador,codigo,clasificacion1,ruta,economico from "CMSoftware"."Equipo" order by tipo_equipo');
      open;
    end;
 End;
end;

procedure TFormBuscaEquipos.DBGridEquiposDblClick(Sender: TObject);
begin
  Equipo:=DataSourceBuscaEquipos.DataSet.Fields[1].AsString;
  FormOrdenServicio.EditRuta.Text:=DataSourceBuscaEquipos.DataSet.Fields[6].AsString;
  FormOrdenServicio.EditEconomico.Text:=DataSourceBuscaEquipos.DataSet.Fields[7].AsString;
    FormOrdenServicio.ComboBoxEquipos.text:=(Equipo);
    FormOrdenServicio.ComboBoxEquipos.SetFocus;
    FormBuscaEquipos.Close;
end;

end.
