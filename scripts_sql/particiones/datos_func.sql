SELECT * FROM sys.PARTITION_functions
GO 
SELECT * FROM sys.PARTITION_schemes
GO
SELECT * FROM sys.dm_db_partition_stats 
WHERE object_id = OBJECT_ID('dbo.Test_Personas');
GO