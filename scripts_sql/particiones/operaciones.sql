--MERGE
ALTER PARTITION FUNCTION Filtro_DNI ()
    MERGE RANGE(500);
GO 
--SELECT COMPROBACION
SELECT partition_number,row_count FROM sys.dm_db_partition_stats
    WHERE object_id = OBJECT_ID('dbo.Test_Persona')
GO
--SPLIT
ALTER PARTITION FUNCTION Filtro_DNI ()
    SPLIT RANGE (2000)
GO
--SWITCH
CREATE TABLE Test_Persona2(
    NIF int IDENTITY(1,50) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL 
) ON Filtro_DNI_Schema (NIF)
GO 
ALTER TABLE Test_Persona
SWITCH PARTITION 1 TO TEST_Persona2 PARTITION 1
GO
--COMPROBACION
SELECT * FROM sys.dm_db_partition_stats 
WHERE object_id = OBJECT_ID('dbo.Test_Persona');
GO
SELECT * FROM sys.dm_db_partition_stats 
WHERE object_id = OBJECT_ID('dbo.Test_Persona2');
GO