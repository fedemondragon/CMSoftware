unit ApartadoInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin;

type
  TFormApartadoInv = class(TForm)
    EditCantidad: TEdit;
    EditProducto: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    EditCostoUnitario: TEdit;
    Label18: TLabel;
    EditSubtotalPartida: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    EditDescripcionProducto: TEdit;
    Label22: TLabel;
    EditTotal: TEdit;
    ToolBar1: TToolBar;
    SpeedButtonAgregar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonImprimir: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButtonSalir: TSpeedButton;
    ToolBar2: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditExistencia: TEdit;
    EditOrdenServicio: TEdit;
    Label2: TLabel;
    EditPartida: TEdit;
    Label3: TLabel;
    DateTimePickerFecha: TDateTimePicker;
    Label4: TLabel;
    EditDocto: TEdit;
    Label5: TLabel;
    BitBtnBuscaProducto: TBitBtn;
    MemoDescripcion: TMemo;
    Label11: TLabel;
    LabelFolio: TLabel;
    ComboBoxAlmacen: TComboBox;
    BitBtnAgregar: TBitBtn;
    cxGridAltaMovimiento: TcxGrid;
    cxGridAltaMovimientoDBTableView1: TcxGridDBTableView;
    cxGridAltaMovimientoLevel1: TcxGridLevel;
    DataSourceAltaMovimiento: TDataSource;
    FDQueryAltaMovimiento: TFDQuery;
    FDQueryAltaMovimientocantidad: TFMTBCDField;
    FDQueryAltaMovimientoid_clave: TWideStringField;
    FDQueryAltaMovimientodescripcion: TWideStringField;
    FDQueryAltaMovimientocosto: TFMTBCDField;
    FDQueryAltaMovimientocosto_operado: TFMTBCDField;
    cxGridAltaMovimientoDBTableView1cantidad: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1id_clave: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1descripcion: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1costo: TcxGridDBColumn;
    cxGridAltaMovimientoDBTableView1costo_operado: TcxGridDBColumn;
    procedure SpeedButtonSalirClick(Sender: TObject);
    procedure ComboBoxAlmacenDropDown(Sender: TObject);
    procedure ComboBoxAlmacenKeyPress(Sender: TObject; var Key: Char);
    procedure EditProductoKeyPress(Sender: TObject; var Key: Char);
    procedure EditCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnAgregarClick(Sender: TObject);
    procedure BitBtnBuscaProductoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Subtotal,Total,existencia:Real;
     Impuesto:String;
  end;

var
  FormApartadoInv: TFormApartadoInv;

implementation

{$R *.dfm}

uses DataModuleInventarios, BuscaProducto, Login, OrdenServicio;

procedure TFormApartadoInv.BitBtnAgregarClick(Sender: TObject);
Var
    id_concepto,id_almacen:Integer;
    TipoConcepto:String;
begin
if (EditProducto.Text<>'') and (EditCantidad.Text<>'') then
Begin
   Begin
        id_concepto:=10;
      End;
          With DataModule1.FDQueryAlmacenes do
          begin
            Sql.Clear;
            Sql.Add('Select tipo_movimiento from "CMSoftware"."ConceptosMovInv"');
            Sql.Add('where id_concepto=:param1');
            Params[0].AsInteger:=id_concepto;
            Open;
            TipoConcepto:=Fields[0].AsString;
          end;

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
              Sql.Add('id_concepto,fecha,costo,folio,costo_operado,cantidad,almacen,partida) values(:param1,:param2,:param3,:param4,:param5,:param6,:param7,:param8,:param9,:param10,:param11)');

              Params[0].AsString:=EditOrdenServicio.Text;
              Params[1].AsString:=EditProducto.Text;
              Params[2].AsInteger:=0;
              Params[3].ASInteger:=(id_concepto);
              Params[4].AsDate:=DateTimePickerFecha.Date;


              if TipoConcepto='S' then
                Begin
                  Params[5].AsFloat:=StrToFloat(EditCostoUnitario.Text)*-1;
                  Params[6].AsString:=EditDocto.Text;
                  Params[7].AsFloat:=StrtoFloat(EditSubtotalPartida.Text)*-1;
                  Params[8].asFloat:=StrToFloat(EditCantidad.Text)*-1;
                  Params[9].AsInteger:=(id_almacen);
                  Params[10].AsInteger:=StrToInt(EditPartida.Text);

                End
              else
               if TipoConcepto='E' then
                Begin
                  Params[5].AsFloat:=StrToFloat(EditCostoUnitario.Text);
                  Params[6].AsString:=EditDocto.Text;
                  Params[7].AsFloat:=StrtoFloat(EditSubtotalPartida.Text);
                  Params[8].asFloat:=StrToFloat(EditCantidad.Text);
                  Params[9].AsInteger:=(id_almacen);
                  Params[10].AsInteger:=StrToInt(EditPartida.Text);

                End;

                 ExecSQL;

     With FDQueryAltaMovimiento do    //consulta el movimiento al inventario
     Begin
       sql.Clear;
       Sql.Add('Select * from "CMSoftware"."MovimientosInventario","CMSoftware"."Producto"');
       Sql.Add('where "MovimientosInventario".id_clave="Producto".id_clave and "CMSoftware"."MovimientosInventario".folio=:param1 and "CMSoftware"."MovimientosInventario".num_docto=:param2 and "CMSoftware"."MovimientosInventario".partida=:param3 ');
       Params[0].AsString:=EditDocto.Text;
       Params[1].AsString:=EditOrdenServicio.Text;
       Params[2].AsInteger:=StrToInt(EditPartida.Text);
       open;
       DataSourceAltaMovimiento.DataSet.Refresh;
     End;
        // AQUI ACTUALIZAR LA TABLA DE DETALLE DE ORDEN PARA QUE SE ACTUALICE EL ESTATUS A EN PROCESO
       ///////////////////////////////

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
 end
 else
 ShowMessage('La clave del producto y el concepto no pueden estar vacios');

end;

procedure TFormApartadoInv.BitBtnBuscaProductoClick(Sender: TObject);
begin
FormBuscaProducto.show;
  FormBuscaProducto.Caption:='Busca Producto Materiales de apartado';
end;

procedure TFormApartadoInv.ComboBoxAlmacenDropDown(Sender: TObject);
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

procedure TFormApartadoInv.ComboBoxAlmacenKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
   EditProducto.SetFocus;
end;

procedure TFormApartadoInv.EditCantidadKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
    Begin
     Subtotal:=StrTofloat(EditCantidad.Text)*(StrTofloat(EditCostoUnitario.Text));
     EditSubtotalPartida.Text:=FloatToStr(Subtotal);
     Total:=Subtotal* (StrToFloat('1'+'.'+Impuesto));
     EditTotal.Text:=FloatToStr(Total);
     BitBtnAgregar.SetFocus;
    End;

end;

procedure TFormApartadoInv.EditProductoKeyPress(Sender: TObject; var Key: Char);
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
     EditCantidad.SetFocus;
    End;
      end;
end;

procedure TFormApartadoInv.SpeedButton1Click(Sender: TObject);
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
              Params[2].AsString:=EditDocto.Text;
              ExecSQL;
            End;
          With FDQueryAltaMovimiento do
         Begin
           sql.Clear;
           Sql.Add('Select * from "CMSoftware"."MovimientosInventario","CMSoftware"."Producto"');
           SqL.add('  where "MovimientosInventario".id_clave="Producto".id_clave and folio=:param1');
           PArams[0].AsString:=EditDocto.Text;
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

procedure TFormApartadoInv.SpeedButton2Click(Sender: TObject);
begin
EditCantidad.SetFocus;
end;

procedure TFormApartadoInv.SpeedButtonAgregarClick(Sender: TObject);
var
  Save,ExisteFolio:Integer;
  ID_ORDEN:Integer;
  FolioMI:Integer;
begin
      Save:=Application.MessageBox('¿Desea guardar el movimiento al inventario?','¡Confirmando!',MB_YESNO);
        Begin
         if Save=IDYES then
          Begin
          if MemoDescripcion.Text='' then ShowMessage('Debe capturar la descripción del servicio') else //validadores
                if ComboBoxAlmacen.Text='' then  ShowMessage('Debe capturar el Almacén') else

         begin    //Inicia sin orden de servicio
             With DataModule1.FDQueryOrdenServicio do    //Revisa si la orden de servico se encuentra
              Begin
                Sql.Clear;
                Sql.Add('Select count(id_solicitud) from "CMSoftware"."SolicitudServicio" where id_solicitud=:param1');
                Params[0].AsString:=EditOrdenServicio.Text;
                Open;
                ID_ORDEN:=Fields[0].AsInteger;
              End;
         if (ID_ORDEN=0) then ShowMessage('La orden de Servicio no existe, por lo que requiere ser guardada primero. Por favor revise su información!') else
           Begin  //si tiene orden de servicio graba

             With DataModule1.FDQueryUsuario do //actualiza el folio
             Begin
               Sql.Clear;
               Sql.Add('Select "Id_folioMI" from "CMSoftware"."Usuario" where id_usuario=:param1');
              Params[0].AsInteger:=Formlogin.usuario;
               Open;
               FolioMI:=Fields[0].AsInteger;
              End;
            With DataModule1.FDQueryOrdenServicio do
             Begin
               Sql.Clear;
               Sql.Add('Update "CMSoftware"."Detalle_solicitud" set estatus=:param1 where id_solicitud=:param2 and partida=:param3');
               Params[0].AsString:='MAT. APARTADO';
               Params[1].AsString:=EditOrdenServicio.Text;
               Params[2].AsInteger:=StrToInt(EditPartida.Text);
               ExecSQL;
             End;

             With DataModule1.FDQueryMovimientosInv do
              Begin
                Sql.Clear;
                Sql.Add('Select count(num_docto) from "CMSoftware"."MovimientosInventario" where num_docto=:param1 and folio=:param2 and partida=:param3');
                Params[0].AsString:=EditOrdenServicio.Text;
                Params[1].AsString:=EditDocto.Text;
                Params[2].AsInteger:=StrToInt(EditPartida.Text);
                Open;
                ExisteFolio:=Fields[0].AsInteger;
                ShowMessage(IntToStr(ExisteFolio));
              End;

           if ExisteFolio=0 then
              Begin
            With DataModule1.FDQueryfolios do  //Actualiza el Folio
             Begin
               Sql.Clear;
               Sql.Add('Update "CMSoftware"."Folios" set num_folio=:param1 where id_folio=:param2');
               Params[0].AsInteger:=StrToInt(LabelFolio.Caption) +StrToInt('1');
               Params[1].AsInteger:=FolioMI;
               ExecSQL;
               ShowMessage('Movimiento guardado éxitosamente');
             End;
              end;

           EditOrdenServicio.Clear;
           ComboBoxAlmacen.Text:='';
           MemoDescripcion.Text:='';
           //limpia el detalle
           EditCantidad.text:='1';
           EditProducto.Clear;
           EditCostoUnitario.text:='0';
           EditSubtotalPartida.text:='0';
           EditDescripcionProducto.Clear;
           EditTotal.Clear;
           EditOrdenServicio.Text:='0';
           EditDocto.Clear;

           close;
           FormOrdenServicio.DataSourceDetalleOS.DataSet.Refresh;
          End;//termina sin Orden de servicio
          End;
          End
             else
       End;


end;

procedure TFormApartadoInv.SpeedButtonSalirClick(Sender: TObject);
var
  Delete,Cuenta:Integer;
begin

  With DataModule1.FDQueryMovimientosInv do
    Begin
      Sql.Clear;
      Sql.Add('Select count(folio) from "CMSoftware"."MovimientosInventario" where folio=:param1');
      Params[0].AsString:=EditDocto.Text;
      Open;
      Cuenta:=Fields[0].AsInteger;
    End;
  if Cuenta<>0 then
    Begin
                 close;
                 EditOrdenServicio.Clear;
                 ComboBoxAlmacen.Text:='';
                 MemoDescripcion.Text:='';
                 //limpia el detalle
                 EditCantidad.text:='1';
                 EditProducto.Clear;
                 EditCostoUnitario.text:='0';
                 EditSubtotalPartida.text:='0';
                 EditDescripcionProducto.Clear;
                 EditTotal.Clear;
                 EditDocto.Clear;

    End
     else
      if Cuenta=0 then
    Begin
      Delete:=Application.MessageBox('¿Desea Salir del registro de movimientos al inventario?','¡Confirmando!',MB_YESNO);
        Begin
         if Delete=IDYES then
           Begin
              With DataModule1.FDQueryMovimientosInv do  //bora partidas
               Begin
                 Sql.Clear;
                 Sql.Add('Delete from "CMSoftware"."MovimientosInventario" where folio=:param1');
                 Params[0].AsString:=EditDocto.Text;
                 ExecSQL;
               End;
                 close;
                 EditOrdenServicio.Clear;
                 ComboBoxAlmacen.Text:='';
                 MemoDescripcion.Text:='';
                 //limpia el detalle
                 EditCantidad.text:='1';
                 EditProducto.Clear;
                 EditCostoUnitario.text:='0';
                 EditSubtotalPartida.text:='0';
                 EditDescripcionProducto.Clear;
                 EditTotal.Clear;
                 EditDocto.Clear;
          End
           else
        End;
    End;
  end;

end.
