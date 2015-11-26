unit Planeador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxSchedulerRibbonStyleEventEditor, Vcl.Menus, cxStyles,
  cxEdit, cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerRecurrence, cxSchedulerTreeListBrowser,
  cxSchedulercxGridConnection, cxSchedulerDBStorage, cxClasses,
  cxSchedulerAggregateStorage, Vcl.StdCtrls, cxContainer, Vcl.ExtCtrls,
  cxCheckBox, cxButtons, cxGroupBox, Data.DB, dxmdaset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ToolWin;

type
  TFormPlaneador = class(TForm)
    cxSchedulerAgenda: TcxScheduler;
    cxSchedulerStorageAgenda: TcxSchedulerStorage;
    lfController: TcxLookAndFeelController;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormPlaneador: TFormPlaneador;

implementation

{$R *.dfm}

uses SolicitudServicio;

procedure TFormPlaneador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
cxSchedulerStorageAgenda.SaveToFile('C:\CMSoftware\Project\Win32\Agenda.dat');
  Action:=caFree;
end;

procedure TFormPlaneador.FormShow(Sender: TObject);
begin
cxSchedulerStorageAgenda.LoadFromFile('C:\CMSoftware\Project\Win32\Agenda.dat');
end;



procedure TFormPlaneador.SpeedButtonAgregarClick(Sender: TObject);
begin
  TFormSolicitudServicio.Create(Self).Show;
end;

procedure TFormPlaneador.SpeedButtonSalirClick(Sender: TObject);
begin
cxSchedulerStorageAgenda.SaveToFile('C:\CMSoftware\Project\Win32\Agenda.dat');
  close;
end;

end.
