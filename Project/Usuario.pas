unit Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormUsuarios = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label4: TLabel;
    ComboBoxEstatus: TComboBox;
    BitBtnAceptar: TBitBtn;
    BitBtnCerrar: TBitBtn;
    BitBtnGuardar: TBitBtn;
    Label5: TLabel;
    ComboBoxFolios: TComboBox;
    EditSerie: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EditFolio: TEdit;
    Label8: TLabel;
    ComboBoxOT: TComboBox;
    Label9: TLabel;
    EditSerieOT: TEdit;
    Label10: TLabel;
    EditFolioOT: TEdit;
    Label11: TLabel;
    ComboBoxInvent: TComboBox;
    Label12: TLabel;
    EditSerieInv: TEdit;
    Label13: TLabel;
    EditFolioInv: TEdit;
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnCerrarClick(Sender: TObject);
    procedure ComboBoxFoliosDropDown(Sender: TObject);
    procedure ComboBoxFoliosChange(Sender: TObject);
    procedure ComboBoxOTChange(Sender: TObject);
    procedure ComboBoxOTDropDown(Sender: TObject);
    procedure ComboBoxInventChange(Sender: TObject);
    procedure ComboBoxInventDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation

{$R *.dfm}

uses ControlFolios, DataModuleInventarios;

procedure TFormUsuarios.BitBtnAceptarClick(Sender: TObject);
begin
  FormFolios.show;
end;

procedure TFormUsuarios.BitBtnCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFormUsuarios.ComboBoxFoliosChange(Sender: TObject);
begin
 With DataModule1.FDQueryfolios do
  begin
    Sql.Clear;
    Sql.Add('Select serie,num_folio from  "CMSoftware"."Folios"');
    sql.Add('where descripcion=:param1');
    params[0].AsString:=ComboBoxFolios.Text;
    open;
    EditSerie.Text:=Fields[0].AsString;
    EditFolio.Text:=Fields[1].AsString;
  end;
end;

procedure TFormUsuarios.ComboBoxFoliosDropDown(Sender: TObject);
begin
      With Datamodule1.FDQueryfolios do
      Begin
        Sql.Clear;
        Sql.Add('Select descripcion from "CMSoftware"."Folios"');

        Active:=True;
        ComboBoxFolios.Clear;
        while not Datamodule1.FDQueryfolios.Eof do
        Begin
          ComboBoxFolios.Items.Add(Fields[0].AsString);
          Next;
        End;
        close;
        open;
      End;
end;

procedure TFormUsuarios.ComboBoxInventChange(Sender: TObject);
begin
With DataModule1.FDQueryfolios do
  begin
    Sql.Clear;
    Sql.Add('Select serie,num_folio from  "CMSoftware"."Folios"');
    sql.Add('where descripcion=:param1');
    params[0].AsString:=ComboBoxInvent.Text;
    open;
    EditSerieInv.Text:=Fields[0].AsString;
    EditFolioInv.Text:=Fields[1].AsString;
  end;
end;

procedure TFormUsuarios.ComboBoxInventDropDown(Sender: TObject);
begin
  With Datamodule1.FDQueryfolios do
      Begin
        Sql.Clear;
        Sql.Add('Select descripcion from "CMSoftware"."Folios"');

        Active:=True;
        ComboBoxInvent.Clear;
        while not Datamodule1.FDQueryfolios.Eof do
        Begin
          ComboBoxInvent.Items.Add(Fields[0].AsString);
          Next;
        End;
        close;
        open;
       end;
end;

procedure TFormUsuarios.ComboBoxOTChange(Sender: TObject);
begin
With DataModule1.FDQueryfolios do
  begin
    Sql.Clear;
    Sql.Add('Select serie,num_folio from  "CMSoftware"."Folios"');
    sql.Add('where descripcion=:param1');
    params[0].AsString:=ComboBoxOT.Text;
    open;
    EditSerieOT.Text:=Fields[0].AsString;
    EditFolioOT.Text:=Fields[1].AsString;
  end;
end;


procedure TFormUsuarios.ComboBoxOTDropDown(Sender: TObject);
begin
     With Datamodule1.FDQueryfolios do
      Begin
        Sql.Clear;
        Sql.Add('Select descripcion from "CMSoftware"."Folios"');

        Active:=True;
        ComboBoxOT.Clear;
        while not Datamodule1.FDQueryfolios.Eof do
        Begin
          ComboBoxOT.Items.Add(Fields[0].AsString);
          Next;
        End;
        close;
        open;
      End;
end;

end.
