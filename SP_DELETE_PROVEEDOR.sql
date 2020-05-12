ALTER PROCEDURE pFacturas.SP_DELETE_PROVEEDORES
    @IDProveedor int
AS

DECLARE @existe INT = (SELECT count(IDProveedor) as N FROM pFacturas.Proveedor WHERE IDProveedor =  @IDProveedor)

IF @existe = 0 BEGIN
    SELECT 0 as Successed, 'No hay un proveedor registrado con este ID' as MSG
END ELSE BEGIN

    DECLARE @existeProducto INT = (Select count(*) as NProductos FROM pFacturas.Producto WHERE IDProveedor = @IDProveedor)

    IF @existeProducto > 0 BEGIN
        SELECT 0 as Successed, 'Este Proveedor posee '+CAST(@existeProducto as nvarchar(10))+' productos registrados' as MSG
    END
    ELSE BEGIN 

        DELETE FROM pFacturas.Proveedor
        WHERE IDProveedor = @IDProveedor
        
        SELECT 1 as Successed, 'El Proveedor ha sido eliminado' as MSG
    END

END
GO
