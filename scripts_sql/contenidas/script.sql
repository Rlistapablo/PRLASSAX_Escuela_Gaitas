USE master
GO 
EXEC sp_configure 'show advanced options', 1
GO 
RECONFIGURE 
GO
EXEC sp_configure 'contained database authentication', 1
GO
RECONFIGURE 
GO