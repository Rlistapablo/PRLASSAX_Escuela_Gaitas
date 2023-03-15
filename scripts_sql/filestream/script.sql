USE master
GO
EXEC sp_configure 'filestream access level', '2'
RECONFIGURE 
GO