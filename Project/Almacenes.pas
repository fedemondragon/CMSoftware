unit Almacenes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFormAlmacenes = class(TForm)
    DBEditIdAlmacen: TDBEdit;
    DBEditDescripcion: TDBEdit;
    DBEditCentroCostos: TDBEdit;
    DBEditObservaciones: TDBEdit;
    DBGridDetalle: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator1: TDBNavigator;
    FDTableAlmacenes: TFDTable;
    DataSourceAlmacenes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlmacenes: TFormAlmacenes;

implementation

{$R *.dfm}

end.
