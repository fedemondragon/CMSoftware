unit LineaProducto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormLineaProducto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditLinea: TEdit;
    EditDescripcion: TEdit;
    ComboBoxCuentaContable: TComboBox;
    BitBtnGuardar: TBitBtn;
    BitBtnCerrar: TBitBtn;
    FDQueryLinea: TFDQuery;
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure BitBtnGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLineaProducto: TFormLineaProducto;

implementation

{$R *.dfm}

procedure TFormLineaProducto.BitBtnCerrarClick(Sender: TObject);
begin
  close;
            //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 EditLinea.Clear;
                 EditDescripcion.Clear;
                 ComboBoxCuentaContable.Text:='';
end;

procedure TFormLineaProducto.BitBtnGuardarClick(Sender: TObject);
var
  Save:Integer;
begin
  if BitBtnGuardar.Caption='&Guardar' then
    begin
      Save:=Application.MessageBox('┐Desea Guardar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With FDQueryLinea do //Inserta la linea del producto
              begin
                 sql.Clear;
                 Sql.Add('Insert into "CMSoftware"."Linea"(id_linea,descripcion,centro_costos)');
                 Sql.Add('values(:param1,:param2,:param3)');
                 Params[0].AsString:=EditLinea.Text;
                 Params[1].AsString:=EditDescripcion.Text;
                 Params[2].AsString:=ComboBoxCuentaContable.Text;
                 ExecSQL;
                  CLOSE;

          //INICIA PROCESO DE LIMPIEZA DE FORMULARIO
                 EditLinea.Clear;
                 EditDescripcion.Clear;
                 ComboBoxCuentaContable.Text:='';
              end;
          end;

    end
  else
  if BitBtnGuardar.Caption='&Modificar' then
    begin
      Save:=Application.MessageBox('┐Desea Modificar el registro?','íConfirmando!',MB_YESNOCANCEL);
        if Save=IDYES then
          begin
            With FDQueryLinea do //Actualiza el centro de costos
              begin
                 sql.Clear;
                 Sql.Add('Update "CMSoftware"."Linea" set id_linea=:param1,descripcion=:param2,centro_costos=:param3');
                 Sql.Add('where id_linea=:param1');

                 Params[0].AsString:=EditLinea.Text;
                 Params[1].AsString:=EditDescripcion.Text;
                 Params[2].AsString:=ComboBoxCuentaContable.Text;
                 ExecSQL;

            end;
          end;

    end

end;

end.
