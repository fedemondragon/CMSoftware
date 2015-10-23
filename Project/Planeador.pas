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
  cxSchedulerAggregateStorage;

type
  TFormPlaneador = class(TForm)
    cxScheduler1: TcxScheduler;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPlaneador: TFormPlaneador;

implementation

{$R *.dfm}

end.
