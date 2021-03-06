unit Entidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFormEntidades = class(TForm)
    GroupBoxTiposdeEquipos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditClave: TEdit;
    EditTipoEquipo: TEdit;
    MemoUbicacion: TMemo;
    BitBtnGuardar: TBitBtn;
    BitBtnCerrar: TBitBtn;
    Label4: TLabel;
    EditResponsable: TEdit;
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure BitBtnGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEntidades: TFormEntidades;

implementation

{$R *.dfm}

uses DataModuleInventarios;

procedure TFormEntidades.BitBtnCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFormEntidades.BitBtnGuardarClick(Sender: TObject);
var
  Save:Integer;
begin
  if BitBtnGuardar.Caption='&Guardar' then
    begin
      Save:=Application.MessageBox('┐Desea Guardar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With DataModule1.FDQueryEntidades do //Inserta el producto nuevo
              begin
                 sql.Clear;
                 Sql.Add('Insert into "CMSoftware"."Entidades" (id_entidad,nombre_entidad,ubicacion,responsable)');
                 Sql.Add('values(:param1,:param2,:param3,:param4)');

                 Params[0].AsInteger:=StrTOInt(EditClave.Text);
                 Params[1].AsString:=EditTipoEquipo.Text;
                 Params[2].AsString:=MemoUbicacion.Text;
                 Params[3].AsString:=EditResponsable.Text;
                 ExecSQL;

                  CLOSE;
          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 EditClave.Clear;
                 EditTipoEquipo.Clear;
                 MemoUbicacion.Lines.Clear;
                 EditResponsable.Clear;
              end;
          end;

    end
  else
  if BitBtnGuardar.Caption='&Modificar' then
    begin
      Save:=Application.MessageBox('┐Desea Modificar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With DataModule1.FDQueryEntidades do //Actualiza el equipo
              begin
                 sql.Clear;
                 Sql.Add('Update "CMSoftware"."Entidades" set id_entidad=:param1,nombre_entidad=:param2,ubicacion=:param3,responsable=:param4');
                 Sql.Add('where id_entidad=:param1');

                 Params[0].AsInteger:=StrToInt(EditClave.Text);
                 Params[1].AsString:=EditTipoEquipo.Text;
                 Params[2].AsString:=MemoUbicacion.Text;
                 Params[3].AsString:=EditResponsable.Text;
                 ExecSQL;

            end;
          end;

    end
end;

procedure TFormEntidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 EditClave.Clear;
                 EditTipoEquipo.Clear;
                 MemoUbicacion.Lines.Clear;
                 EditResponsable.Clear;
end;

end.
