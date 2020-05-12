ALTER VIEW ViewOnecustomerManyInvoices as
SELECT FC.IDFactura as NumeroFactura,F.FechaCreacion,FechaLimite,TF.TipoFactura,EM.NombreEmpleado  FROM pFacturas.FacturaCliente as FC
INNER JOIN pFacturas.Cliente as C
on FC.IDCliente = C.IDCliente
INNER JOIN pFacturas.Factura AS F
on FC.IDFactura = F.IDFactura
INNER JOIN pFacturas.TipoFactura as TF
on F.TipoFactura = TF.IDTipoFactura
INNER JOIN pFacturas.Empleado as EM
on F.IDEmpleado = EM.IDEmpleado
/*
SELECT * FROM ViewOnecustomerManyInvoices*/
/* WHERE FC.IDCliente = 2
SELECT * FROM pFacturas.DetalleFactura*/