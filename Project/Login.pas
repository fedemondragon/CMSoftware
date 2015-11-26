unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormLogin = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditUsuario: TEdit;
    EditContra: TEdit;
    BitBtnSalir: TBitBtn;
    FDQueryLogin: TFDQuery;
    BitBtnEntrar: TBitBtn;
    procedure BitBtnSalirClick(Sender: TObject);
    procedure BitBtnEntrarClick(Sender: TObject);
    procedure EditUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EditContraKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Usuario:Integer;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses MainMenu;

procedure TFormLogin.BitBtnEntrarClick(Sender: TObject);
var
  permiso:Integer;
begin
  Usuario:=StrToInt(EditUsuario.Text);

  With FDQueryLogin do
  Begin
    Sql.Clear;
    Sql.Add('Select count(*) from  "CMSoftware"."Usuario" where id_usuario=:param1 and contrasena=:param2 and estatus=:param3 ');
    Params[0].AsInteger:=StrToInt(EditUsuario.Text);
    Params[1].AsString:=EditContra.Text;
    Params[2].AsInteger:=1;
    open;
    permiso:=Fields[0].AsInteger;
  End;
 if permiso=1 then

  With FDQueryLogin do
    Begin
     Sql.clear;
     Sql.Add('Select id_usuario,nombre,contrasena,compras,usuarios,inventario,servicios,ot,reportes,estatus,privilegio');
     Sql.Add('from "CMSoftware"."Usuario" where id_usuario=:param1');
     Params[0].AsInteger:=StrToInt(EditUsuario.Text);
     open;
     FormLogin.close;
     FormMainMenu.StatusBarMainMenu.Panels[0].Text:='Usuario:  '+ Fields[0].AsString;
     FormMainMenu.StatusBarMainMenu.Panels[1].Text:=Fields[1].AsString;
     FormMainMenu.StatusBarMainMenu.Panels[2].Text:=Fields[10].AsString;
     FormMainMenu.Enabled:=True;
     FormMainMenu.Show;
    End
  else
ShowMessage('¡El nombre del usuario o la contreaseña son incorrectos!');



end;

procedure TFormLogin.BitBtnSalirClick(Sender: TObject);
begin
  FormMainMenu.Close;
  EditUsuario.Clear;
  EditContra.Clear;
end;

procedure TFormLogin.EditContraKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    BitBtnEntrar.SetFocus;

end;

procedure TFormLogin.EditUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    EditContra.SetFocus;
end;

procedure TFormLogin.FormActivate(Sender: TObject);
begin
  FormMainMenu.Enabled:=False;
end;

end.
