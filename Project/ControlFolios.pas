unit ControlFolios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormFolios = class(TForm)
    FDTableFolios: TFDTable;
    DBNavigator1: TDBNavigator;
    DBGridDetalle: TDBGrid;
    DBEditDescripcion: TDBEdit;
    DBEditSerie: TDBEdit;
    DBEditFolio: TDBEdit;
    DBEditID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DataSourceFolios: TDataSource;
    procedure DBEditIDKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditSerieKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditFolioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFolios: TFormFolios;

implementation

{$R *.dfm}

procedure TFormFolios.DBEditDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
   if KEY=#13  then
  DBEditSerie.SetFocus;

end;

procedure TFormFolios.DBEditFolioKeyPress(Sender: TObject; var Key: Char);
begin
   if KEY=#13  then
  DBGridDetalle.SetFocus;

end;

procedure TFormFolios.DBEditIDKeyPress(Sender: TObject; var Key: Char);
begin
   if KEY=#13  then
  DBEditDescripcion.SetFocus;
end;

procedure TFormFolios.DBEditSerieKeyPress(Sender: TObject; var Key: Char);
begin
   if KEY=#13  then
  DBEditFolio.SetFocus;

end;

end.
