CREATE PROCEDURE pFacturas.SP_DELETE_FACTURACLIENTE
    @IDFactura int
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.FacturaCliente where IDFactura = @IDFactura)
IF @existe > 0 BEGIN
    
    DELETE FROM pFacturas.FacturaCliente 
    WHERE IDFactura = @IDFactura

    SELECT 1  as successed, 'Su registro tambien fue eliminado de FacturaCliente' as MSG
END ELSE BEGIN    
  
    SELECT 0 as successed, 'Puede que tu Factura no es de tipo Credito' as MSG

END   
