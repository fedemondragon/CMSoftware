unit TipoEquipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormTipoEquipos = class(TForm)
    GroupBoxTiposdeEquipos: TGroupBox;
    EditClave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditTipoEquipo: TEdit;
    MemoObservaciones: TMemo;
    BitBtnCerrar: TBitBtn;
    BitBtnGuardar: TBitBtn;
    Label3: TLabel;
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure BitBtnGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTipoEquipos: TFormTipoEquipos;

implementation

{$R *.dfm}

uses DataModuleInventarios;

procedure TFormTipoEquipos.BitBtnCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFormTipoEquipos.BitBtnGuardarClick(Sender: TObject);
var
  Save:Integer;
begin
  if BitBtnGuardar.Caption='&Guardar' then
    begin
      Save:=Application.MessageBox('┐Desea Guardar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With DataModule1.FDQueryTipo_equipo do //Inserta el tipo de equipo
              begin
                 sql.Clear;
                 Sql.Add('Insert into "CMSoftware"."Tipo_equipo" (id_tipo,descripcion,observaciones)');
                 Sql.Add('values(:param1,:param2,:param3)');

                 Params[0].AsInteger:=StrTOInt(EditClave.Text);
                 Params[1].AsString:=EditTipoEquipo.Text;
                 Params[2].AsString:=MemoObservaciones.Text;
                 ExecSQL;
                  CLOSE;
          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 EditClave.Clear;
                 EditTipoEquipo.Clear;
                 MemoObservaciones.Lines.Clear;
              end;
          end;

    end
  else
  if BitBtnGuardar.Caption='&Modificar' then
    begin
      Save:=Application.MessageBox('┐Desea Modificar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With datamoduleinventarios.DataModule1.FDQueryProducto do //Actualiza el equipo
              begin
                 sql.Clear;
                 Sql.Add('Update "CMSoftware"."Tipo_equipo"  set id_tipo=:param1,descripcion=:param2,observaciones=:param3');
                 Sql.Add('where id_tipo=:param1');

                 Params[0].AsInteger:=StrToInt(EditClave.Text);
                 Params[1].AsString:=EditTipoEquipo.Text;
                 Params[2].AsString:=MemoObservaciones.Text;
                 ExecSQL;

            end;
          end;

    end


end;

procedure TFormTipoEquipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      EditClave.Clear;
      EditTipoEquipo.Clear;
      MemoObservaciones.Lines.Clear;

end;

end.
