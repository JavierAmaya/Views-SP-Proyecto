CREATE VIEW pFacturas.ViewFacturasPorCobrar 

AS 

SELECT 
    fc.IDFactura,
    c.NombreCliente,
    c.ApellidoCliente,
    f.FechaCreacion,
    f.FechaLimite,
    e.NombreEmpleado,
    e.ApellidoEmpleado
FROM pFacturas.FacturaCliente as fc
INNER JOIN pFacturas.Factura as f
ON fc.IDFactura = f.IDFactura
INNER JOIN pFacturas.Cliente as c 
ON fc.IDCliente = c.IDCliente
INNER JOIN pFacturas.Empleado as e 
ON f.IDEmpleado = e.IDEmpleado
WHERE f.TipoFactura = 1