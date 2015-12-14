unit BuscaTipoEquipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormBuscaTipoEquipo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNombre: TEdit;
    BitBtnBusca: TBitBtn;
    BitBtnTodos: TBitBtn;
    DBGridEquipos: TDBGrid;
    FDQueryBuscaTiposEquipos: TFDQuery;
    DataSourceBuscaTipoEquipos: TDataSource;
    FDQueryBuscaTiposEquiposid_tipo: TFMTBCDField;
    FDQueryBuscaTiposEquiposdescripcion: TWideStringField;
    FDQueryBuscaTiposEquiposobservaciones: TWideStringField;
    procedure BitBtnBuscaClick(Sender: TObject);
    procedure BitBtnTodosClick(Sender: TObject);
    procedure DBGridEquiposDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TipoEquipo:String;
  end;

var
  FormBuscaTipoEquipo: TFormBuscaTipoEquipo;

implementation

{$R *.dfm}

uses OrdenServicio, BuscaEquipos, Equipo;

procedure TFormBuscaTipoEquipo.BitBtnBuscaClick(Sender: TObject);
begin
    With FDQueryBuscaTiposEquipos do
    begin
      Sql.Clear;
      Sql.Add('Select id_tipo,descripcion,observaciones from "CMSoftware"."Tipo_equipo" where descripcion like :param1');
      Params[0].AsString:=EditNombre.Text+'%';
      open;
    end;

end;

procedure TFormBuscaTipoEquipo.BitBtnTodosClick(Sender: TObject);
begin
   With FDQueryBuscaTiposEquipos do
    begin
      Sql.Clear;
      Sql.Add('Select id_tipo,descripcion,observaciones from "CMSoftware"."Tipo_equipo"order by descripcion');
      open;
    end;
end;

procedure TFormBuscaTipoEquipo.DBGridEquiposDblClick(Sender: TObject);
begin
    TipoEquipo:=DataSourceBuscaTipoEquipos.DataSet.Fields[1].AsString;    //PARA EL MODULO DE EQUIPO
   if  FormBuscaTipoEquipo.Caption='B�squeda de Tipo de Equipos [Equipo]' then
       Begin
         FormEquipos.ComboBoxTipoEquipo.Text:=TipoEquipo;
         FormEquipos.ComboBoxTipoEquipo.SetFocus;
         FormBuscaTipoEquipo.Close;

       End
     else
     Begin
      FormOrdenServicio.ComboBoxTipoEquipo.text:=(TipoEquipo); //PARA EL MODULO DE ORDEN DE SERVICIO
      FormOrdenServicio.ComboBoxTipoEquipo.SetFocus;
      FormBuscaTipoEquipo.Close;
     End;

end;

procedure TFormBuscaTipoEquipo.FormActivate(Sender: TObject);
begin
   BitBtnTodos.Click;
end;

end.
