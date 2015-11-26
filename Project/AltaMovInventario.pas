unit AltaMovInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, FireDAC.Comp.UI, Vcl.DBCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,StrUtils;

type
  TFormAltaMovInv = class(TForm)
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    cxGridAltaMovimiento: TcxGrid;
    cxGridAltaMovimientoDBTableView1: TcxGridDBTableView;
    cxGridAltaMovimientoLevel1: TcxGridLevel;
    Label20: TLabel;
    EditDescripcionProducto: TEdit;
    EditTotal: TEdit;
    Label22: TLabel;
    GroupBox1: TGroupBox;
    EditDescripcionConcepto: TEdit;
    DateTimePickerFecha: TDateTimePicker;
    LabelFecha: TLabel;
    FDGUIxWaitCursorAltaMovimiento: TFDGUIxWaitCursor;
    PopupMenuAltaMovimiento: TPopupMenu;
    DataSourceAltaMovimiento: TDataSource;
    FDQueryAltaMovimiento: TFDQuery;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    EditOT: TEdit;
    Label2: TLabel;
    EditFolio: TEdit;
    Label4: TLabel;
    DataSourceAlmacen: TDataSource;
    FDTableAlmacen: TFDTable;
    DataSourceConceptos: TDataSource;
    FDTableConceptos: TFDTable;
    Label5: TLabel;
    ComboBoxConcepto: TComboBox;
    ComboBoxAlmacen: TComboBox;
    FDQueryAltaMovimientoid_clave: TWideStringField;
    FDQueryAltaMovimientocosto: TFMTBCDField;
    FDQueryAltaMovimientocosto_operado: TFMTBCDField;
    FDQueryAltaMovimientocantidad: TFMTBCDField;
    FDQueryAltaMovimientodescripcion: TWideStringField;
    cxGridAltaMovimientoDBTableView1id_clave: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1costo: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1costo_operado: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1cantidad: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1descripcion: TcxGridDBColumn;
    EditCantidad: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    EditProducto: TEdit;
    BitBtnBuscaProducto: TBitBtn;
    EditCostoUnitario: TEdit;
    Label18: TLabel;
    EditSubtotalPartida: TEdit;
    Label19: TLabel;
    LabelFolio: TLabel;
    BuscaOT: TBitBtn;
    FDQueryConceptos: TFDQuery;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure Alta1Click(Sender: TObject);
    procedure ComboBoxConceptoDropDown(Sender: TObject);
    procedure ComboBoxAlmacenDropDown(Sender: TObject);
    procedure BitBtnBuscaProductoClick(Sender: TObject);
    procedure ComboBoxConceptoSelect(Sender: TObject);
    procedure EditProductoKeyPress(Sender: TObject; var Key: Char);
    procedure EditCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure EditCostoUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EditSubtotalPartidaKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonAgregarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxGridAltaMovimientoDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ComboBoxConceptoKeyPress(Sender: TObject; var Key: Char);
    procedure EditOTKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxAlmacenKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
     TipoConcepto,Impuesto:String;
     Subtotal,Total,cadenaTotal,existencia:Real;
  end;

var
  FormAltaMovInv: TFormAltaMovInv;

implementation

{$R *.dfm}

uses DataModuleInventarios, BuscaProducto, MainMenu, MovimientosInventario;

procedure TFormAltaMovInv.Alta1Click(Sender: TObject);
begin
ShowMessage('Hola');
end;

procedure TFormAltaMovInv.BitBtnBuscaProductoClick(Sender: TObject);
begin
  FormBuscaProducto.show;
  FormBuscaProducto.Caption:='Busca Producto Movimientos al inventario';
end;

procedure TFormAltaMovInv.ComboBoxAlmacenDropDown(Sender: TObject);
begin
  With DataModule1.FDQueryAlmacenes do
  begin
    Sql.Clear;
    Sql.Add('Select descripcion from "CMSoftware"."Almacenes"');
    Active:=True;
    ComboBoxAlmacen.Clear;
    while not DataModule1.FDQueryAlmacenes.Eof  do
    begin
      ComboBoxAlmacen.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;

end;

procedure TFormAltaMovInv.ComboBoxAlmacenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
   EditCantidad.SetFocus;

end;

procedure TFormAltaMovInv.ComboBoxConceptoDropDown(Sender: TObject);


begin
  With DataModule1.FDQueryAlmacenes do
  begin
    Sql.Clear;
    Sql.Add('Select descripcion from "CMSoftware"."ConceptosMovInv"');
    Active:=True;
    ComboBoxConcepto.Clear;
    while not DataModule1.FDQueryAlmacenes.Eof  do
    begin
      ComboBoxConcepto.Items.Add(Fields[0].AsString);
      Next;
    end;
     close;
     open;
  end;

end;

procedure TFormAltaMovInv.ComboBoxConceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
   EditOT.SetFocus;

end;

procedure TFormAltaMovInv.ComboBoxConceptoSelect(Sender: TObject);
begin
  With DataModule1.FDQueryAlmacenes do
  begin
    Sql.Clear;
    Sql.Add('Select tipo_movimiento from "CMSoftware"."ConceptosMovInv"');
    Sql.Add('where descripcion=:param1');
    Params[0].AsString:=ComboBoxConcepto.Text;
    Open;
    TipoConcepto:=Fields[0].AsString;
    if TipoConcepto='E' then
       EditDescripcionConcepto.Text:='Entradas' else
    if TipoConcepto='S' then
       EditDescripcionConcepto.Text:='Salidas';
  end;
end;

procedure TFormAltaMovInv.cxGridAltaMovimientoDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    Var
      TotalPartida,Descripcion_producto:String;
      MontoPartida:Real;
begin

  Descripcion_producto:=DataSourceAltaMovimiento.DataSet.Fields[1].AsString;
  MontoPartida:=StrToFloat(DataSourceAltaMovimiento.DataSet.Fields[4].AsString);

  With DataModule1.FDQueryProducto do
  Begin
    Sql.Clear;
    Sql.Add('Select descripcion FROM "CMSoftware"."Producto" where id_clave=:param1');
    Params[0].AsString:=Descripcion_producto;
    Open;
    EditDescripcionProducto.Text:=Fields[0].AsString;
    EditTotal.Text:=FloatToStr((MontoPartida) * (StrToFloat('1'+'.'+DataSourceAltaMovimiento.DataSet.Fields[4].AsString)));
    TotalPartida:=format('%n',[StrToFloat(EditTotal.Text)]);
    EditTotal.Text:=TotalPartida;
  End;

end;

procedure TFormAltaMovInv.EditCantidadKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
    Begin
     Subtotal:=StrTofloat(EditCantidad.Text)*(StrTofloat(EditCostoUnitario.Text));
     EditSubtotalPartida.Text:=FloatToStr(Subtotal);
     Total:=Subtotal* (StrToFloat('1'+'.'+Impuesto));
     EditTotal.Text:=FloatToStr(Total);
    EditProducto.SetFocus;
    End;

end;

procedure TFormAltaMovInv.EditCostoUnitarioKeyPress(Sender: TObject;
  var Key: Char);

begin

begin
if Key=#13 then
   Begin

     Subtotal:=StrTofloat(EditCantidad.Text)*(StrTofloat(EditCostoUnitario.Text));
     EditSubtotalPartida.Text:=FloatToStr(Subtotal);
     Total:=StrToFLoat(EditSubtotalPartida.Text) * (StrToFloat('1'+'.'+Impuesto));
     EditTotal.Text:=FloatToStr(Total);
    // cadenaTotal:=Format('%n',[(EditTotal.Text)]);
     //EditTotal.Text:=cadenaTotal;
     EditSubtotalPartida.SetFocus;
   End;

   End;


end;

procedure TFormAltaMovInv.EditOTKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  ComboBoxAlmacen.SetFocus;

end;

procedure TFormAltaMovInv.EditProductoKeyPress(Sender: TObject; var Key: Char);
 var
    CuentaProducto:Integer;

begin
if Key=#13 then
    Begin

    With DataModule1.FDQueryProducto do
     Begin
       Sql.Clear;
       sql.Add('Select count(*) from "CMSoftware"."Producto" where id_clave=:param1');
       Params[0].AsString:=EditProducto.Text;
       open;
       CuentaProducto:=Fields[0].AsInteger;
     End;

       if CuentaProducto=0 then
       ShowMessage('No existe el producto') else
     Begin
    With DataModule1.FDQueryProducto do
    begin
      Sql.Clear;
      Sql.Add('Select descripcion,ultimo_costo,impuesto from "CMSoftware"."Producto" where id_clave =:param1');
      Params[0].AsString:=EditProducto.Text;
      open;
    EditDescripcionProducto.Text:=Fields[0].AsString;
    EditCostoUnitario.Text:=Fields[1].AsString;
     Impuesto:=Fields[2].AsString;
    end;
     Subtotal:=StrTofloat(EditCantidad.Text)*(StrTofloat(EditCostoUnitario.Text));
     EditSubtotalPartida.Text:=FloatToStr(Subtotal);
     Total:=Subtotal* (StrToFloat('1'+'.'+Impuesto));
     EditTotal.Text:=FloatToStr(Total);
     EditCostoUnitario.SetFocus;
    End;
      end;
end;

procedure TFormAltaMovInv.EditSubtotalPartidaKeyPress(Sender: TObject;
  var Key: Char);

  Var
    id_concepto,id_almacen:Integer;
begin
if (EditProducto.Text<>'') and (ComboBoxConcepto.Text<>'') then
Begin
if Key=#13 then
   Begin
      With FDQueryConceptos do   //id de mov al inventario
      Begin
        sql.Clear;
        Sql.Add('Select id_concepto from "CMSoftware"."ConceptosMovInv" where descripcion=:param1');
        Params[0].ASString:=ComboBoxConcepto.Text;
        open;
        id_concepto:=Fields[0].AsInteger;
      End;
   With DataModule1.FDQueryAlmacenes do           //id de almacenes
   Begin
     Sql.Clear;
     Sql.Add('Select id_almacen from "CMSoftware"."Almacenes" where descripcion=:param1');
     Params[0].AsString:=ComboBoxAlmacen.Text;
     open;
     id_almacen:=Fields[0].AsInteger;
   End;

    With Datamodule1.FDQueryProducto do
     Begin
       Sql.Clear;
       Sql.Add('Select existencia from "CMSoftware"."Producto" where id_clave=:param1');
       Params[0].AsString:=EditProducto.Text;
       open;
       existencia:=Fields[0].AsFloat;
     End;
    if (existencia>0)   then       //REVISA EXISTENCIAS
    begin
      With DataModule1.FDQueryMovimientosInv do      // Inserta cada movimiento en Movimientos al Inventario
      Begin
              Sql.Clear;
              Sql.Add('Insert into "CMSoftware"."MovimientosInventario" (num_docto,id_clave,id_proveedor_cliente,');
              Sql.Add('id_concepto,fecha,costo,folio,costo_operado,cantidad,almacen) values(:param1,:param2,:param3,:param4,:param5,:param6,:param7,:param8,:param9,:param10)');

              Params[0].AsString:=EditOT.Text;
              Params[1].AsString:=EditProducto.Text;
              Params[2].AsInteger:=0;
              Params[3].ASInteger:=(id_concepto);
              Params[4].AsDate:=DateTimePickerFecha.Date;
              Params[5].AsFloat:=StrToFloat(EditCostoUnitario.Text);
              Params[6].AsString:=EditFolio.Text;
              Params[7].AsFloat:=StrtoFloat(EditSubtotalPartida.Text);

              if TipoConcepto='S' then
              Params[8].asFloat:=StrToFloat(EditCantidad.Text)*-1
              else
              Params[8].asFloat:=StrToFloat(EditCantidad.Text);
              Params[9].AsInteger:=(id_almacen);
              ExecSQL;
      End;
     With FDQueryAltaMovimiento do    //consulta del detalle de compra
     Begin
       sql.Clear;
       Sql.Add('Select * from "CMSoftware"."MovimientosInventario","CMSoftware"."Producto"');
       Sql.Add('where "MovimientosInventario".id_clave="Producto".id_clave and folio=:param1');
       Params[0].AsString:=EditFolio.Text;
       open;
       DataSourceAltaMovimiento.DataSet.Refresh;
     End;

      //limpia el detalle
     EditCantidad.text:='1';
     EditProducto.Clear;
     EditCostoUnitario.text:='0';
     EditSubtotalPartida.text:='0';
     EditDescripcionProducto.Clear;
     EditTotal.Clear;
     EditCantidad.SetFocus;

   End
   else
 ShowMessage('El producto no tiene existencias');
   End;

 end
 else
 ShowMessage('La clave del producto y el concepto no pueden estar vacios');

end;

procedure TFormAltaMovInv.SpeedButton1Click(Sender: TObject);
var
  Delete:Integer;
  Cantidad:Real;
  Clave_producto:String;
begin
      cantidad:=StrTOFloat(DataSourceAltaMovimiento.DataSet.Fields[0].AsString);
      Clave_producto:=DataSourceAltaMovimiento.DataSet.Fields[1].AsString;

      Delete:=Application.MessageBox('¿Desea Eliminar el registro?','¡Confirmando!',MB_YESNOCANCEL);

        if (Delete=IDYES) then
        Begin
          With FDQueryAltaMovimiento do
            Begin
              Sql.Clear;
              Sql.Add('Delete from "CMSoftware"."MovimientosInventario" where cantidad=:param1 and id_clave=:param2 and folio=:param3 ');
              Params[0].AsFloat:=cantidad;
              Params[1].AsString:=clave_producto;
              Params[2].AsString:=EditFolio.Text;
              ExecSQL;
            End;
          With FDQueryAltaMovimiento do
         Begin
           sql.Clear;
           Sql.Add('Select * from "CMSoftware"."MovimientosInventario","CMSoftware"."Producto"');
           SqL.add('  where "MovimientosInventario".id_clave="Producto".id_clave and folio=:param1');
           PArams[0].AsString:=EditFolio.Text;
           open;
           DataSourceAltaMovimiento.DataSet.Refresh;
          end;

           //limpia el detalle
           EditCantidad.text:='1';
           EditProducto.Clear;
           EditCostoUnitario.text:='0';
           EditSubtotalPartida.text:='0';
           EditDescripcionProducto.Clear;
           EditTotal.Clear;

         End

        else

end;

procedure TFormAltaMovInv.SpeedButton2Click(Sender: TObject);
begin
  EditCantidad.SetFocus;
end;

procedure TFormAltaMovInv.SpeedButtonAgregarClick(Sender: TObject);
var
  FolioMI,Save:Integer;
begin
      Save:=Application.MessageBox('¿Desea guardar el movimiento al inventario?','¡Confirmando!',MB_YESNO);
        Begin
         if Save=IDYES then
          Begin
             With DataModule1.FDQueryUsuario do //actualiza el folio
             Begin
               Sql.Clear;
               Sql.Add('Select "Id_folioMI" from "CMSoftware"."Usuario" where id_usuario=:param1');
              Params[0].AsInteger:=StrToInt(RightStr(FormMAinMenu.StatusBarMainMenu.Panels[0].Text,3));
               Open;
               FolioMI:=Fields[0].AsInteger;
              End;
            With DataModule1.FDQueryfolios do
             Begin
               Sql.Clear;
               Sql.Add('Update "CMSoftware"."Folios" set num_folio=:param1 where id_folio=:param2');
               Params[0].AsInteger:=StrToInt(LabelFolio.Caption) +StrToInt('1');
               Params[1].AsInteger:=FolioMI;
               ExecSQL;
               ShowMessage('Movimiento guardado éxitosamente');
             End;


           EditOT.Clear;
           ComboBoxAlmacen.Text:='';
           ComboBoxConcepto.Text:='';
           EditDescripcionConcepto.Text:='';
           //limpia el detalle
           EditCantidad.text:='1';
           EditProducto.Clear;
           EditCostoUnitario.text:='0';
           EditSubtotalPartida.text:='0';
           EditDescripcionProducto.Clear;
           EditTotal.Clear;
           EditOT.Text:='0';
           EditFolio.Clear;

           close;
          End
             else
       End;

end;

procedure TFormAltaMovInv.SpeedButtonSalirClick(Sender: TObject);
var
  Save:Integer;
begin
      Save:=Application.MessageBox('¿Desea Salir del registro de movimientos al inventario?','¡Confirmando!',MB_YESNO);
        Begin
         if Save=IDYES then
           Begin
              With DataModule1.FDQueryMovimientosInv do  //bora partidas
               Begin
                 Sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."MovimientosInventario" where folio=:param1');
                 Params[0].AsString:=EditFolio.Text;
                 ExecSQL;
               End;
           close;
           EditOT.Clear;
           ComboBoxAlmacen.Text:='';
           ComboBoxConcepto.Text:='';
           EditDescripcionConcepto.Text:='';
           //limpia el detalle
           EditCantidad.text:='1';
           EditProducto.Clear;
           EditCostoUnitario.text:='0';
           EditSubtotalPartida.text:='0';
           EditDescripcionProducto.Clear;
           EditTotal.Clear;
           EditOT.Text:='0';
           EditFolio.Clear;
       end
           else
        End;
end;

end.
