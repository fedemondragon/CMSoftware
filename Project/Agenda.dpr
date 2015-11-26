program Agenda;

uses
  Forms,
  DBDemoMainUnit in 'C:\Program Files (x86)\Embarcadero\Studio\15.0\componentes\DevExpress VCL 14.1.2 XE7\ExpressScheduler\Demos\Delphi\DBDemo\DBDemoMainUnit.pas' {DBDemoMainForm},
  DemoUtils in 'C:\Program Files (x86)\Embarcadero\Studio\15.0\componentes\DevExpress VCL 14.1.2 XE7\ExpressScheduler\Demos\Delphi\Common\DemoUtils.pas',
  AboutDemoForm in 'C:\Program Files (x86)\Embarcadero\Studio\15.0\componentes\DevExpress VCL 14.1.2 XE7\ExpressScheduler\Demos\Delphi\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in 'C:\Program Files (x86)\Embarcadero\Studio\15.0\componentes\DevExpress VCL 14.1.2 XE7\ExpressScheduler\Demos\Delphi\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  SkinDemoUtils in 'C:\Program Files (x86)\Embarcadero\Studio\15.0\componentes\DevExpress VCL 14.1.2 XE7\ExpressScheduler\Demos\Delphi\Common\SkinDemoUtils.pas';

{$R *.res}
{$IF defined(VER220) or defined(VER210) or defined(VER185) or defined(VER150)}
  {$R WindowsXP.res}
{$IFEND}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler DBDemo';
  Application.CreateForm(TDBDemoMainForm, DBDemoMainForm);
  Application.Run;
end.
