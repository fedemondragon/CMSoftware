unit Equipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.TabNotBk;

type
  TFormEquipos = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditEquipoNombre: TEdit;
    BitBtn1: TBitBtn;
    Editid_equipo: TEdit;
    EditCapacidad: TEdit;
    EditIdentificador: TEdit;
    EditCodigo: TEdit;
    ComboBoxPrioridad: TComboBox;
    BitBtn2: TBitBtn;
    EditClasificacion1: TEdit;
    EditClasificacion2: TEdit;
    Label9: TLabel;
    ComboBoxCentroCostos: TComboBox;
    Label10: TLabel;
    ComboBoxLocalizacion: TComboBox;
    BitBtnCerrar: TBitBtn;
    BitBtnGuardar: TBitBtn;
    GroupBox2: TGroupBox;
    MemoObservaciones: TMemo;
    GroupBox3: TGroupBox;
    EditCampolibre1: TEdit;
    EditCampolibre2: TEdit;
    EditCampolibre3: TEdit;
    EditDescribe1: TEdit;
    EditDescribe2: TEdit;
    EditDescribe3: TEdit;
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure BitBtnGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEquipos: TFormEquipos;

implementation

{$R *.dfm}

uses DataModuleInventarios;

procedure TFormEquipos.BitBtnCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFormEquipos.BitBtnGuardarClick(Sender: TObject);
var
  Save:Integer;
begin
  if BitBtnGuardar.Caption='&Guardar' then
    begin
      Save:=Application.MessageBox('┐Desea Guardar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With DataModule1.FDQueryEquipos do //Inserta el producto nuevo
              begin
                 sql.Clear;
                 Sql.Add('Insert into "CMSoftware"."Equipo" (id_equipo,tipo_equipo,capacidad,identificador,codigo,prioridad,clasificacion1,');
                 Sql.Add('clasificacion2,centro_costos,localizacion,observaciones,campo_libre1,campo_libre2,campo_libre3,');
                 Sql.Add('descrip_libre1,descrip_libre2,descrip_libre3) ');
                 Sql.Add('values(:param1,:param2,:param3,:param4,:param5,:param6,:param7,:param8,');
                 Sql.Add(':param9,:param10,:param11,:param12,:param13,:param14,:param15,:param16,:param17)');

                 Params[0].AsInteger:=StrTOInt(Editid_equipo.Text);
                 Params[1].AsString:=EditEquipoNombre.Text;
                 Params[2].AsString:=EditCapacidad.Text;
                 Params[3].AsString:=EditIdentificador.Text;
                 Params[4].AsString:=EditCodigo.Text;
                 Params[5].AsString:=ComboBoxPrioridad.Text;
                 Params[6].AsString:=EditClasificacion1.Text;
                 Params[7].AsString:=EditClasificacion2.Text;
                 Params[8].AsString:=ComboBoxCentroCostos.Text;
                 Params[9].AsString:=ComboBoxLocalizacion.Text;
                 Params[10].AsString:=MemoObservaciones.Text;
                 Params[11].AsString:=EditCampolibre1.Text;
                 Params[12].AsString:=EditCampolibre2.Text;
                 Params[13].AsString:=EditCampolibre3.Text;
                 Params[14].AsString:=EditDescribe1.Text;
                 Params[15].AsString:=EditDescribe2.Text;
                 Params[16].AsString:=EditDescribe3.Text;
                 ExecSQL;

                  CLOSE;
          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 Editid_equipo.Clear;
                 EditEquipoNombre.Clear;
                 EditCapacidad.Clear;
                 EditIdentificador.Clear;
                 EditCodigo.Clear;
                 ComboBoxPrioridad.Text:='';
                 EditClasificacion1.Clear;
                 EditClasificacion2.Clear;
                 ComboBoxCentroCostos.Text:='';
                 ComboBoxLocalizacion.Text:='';
                 MemoObservaciones.lines.Clear;
                 EditCampolibre1.Clear;
                 EditCampolibre2.Clear;
                 EditCampolibre3.Clear;
                 EditDescribe1.Clear;
                 EditDescribe2.Clear;
                 EditDescribe3.Clear;
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
                 Sql.Add('Update "CMSoftware"."Equipo" set id_equipo=:param1,tipo_equipo=:param2,capacidad=:param3,identificador=:param4,codigo=:param5,prioridad=:param6,clasificacion1=:param7,');
                 Sql.Add('clasificacion2=:param8,centro_costos=:param9,localizacion=:param10,observaciones=:param11,campo_libre1=:param12,campo_libre2=:param13,campo_libre3=:param14,');
                 Sql.Add('descrip_libre1=:param15,descrip_libre2=:param16,descrip_libre3=:param17');
                 Sql.Add('where id_equipo=:param1');

                 Params[0].AsInteger:=StrToInt(Editid_equipo.Text);
                 Params[1].AsString:=EditEquipoNombre.Text;
                 Params[2].AsString:=EditCapacidad.Text;
                 Params[3].AsString:=EditIdentificador.Text;
                 Params[4].AsString:=EditCodigo.Text;
                 Params[5].AsString:=ComboBoxPrioridad.Text;
                 Params[6].AsString:=EditClasificacion1.Text;
                 Params[7].AsString:=EditClasificacion2.Text;
                 Params[8].AsString:=ComboBoxCentroCostos.Text;
                 Params[9].AsString:=ComboBoxLocalizacion.Text;
                 Params[10].AsString:=MemoObservaciones.Text;
                 Params[11].AsString:=EditCampolibre1.Text;
                 Params[12].AsString:=EditCampolibre2.Text;
                 Params[13].AsString:=EditCampolibre3.Text;
                 Params[14].AsString:=EditDescribe1.Text;
                 Params[15].AsString:=EditDescribe2.Text;
                 Params[16].AsString:=EditDescribe3.Text;
                 ExecSQL;

            end;
          end;

    end
end;

procedure TFormEquipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
                  Editid_equipo.Clear;
                 EditEquipoNombre.Clear;
                 EditCapacidad.Clear;
                 EditIdentificador.Clear;
                 EditCodigo.Clear;
                 ComboBoxPrioridad.Text:='';
                 EditClasificacion1.Clear;
                 EditClasificacion2.Clear;
                 ComboBoxCentroCostos.Text:='';
                 ComboBoxLocalizacion.Text:='';
                 MemoObservaciones.lines.Clear;
                 EditCampolibre1.Clear;
                 EditCampolibre2.Clear;
                 EditCampolibre3.Clear;
                 EditDescribe1.Clear;
                 EditDescribe2.Clear;
                 EditDescribe3.Clear;
end;

end.
