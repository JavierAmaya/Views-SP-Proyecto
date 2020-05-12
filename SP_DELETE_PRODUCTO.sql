ALTER PROCEDURE pFacturas.SP_DELETE_PRODUCT
    @IDProducto int 
AS

DECLARE @existe INT = (SELECT count(*) as N from pFacturas.Producto Where IDProducto = @IDProducto)

IF @existe = 0 BEGIN 
    SELECT 0 as Successed, 'No existe un registro con este ID' as MSG
END

ELSE BEGIN

    DECLARE @existeEnFacturas INT = (SELECT count(*) as NProductos FROM pFacturas.DetalleFactura WHERE IDProducto = @IDProducto)

        IF @existeEnFacturas > 0 BEGIN
            SELECT 0 as Successed, 'Este producto no se puede eliminar ya que esta registrado en ' +CAST(@existeEnFacturas AS nvarchar(10))+' Facturas' as MSG
        END

        ELSE BEGIN

            DELETE FROM pFacturas.Producto
            WHERE IDProducto = @IDProducto

            
            SELECT 1 as Successed, 'El producto ha sido eliminado' as MSG 
        
        END

END
GO
