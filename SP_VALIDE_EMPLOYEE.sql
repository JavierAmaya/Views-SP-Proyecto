/*
SELECT EmailEmpleado,UsuarioAsignado,[Password] FROM pFacturas.Empleado
WHERE (EmailEmpleado = 'VictorAmaya@gmail.com' or UsuarioAsignado = 'vjamaya') And [Password] = '12345'
SELECT * FROM pFacturas.Empleado */
ALTER PROCEDURE pFacturas.SP_VALIDE_EMPLOYEE
    @EmailEmpleado NVARCHAR(50),
    @Password NVARCHAR(20)
AS

DECLARE @existe INT= (
    SELECT count(*) as N 
    FROM pFacturas.Empleado 
    WHERE ((EmailEmpleado = @EmailEmpleado or UsuarioAsignado = @EmailEmpleado  ))
)
DECLARE @existe2 INT= (
    SELECT count(*) as N 
    FROM pFacturas.Empleado 
    WHERE ((EmailEmpleado = @EmailEmpleado or UsuarioAsignado = @EmailEmpleado  ) And [Password] = @Password)
)

IF @existe > 0 and @existe2 <=0 BEGIN
    SELECT 0 as Successed, 'Contraseña Incorrecta' as MSG
END 

If @existe <= 0 and @existe2 <=0 BEGIN
    SELECT 0 as Successed, 'Usuario No existe' as MSG
END
If @existe > 0 and @existe2 >0 BEGIN
    SELECT 1 as Successed, 'Usuario encontrado' as MSG, @EmailEmpleado as NombreUsuario
END

EXEC pFacturas.SP_VALIDE_EMPLOYEE 
@EmailEmpleado = 'vjamaya',
@Password =  '12345'
