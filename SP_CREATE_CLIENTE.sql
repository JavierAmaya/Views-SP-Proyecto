CREATE PROCEDURE pFacturas.SP_CREATE_CLIENTE
    @NombreCliente NVARCHAR(100),
    @ApellidoCliente NVARCHAR(100),
    @RTN NVARCHAR(26),
    @EmailCliente NVARCHAR(50),
    @Telefono NVARCHAR(20),
    @Direccion1 NVARCHAR(200),
    @Direccion2 NVARCHAR(200)
AS

    DECLARE @existeRTN INT = (SELECT count(*) as N FROM pFacturas.Cliente WHERE RTN = @RTN)

    IF @existeRTN > 0 BEGIN
        SELECT 0 as Successed , 'Este Cliente ya existe'
    END

    ELSE BEGIN

        INSERT INTO pFacturas.Cliente
        VALUES (@NombreCliente,@ApellidoCliente,@RTN,@EmailCliente,@Telefono,@Direccion1,@Direccion2)
        SELECT 1 as Successed, 'Tu registro fue almacenado' as MSG

    END

GO
