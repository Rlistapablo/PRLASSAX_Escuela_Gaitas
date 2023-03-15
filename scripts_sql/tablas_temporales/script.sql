USE Gaitas_Persona 
GO 
CREATE TABLE instrumentos2
    (
        ID int PRIMARY KEY,
        Instrumento VARCHAR(50) NOT NULL,
        Marca VARCHAR(50) NOT NULL,
        Fecha_Compra date NOT NULL,
        SysStartTime datetime2 generated always as row start not null, 
        SysEndTime datetime2 generated always as row end not null,
        period for System_time (SysStartTime,SysEndTime) )
    WITH (System_Versioning = ON (History_Table=dbo.instrumentos_all))
GO 
