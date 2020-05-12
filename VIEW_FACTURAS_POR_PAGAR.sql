CREATE VIEW pFacturas.ViewFacturasPorPagar

AS

SELECT 
    f.IDFactura,
    p.NameProducto,
    pv.NombreProveedor
FROM pFacturas.DetalleFactura as df
INNER JOIN pFacturas.Factura as f 
ON df.IDFactura = f.IDFactura
INNER JOIN pFacturas.Producto as p
ON df.IDProducto = p.IDProducto
INNER JOIN pFacturas.Proveedor as pv 
ON p.IDProveedor = pv.IDProveedor
WHERE f.TipoFactura = 2




