USE Gaitas_Personas
GO
SELECT db.compatibility_level
	FROM sys.databases as db
	WHERE db.name = Db_Name();
GO
ALTER DATABASE Gaitas_Personas
SET COMPATIBILITY_LEVEL = 150;
GO
ALTER DATABASE Gaitas_Personas 
SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON; 
GO
ALTER DATABASE Gaitas_Personas
    ADD FILEGROUP gaitas_men CONTAINS MEMORY_OPTIMIZED_DATA;
GO
ALTER DATABASE Gaitas_Personas
    ADD FILE (
        NAME = N'Gaitas_men',
        FILENAME = N'/extras/gaitas_mem'
)
TO FILEGROUP gaitas_men
GO
CREATE TABLE instrumentos3
    (
        ID int PRIMARY KEY NONCLUSTERED,
        Instrumento VARCHAR(50) NOT NULL,
        Marca VARCHAR(50) NOT NULL,
        Fecha_Compra date NOT NULL,)
    WITH (Memory_optimized = ON, Durability = SCHEMA_AND_DATA);
GO 