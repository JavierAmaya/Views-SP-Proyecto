ALTER PROCEDURE [pFacturas].[SP_DELETE_CLIENTE]
    @IDCliente int
AS

DECLARE @existe INT = (SELECT count(IDCliente) as N FROM pFacturas.Cliente WHERE IDCliente = @IDCliente)

IF @existe = 0 BEGIN
    SELECT 0 as Successed, 'Cliente No existe en la base' as MSG
END ELSE BEGIN

    DECLARE @existeFactura INT = (SELECT count(*) as NFacturas FROM pFacturas.FacturaCliente WHERE IDCliente = @IDCliente)

    IF @existeFactura > 0 BEGIN
        SELECT 0 as Successed, 'Este cliente tiene '+CAST(@existeFactura as nvarchar(10))+' facturas registradas a su nombre' as MSG
    END

    ELSE BEGIN

        DELETE FROM pFacturas.Cliente
        WHERE IDCliente = @IDCliente
        
        SELECT 1 as Successed, 'El Cliente fue eliminado' as MSG
    END

END
GO
