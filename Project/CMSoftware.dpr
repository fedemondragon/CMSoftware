program CMSoftware;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {FormMainMenu},
  Producto in 'Producto.pas' {FormProductos},
  Proveedor in 'Proveedor.pas' {FormProveedor},
  Equipo in 'Equipo.pas' {FormEquipos},
  CentroCostos in 'CentroCostos.pas' {FormCentroCostos},
  TipoEquipos in 'TipoEquipos.pas' {FormTipoEquipos},
  Usuario in 'Usuario.pas' {FormUsuarios},
  Inventario in 'Inventario.pas' {FormInventario},
  DataModuleInventarios in 'DataModuleInventarios.pas' {DataModule1: TDataModule},
  catalogoProveedor in 'catalogoProveedor.pas' {FormCatalogoProveedores},
  AcercadeCMSoftware in 'AcercadeCMSoftware.pas' {FormAbout},
  CatalogoCentroCostos in 'CatalogoCentroCostos.pas' {FormCatalogoCentroCostos},
  LineaProducto in 'LineaProducto.pas' {FormLineaProducto},
  CatalogoLinea in 'CatalogoLinea.pas' {FormCatalogoLinea},
  CatalogoEquipos in 'CatalogoEquipos.pas' {FormCatalogoEquipos},
  CatalogoTipoEquipo in 'CatalogoTipoEquipo.pas' {FormCatalogoTipoEquipo},
  Entidades in 'Entidades.pas' {FormEntidades},
  CatalogoEntidades in 'CatalogoEntidades.pas' {FormCatalogoEntidades},
  ControlFolios in 'ControlFolios.pas' {FormFolios},
  BuscaProveedor in 'BuscaProveedor.pas' {FormBuscaProveedor},
  CatalogoCompras in 'CatalogoCompras.pas' {FormCatalogoCompras},
  AltaCompra in 'AltaCompra.pas' {FormAltacompra},
  Almacenes in 'Almacenes.pas' {FormAlmacenes},
  BuscaProducto in 'BuscaProducto.pas' {FormBuscaProducto},
  UserTemp in 'UserTemp.pas' {FormUserTemp},
  Login in 'Login.pas' {FormLogin},
  ConceptosInventario in 'ConceptosInventario.pas' {FormConceptos},
  MovimientosInventario in 'MovimientosInventario.pas' {FormMovimientosInventario},
  AltaMovInventario in 'AltaMovInventario.pas' {FormAltaMovInv},
  Planeador in 'Planeador.pas' {FormPlaneador},
  PanelServicio in 'PanelServicio.pas' {FormServicio},
  PathAgenda in 'PathAgenda.pas' {FormPathAgenda},
  SolicitudServicio in 'SolicitudServicio.pas' {FormSolicitudServicio},
  OrdenServicio in 'OrdenServicio.pas' {FormOrdenServicio},
  OrdendeTrabajo in 'OrdendeTrabajo.pas' {FormOT},
  ProgramacionOrdenes in 'ProgramacionOrdenes.pas' {FormProgramacionOrdenes},
  BuscaEquipos in 'BuscaEquipos.pas' {FormBuscaEquipos},
  BuscaTipoEquipos in 'BuscaTipoEquipos.pas' {FormBuscaTipoEquipo},
  BuscaCuentas in 'BuscaCuentas.pas' {FormBuscaCuentas},
  BuscaLinea in 'BuscaLinea.pas' {FormBuscaLinea},
  ApartadoInventario in 'ApartadoInventario.pas' {FormApartadoInv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainMenu, FormMainMenu);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormProductos, FormProductos);
  Application.CreateForm(TFormProveedor, FormProveedor);
  Application.CreateForm(TFormEquipos, FormEquipos);
  Application.CreateForm(TFormTipoEquipos, FormTipoEquipos);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormCentroCostos, FormCentroCostos);
  Application.CreateForm(TFormLineaProducto, FormLineaProducto);
  Application.CreateForm(TFormEntidades, FormEntidades);
  Application.CreateForm(TFormFolios, FormFolios);
  Application.CreateForm(TFormBuscaProveedor, FormBuscaProveedor);
  Application.CreateForm(TFormAltacompra, FormAltacompra);
  Application.CreateForm(TFormAlmacenes, FormAlmacenes);
  Application.CreateForm(TFormBuscaProducto, FormBuscaProducto);
  Application.CreateForm(TFormUserTemp, FormUserTemp);
  Application.CreateForm(TFormConceptos, FormConceptos);
  Application.CreateForm(TFormAltaMovInv, FormAltaMovInv);
  Application.CreateForm(TFormPathAgenda, FormPathAgenda);
  Application.CreateForm(TFormOrdenServicio, FormOrdenServicio);
  Application.CreateForm(TFormOT, FormOT);
  Application.CreateForm(TFormBuscaEquipos, FormBuscaEquipos);
  Application.CreateForm(TFormBuscaTipoEquipo, FormBuscaTipoEquipo);
  Application.CreateForm(TFormBuscaCuentas, FormBuscaCuentas);
  Application.CreateForm(TFormBuscaLinea, FormBuscaLinea);
  Application.CreateForm(TFormApartadoInv, FormApartadoInv);
  Application.Run;
end.
