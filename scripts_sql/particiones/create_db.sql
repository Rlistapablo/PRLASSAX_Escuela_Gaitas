ALTER DATABASE Gaitas_Personas
ADD FILEGROUP gaitas_part1
GO
ALTER DATABASE Gaitas_Personas
ADD FILEGROUP gaitas_part2
GO
ALTER DATABASE Gaitas_Personas
ADD FILE (
    NAME = gaitaspart1,
    FILENAME = '/extras/gpart1.ndf',
    SIZE = 10 MB,
    MAXSIZE = 50 MB,
    FILEGROWTH = 1 MB
) TO FILEGROUP gaitas_part1
GO 
ALTER DATABASE Gaitas_Personas
ADD FILE (
    NAME = gaitaspart2,
    FILENAME = '/extras/gpart2.ndf',
    SIZE = 10 MB,
    MAXSIZE = 50 MB,
    FILEGROWTH = 1 MB
) TO FILEGROUP gaitas_part2
GO
SELECT * FROM sys.filegroups
GO
--PRIMARY	1	FG	ROWS_FILEGROUP	1	0	NULL	NULL	0	0
--gaitas_part1	2	FG	ROWS_FILEGROUP	0	0	4B1A5B62-52FC-481F-ABA0-0BC24FA7AAFD	NULL	0	0
--gaitas_part2	3	FG	ROWS_FILEGROUP	0	0	EB993259-3883-49A4-BAB7-FD15B1C008FC	NULL	0