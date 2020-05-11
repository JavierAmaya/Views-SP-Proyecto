ALTER PROCEDURE pFacturas.SP_CREATE_FACTURA_CLIENTE
    @IDFactura int,
    @IDCliente int
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.FacturaCliente where IDFactura = @IDFactura)
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'La Factura que esta enviando ya es una factura Tipo Credito' as MSG
END 
DECLARE @existeFactura INT = (SELECT COUNT(*) as E FROM pFacturas.Factura WHERE IDFactura=@IDFactura)
IF @existeFactura > 0 BEGIN
    INSERT INTO pFacturas.FacturaCliente
    VALUES (@IDFactura,@IDCliente)
    SELECT 1 as successed, 'Tu registro fue almacenado' as MSG
END    

Select *from pFacturas.FacturaCliente