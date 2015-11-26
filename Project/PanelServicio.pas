unit PanelServicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin;

type
  TFormServicio = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButtonModificar: TSpeedButton;
    SpeedButtonEliminar: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButtonImprimirClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServicio: TFormServicio;

implementation

{$R *.dfm}

uses Planeador, SolicitudServicio;

procedure TFormServicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFormServicio.SpeedButtonAgregarClick(Sender: TObject);
begin
  TFormSolicitudServicio.Create(Self).Show;
end;

procedure TFormServicio.SpeedButtonImprimirClick(Sender: TObject);
begin
  TFormPlaneador.Create(Self).Show;
end;

procedure TFormServicio.SpeedButtonSalirClick(Sender: TObject);
begin
  close;
end;

end.
