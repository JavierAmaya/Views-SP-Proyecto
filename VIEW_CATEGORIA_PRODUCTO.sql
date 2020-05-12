
CREATE VIEW pFacturas.ViewCategoriaByProducto
AS
SELECT 
    pf.IDProducto,
    pf.NameProducto,
    c.NameCategoria
FROM pFacturas.Producto as pf
INNER JOIN pFacturas.Categoria as c 
ON pf.IDCategoria = c.IDCategoria


GO
