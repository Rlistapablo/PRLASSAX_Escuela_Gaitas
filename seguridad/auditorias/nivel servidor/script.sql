USE master
GO 
CREATE DATABASE Gaitas_Auditoria
GO 
USE Gaitas_Auditoria
GO 
CREATE TABLE Alumnos(
    ID int PRIMARY KEY NONCLUSTERED,
    Nombre VARCHAR(50) NOT NULL,
    DNI CHAR(9) NOT NULL,
    Curso VARCHAR(50) NOT NULL,
)
GO
CREATE USER Recepcion WITHOUT LOGIN
GO 
GRANT SELECT ON Alumnos TO Recepcion
GO 
SELECT * FROM CLIENTE
UPDATE Alumnos
SET Nombre = 'xdd'
WHERE Curso = 'curso 1'
GO
SELECT * FROM sys.fn_get_audit_file ('/extras/Gaitas_Auditoria_log_0F932FB3-C3F9-4C3F-9029-5EB5E34D2D3B_0_133234419462030000.sqlaudit',default,default)
GO