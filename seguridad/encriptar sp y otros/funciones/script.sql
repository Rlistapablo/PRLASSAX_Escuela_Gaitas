USE EscuelaGaitas_prl
GO 
CREATE FUNCTION Persona_Calle(@DNI CHAR(9))
RETURNS TABLE AS
RETURN (
    SELECT p.NIF, p.Nombre, CONVERT(VARCHAR(50), ENCRYPTBYKEY(KEY_GUID('abc123..'),t.Nombre)) AS Calle, t.Codigo_Postal FROM Personas p
    INNER JOIN Localización t ON p.Localización_ID_Localización = t.ID_Localización
    WHERE p.NIF = @DNI
)
GO 
SELECT NIF, Nombre, CONVERT(VARCHAR(50),DECRYPTBYPASSPHRASE('abc123..',t.Nombre)), Codigo_Postal FROM Persona_Calle('43228486P')
GO