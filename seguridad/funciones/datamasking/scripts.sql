DROP DATABASE IF EXISTS Gaitas_Masking
GO 
CREATE DATABASE Gaitas_Masking
GO
USE Gaitas_Masking
GO 
CREATE TABLE alum_tar(
    ID int PRIMARY KEY NOT NULL,
    NIF CHAR(9) NOT NULL,
    Numero VARCHAR(30) NOT NULL,
    CVC CHAR(3) NOT NULL,
    Caducidad DATE NOT NULL
)
DROP USER IF EXISTS Administracion
GO 
CREATE USER Administracion WITHOUT LOGIN
GO 
GRANT SELECT ON alum_tar TO Administracion
GO
CREATE OR ALTER PROCEDURE mascaras
AS
BEGIN
SELECT c.name, tbl.name as table_name, c.is_masked, c.masking_function FROM sys.masked_columns 
AS c JOIN sys.tables AS tbl ON c.object_id = tbl.object_id
WHERE is_masked = 1;
END
GO
--DEFAULT
ALTER TABLE alum_tar
ALTER COLUMN CVC CHAR(3) MASKED WITH (FUNCTION = 'default()')
GO
EXECUTE AS USER = 'Administracion'
GO
PRINT USER
GO
SELECT * FROM alum_tar
GO
REVERT 
GO
--PARTIAL
ALTER TABLE alum_tar
ALTER COLUMN Numero VARCHAR(50) MASKED WITH (FUNCTION = 'partial(0,"---------",5)')
GO
EXECUTE AS USER = 'Administracion'
GO
PRINT USER
GO
SELECT * FROM alum_tar
GO
REVERT 
GO
--RANDOM
ALTER TABLE alum_tar
ALTER COLUMN CVC int MASKED WITH (FUNCTION = 'random(0,999)')
GO
EXECUTE AS USER = 'Administracion'
GO
PRINT USER
GO
SELECT * FROM alum_tar
GO
REVERT 
GO
--DATE
ALTER TABLE alum_tar
ALTER COLUMN Caducidad ADD MASKED WITH (FUNCTION = 'datetime("Y")')
GO
EXECUTE AS USER = 'Administracion'
GO
PRINT USER
GO
SELECT * FROM alum_tar
GO
REVERT 
GO
--UNMASK
GRANT UNMASK TO Administracion
GO 
REVOKE UNMASK TO Administracion
GO