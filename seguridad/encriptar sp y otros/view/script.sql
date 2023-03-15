USE Gaitas_Personas
GO 
CREATE VIEW Persona_NIF_Nombre AS
SELECT NIF, CONVERT(VARCHAR(50),ENCRYPTBYKEY(KEY_GUID('abc123..'),Nombre)) AS Fecha_Nacimiento FROM Personas
GO