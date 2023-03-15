DROP DATABASE IF EXISTS Gaitas_Personas
GO 
CREATE DATABASE Gaitas_Personas 
CONTAINMENT = Partial
GO 
USE Gaitas_Personas
GO 
SELECT * INTO dbo.Personas
    FROM EscuelaGaitas_prl.Personas
GO