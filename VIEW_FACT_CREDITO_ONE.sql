CREATE VIEW pFacturas.VIEW_FACT_CREDITO_ONE

AS 

SELECT 
    f.IDFactura,
    p.NameProducto,
    df.Cantidad,
    p.ValorVenta,
    c.NombreCliente

FROM pFacturas.Factura as f 
INNER JOIN pFacturas.DetalleFactura as df
ON f.IDFactura = df.IDFactura
INNER JOIN pFacturas.Producto as p
ON df.IDProducto = p.IDProducto
INNER JOIN pFacturas.FacturaCliente as fc
ON f.IDFactura = fc.IDFactura
INNER JOIN pFacturas.Cliente as c
ON fc.IDCliente = c.IDCliente
