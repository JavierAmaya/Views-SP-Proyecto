Alter VIEW example.viewSuppliersbyProducts as
SELECT 
    s.SupplierID,
    SupplierName,
    COUNT(ProductID) as Products
from example.Suppliers as s
LEFT JOIN example.Products as p
on s.SupplierID=p.SupplierID
GROUP by s.SupplierID,
    SupplierName

