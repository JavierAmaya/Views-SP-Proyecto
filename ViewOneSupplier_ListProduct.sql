

ALTER VIEW pFacturas.ViewOneSupplier_ListProduct 
as
SELECT NameProducto,po.Descripcion,Ca.Namecategoria,ValorVenta,IDProveedor
FROM pFacturas.Producto as po
INNER JOIN pFacturas.Categoria as Ca
on po.IDCategoria = ca.IDCategoria

/*
WHERE IDProveedor = pFacturas.IDOneProveedor()

SELECT * from pFacturas.ViewOneSupplier_ListProduct
/*select * from pFacturas.Categoria
SELECT IDProveedor from pFacturas.Producto*/

