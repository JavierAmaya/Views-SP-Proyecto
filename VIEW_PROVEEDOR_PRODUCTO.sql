CREATE VIEW pFacturas.ViewProveedorByProducto
AS
SELECT 
    pf.IDProducto,
    pf.NameProducto,
    p.NombreProveedor,
    pf.ValorCompra,
    pf.ValorVenta
FROM pFacturas.Producto as pf
INNER JOIN pFacturas.Proveedor as p 
ON pf.IDProveedor = p.IDProveedor


GO
