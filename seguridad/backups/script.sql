--CERTIFICADO
USE master
GO 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'abc123..';
GO 
CREATE CERTIFICATE certificado_prl
WITH SUBJECT = 'Pablo Certifica esto'
GO
SELECT * FROM sys.certificates WHERE name = 'certificado_prl'
GO
--BACKUP CERTIFICADO
BACKUP CERTIFICATE certificado_prl TO FILE = '/extras/prl.cer'
    WITH PRIVATE KEY 
    (
        FILE = '/extras/prl_priv.pvk',
        ENCRYPTION BY PASSWORD = 'abc123..'
    )
GO 
--CREAR BACKUP
USE Gaitas_Enc
GO 
CREATE DATABASE Encryption KEY 
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE certificado_prl;
GO 

ALTER DATABASE Gaitas_Enc
SET ENCRYPTION ON; 
GO 

USE master
GO 
BACKUP DATABASE Gaitas_Enc
TO DISK = '/extras/gaitasback.bak'
WITH ENCRYPTION (ALGORITHM = AES_256, SERVER CERTIFICATE = certificado_prl)
GO
--RESTAURAR BACKUP
RESTORE DATABASE Gaitas_Test_Enc FROM DISK = '/extras/gaitasback.bak';
GO