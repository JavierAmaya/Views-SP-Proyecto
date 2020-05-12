alter PROCEDURE pFacturas.SP_DELETE_CLIENTE
    @IDCliente int
AS

DECLARE @existe INT = (SELECT count(IDCliente) as N FROM pFacturas.Cliente WHERE IDCliente = @IDCliente)

IF @existe = 0 BEGIN
    SELECT 0 as Successed, 'Usuario No existe en la base' as MSG
END ELSE BEGIN

    DELETE FROM pFacturas.Cliente
    WHERE IDCliente = @IDCliente
    
    SELECT 1 as Successed, 'Tu registro fue eliminado' as MSG

END