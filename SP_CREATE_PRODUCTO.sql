ALTER PROCEDURE pFacturas.SP_CREATE_PRODUCTO
    @NameProducto NVARCHAR(200),
    @Descripcion NVARCHAR(max),
    @IDProveedor INT,
    @IDCategoria INT,
    @ValorCompra INT,
    @ValorVenta INT
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.Producto where NameProducto = @NameProducto)
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'El producto que esta intentado crear ya existe' as MSG
END ELSE BEGIN
    INSERT INTO pFacturas.Producto
    VALUES (@NameProducto, @Descripcion, @IDProveedor, @IDCategoria, @ValorCompra, @ValorVenta)
    SELECT 1 as successed, 'Tu registro fue almacenado' as MSG
END
