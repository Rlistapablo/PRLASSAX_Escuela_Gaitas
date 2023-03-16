DROP DATABASE IF EXISTS Gaitas_Row
GO 
CREATE DATABASE Gaitas_Row
GO 
USE Gaitas_Row
GO 
CREATE USER Becario WITHOUT LOGIN 
GO 
CREATE USER Jefe WITHOUT LOGIN 
GO
CREATE TABLE alum_prof(
    ID int PRIMARY KEY NOT NULL,
    NIF CHAR(9) NOT NULL,
    Profesor VARCHAR(50) NOT NULL
)


--FUNCION
CREATE FUNCTION dbo.recepcionporusers (@user AS sysname)
RETURNS TABLE 
WITH SCHEMABINDING
AS
RETURN (SELECT 1 AS recepcionporusers WHERE @user=USER_NAME()OR (USER_NAME()='Jefe'))
GO
CREATE SECURITY POLICY PoliticaSeguridadRecepcion
ADD FILTER PREDICATE dbo.recepcionporusers(Profesor) ON dbo.alum_prof
GO
ALTER SECURITY POLICY PoliticaSeguridadRecepcion WITH (STATE=ON)
GRANT SELECT ON dbo.alum_prof TO Becario
GO
EXECUTE AS USER = 'Becario'
GO
PRINT USER
GO
SELECT * FROM alum_prof
GO
REVERT 
GO