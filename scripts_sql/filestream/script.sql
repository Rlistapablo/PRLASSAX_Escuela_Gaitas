USE master
GO
EXEC sp_configure 'filestream access level', '2'
RECONFIGURE 
GO
ALTER DATABASE EscuelaGaitas_prl
    ADD FILEGROUP fg_gaitas CONTAINS FILESTREAM
GO
ALTER DATABASE EscuelaGaitas_prl
    ADD FILE (
        NAME = N'EscuelaDeGaitas_fs',
        FILENAME = N'Z:\Gaitas'
)
TO FILEGROUP fg_gaitas
GO