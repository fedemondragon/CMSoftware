unit Proveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.TabNotBk;

type
  TFormProveedor = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    GroupBox7: TGroupBox;
    BitBtnGuardar: TBitBtn;
    BitBtnCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    EditClave: TEdit;
    EditNombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EditCalle: TEdit;
    EditNumext: TEdit;
    EditNumint: TEdit;
    Label15: TLabel;
    EditPoblacion: TEdit;
    EditColonia: TEdit;
    EditCP: TEdit;
    EditEstado: TEdit;
    EditPais: TEdit;
    EditMunicipio: TEdit;
    EditClasificacion: TEdit;
    EditRFC: TEdit;
    EditTel: TEdit;
    Label16: TLabel;
    Editweb: TEdit;
    GroupBox3: TGroupBox;
    EditCentroCostos: TEdit;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    EditMonto: TEdit;
    EditFechaUltimaCompra: TEdit;
    GroupBox5: TGroupBox;
    MemoObservaciones: TMemo;
    GroupBox6: TGroupBox;
    EditLibre1: TEdit;
    EditLibre2: TEdit;
    EditLibre3: TEdit;
    EditCampo1: TEdit;
    EditCampo2: TEdit;
    EditCampo3: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure BitBtnGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProveedor: TFormProveedor;

implementation

{$R *.dfm}

uses DataModuleInventarios, catalogoProveedor;

procedure TFormProveedor.BitBtnCerrarClick(Sender: TObject);
begin
close;
          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
          EditClave.Clear;
          EditNombre.Clear;
          EditCalle.Clear;
          EditNumext.Clear;
          EditNumint.Clear;
          EditCP.Clear;
          EditPoblacion.Clear;
          EditColonia.Clear;
          EditEstado.Clear;
          EditPais.Clear;
          EditMunicipio.Clear;
          EditClasificacion.Clear;
          EditRFC.Clear;
          EditTel.Clear;
          Editweb.Clear;
          EditCentroCostos.Clear;
          EditMonto.Clear;
          EditFechaUltimaCompra.Clear;
          MemoObservaciones.Lines.Clear;
          EditLibre1.Clear;
          EditLibre2.Clear;
          EditLibre3.Clear;
          EditCampo1.Clear;
          EditCampo2.Clear;
          EditCampo3.Clear;
end;

procedure TFormProveedor.BitBtnGuardarClick(Sender: TObject);
var
  Save:Integer;
begin
  if BitBtnGuardar.Caption='&Guardar' then
    begin
      Save:=Application.MessageBox('¿Desea Guardar el registro?','¡Confirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With datamoduleinventarios.DataModule1.FDQueryProveedor do //Inserta el proveedor nuevo
              begin
                 sql.Clear;
                 Sql.Add('Insert into "CMSoftware"."Proveedor"(id_proveedor,nombre,calle,num_ext,num_int,cp,poblacion,estado,');
                 Sql.Add('municipio,colonia,pais,clasificacion,rfc,telefono,pagina_web,centro_costos,');
                 Sql.Add('observaciones,campolibre1,campolibre2,campolibre3,descrip_libre1,descrip_libre2,descrip_libre3)');
                 Sql.Add('values(:param1,:param2,:param3,:param4,:param5,:param6,:param7,:param8,');
                 Sql.Add(':param9,:param10,:param11,:param12,:param13,:param14,:param15,:param16,:param17,:param18,:param19,');
                 Sql.Add(':param20,:param21,:param22,:param23)');

                 Params[0].AsInteger:=StrToInt(EditClave.Text);
                 Params[1].AsString:=EditNombre.Text;
                 Params[2].AsString:=EditCalle.Text;
                 Params[3].AsString:=EditNumext.Text;
                 Params[4].AsString:=EditNumint.Text;
                 Params[5].AsString:=EditCP.Text;
                 Params[6].AsString:=EditPoblacion.Text;
                 Params[7].AsString:=EditEstado.Text;
                 Params[8].AsString:=EditMunicipio.Text;
                 Params[9].AsString:=EditColonia.Text;
                 Params[10].AsString:=EditPais.Text;
                 Params[11].AsString:=EditClasificacion.Text;
                 Params[12].AsString:=EditRFC.Text;
                 Params[13].AsString:=EditTel.Text;
                 Params[14].AsString:=Editweb.Text;
                 Params[15].AsString:=EditCentroCostos.Text;
                 Params[16].AsString:=MemoObservaciones.Lines.Text;
                 Params[17].AsString:=EditLibre1.Text;
                 Params[18].AsString:=EditLibre2.Text;
                 Params[19].AsString:=EditLibre3.Text;
                 Params[20].AsString:=EditCampo1.Text;
                 Params[21].AsString:=EditCampo2.Text;
                 Params[22].AsString:=EditCampo3.Text;
                 ExecSQL;
                 CLOSE;

         //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
          EditClave.Clear;
          EditNombre.Clear;
          EditCalle.Clear;
          EditNumext.Clear;
          EditNumint.Clear;
          EditCP.Clear;
          EditPoblacion.Clear;
          EditColonia.Clear;
          EditEstado.Clear;
          EditPais.Clear;
          EditMunicipio.Clear;
          EditClasificacion.Clear;
          EditRFC.Clear;
          EditTel.Clear;
          Editweb.Clear;
          EditCentroCostos.Clear;
          EditMonto.Clear;
          EditFechaUltimaCompra.Clear;
          MemoObservaciones.Lines.Clear;
          EditLibre1.Clear;
          EditLibre2.Clear;
          EditLibre3.Clear;
          EditCampo1.Clear;
          EditCampo2.Clear;
          EditCampo3.Clear;

              end;
          end;

    end
  else
  if BitBtnGuardar.Caption='&Modificar' then
    begin
      Save:=Application.MessageBox('¿Desea Modificar el registro?','¡Confirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With datamoduleinventarios.DataModule1.FDQueryProducto do //Inserta el producto nuevo
              begin
                 sql.Clear;
                 Sql.Add('Update "CMSoftware"."Proveedor" set id_proveedor=:param1,nombre=:param2,calle=:param3,num_ext=:param4,num_int=:param5,cp=:param6,poblacion=:param7,estado=:param8,');
                 Sql.Add('municipio=:param9,colonia=:param10,pais=:param11,clasificacion=:param12,rfc=:param13,telefono=:param14,pagina_web=:param15,centro_costos=:param16,');
                 Sql.Add('observaciones=:param17,campolibre1=:param18,campolibre2=:param19,campolibre3=:param20,descrip_libre1=:param21,descrip_libre2=:param22,descrip_libre3=:param23');
                 Sql.Add('where id_proveedor=:param1');
                 Params[0].AsInteger:=StrToInt(EditClave.Text);
                 Params[1].AsString:=EditNombre.Text;
                 Params[2].AsString:=EditCalle.Text;
                 Params[3].AsString:=EditNumext.Text;
                 Params[4].AsString:=EditNumint.Text;
                 Params[5].AsString:=EditCP.Text;
                 Params[6].AsString:=EditPoblacion.Text;
                 Params[7].AsString:=EditEstado.Text;
                 Params[8].AsString:=EditMunicipio.Text;
                 Params[9].AsString:=EditColonia.Text;
                 Params[10].AsString:=EditPais.Text;
                 Params[11].AsString:=EditClasificacion.Text;
                 Params[12].AsString:=EditRFC.Text;
                 Params[13].AsString:=EditTel.Text;
                 Params[14].AsString:=Editweb.Text;
                 Params[15].AsString:=EditCentroCostos.Text;
                 Params[16].AsString:=MemoObservaciones.Lines.Text;
                 Params[17].AsString:=EditLibre1.Text;
                 Params[18].AsString:=EditLibre2.Text;
                 Params[19].AsString:=EditLibre3.Text;
                 Params[20].AsString:=EditCampo1.Text;
                 Params[21].AsString:=EditCampo2.Text;
                 Params[22].AsString:=EditCampo3.Text;
                 ExecSQL;
            end;
          end;

    end
end;

end.
