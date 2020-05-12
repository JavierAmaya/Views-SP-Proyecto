
CREATE PROCEDURE pFacturas.SP_One_Customer_Many_Invoices
    @IDCliente int
AS
SELECT FC.IDFactura as NumeroFactura,F.FechaCreacion,F.FechaLimite, TF.TipoFactura,EM.NombreEmpleado  FROM pFacturas.FacturaCliente as FC
INNER JOIN pFacturas.Cliente as C
on FC.IDCliente = C.IDCliente
INNER JOIN pFacturas.Factura AS F
on FC.IDFactura = F.IDFactura
INNER JOIN pFacturas.TipoFactura as TF
on F.TipoFactura = TF.IDTipoFactura
INNER JOIN pFacturas.Empleado as EM
on F.IDEmpleado = EM.IDEmpleado
WHERE Fc.IDCliente =  @IDCliente
