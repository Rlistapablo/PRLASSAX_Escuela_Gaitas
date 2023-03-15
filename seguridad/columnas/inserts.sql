EXEC AS User= 'Recepcion_Gaitas'
GO 
PRINT USER
GO
OPEN SYMMETRIC KEY Clave_Cuentas DECRYPTION BY PASSWORD='abc123..'
GO
INSERT INTO Alumnos VALUES('3','Daryn','Dinkins',EncryptByKey(Key_GUID('Clave_Cuentas'),'7682-5939-7932-7291'));
INSERT INTO Alumnos VALUES('4','Aristomenis','Ory',EncryptByKey(Key_GUID('Clave_Cuentas'),'7003-7466-9446-2234'));
INSERT INTO Alumnos VALUES('5','Avi','Eastman',EncryptByKey(Key_GUID('Clave_Cuentas'),'2658-4857-4823-3378'));
INSERT INTO Alumnos VALUES('6','Decklan','Caswell',EncryptByKey(Key_GUID('Clave_Cuentas'),'4819-2440-6839-2334'));
INSERT INTO Alumnos VALUES('7','Gjan','Moore',EncryptByKey(Key_GUID('Clave_Cuentas'),'6589-7553-8854-2270'));
INSERT INTO Alumnos VALUES('8','Bentley','Kaskel',EncryptByKey(Key_GUID('Clave_Cuentas'),'1359-6884-8954-9734'));
INSERT INTO Alumnos VALUES('9','Fares','Nuttle',EncryptByKey(Key_GUID('Clave_Cuentas'),'5941-9398-9074-2687'));
INSERT INTO Alumnos VALUES('10','Aeron','Mccord',EncryptByKey(Key_GUID('Clave_Cuentas'),'3471-7226-4573-9815'));
INSERT INTO Alumnos VALUES('11','Daimhin','Thompson',EncryptByKey(Key_GUID('Clave_Cuentas'),'5632-5618-4557-5458'));
INSERT INTO Alumnos VALUES('12','Finnen','Weinstein',EncryptByKey(Key_GUID('Clave_Cuentas'),'8054-2172-1418-7346'));
INSERT INTO Alumnos VALUES('13','Hashim','Quinn',EncryptByKey(Key_GUID('Clave_Cuentas'),'7364-3198-2143-7399'));
INSERT INTO Alumnos VALUES('14','Digby','Trebil',EncryptByKey(Key_GUID('Clave_Cuentas'),'6371-1472-4258-9757'));
INSERT INTO Alumnos VALUES('15','Haydon','Leisinger',EncryptByKey(Key_GUID('Clave_Cuentas'),'3523-9072-9157-2201'));
INSERT INTO Alumnos VALUES('16','Bradley','Sagar',EncryptByKey(Key_GUID('Clave_Cuentas'),'4693-4350-9960-9580'));
INSERT INTO Alumnos VALUES('17','Brooklyn','Mills',EncryptByKey(Key_GUID('Clave_Cuentas'),'9822-2298-8127-5844'));
INSERT INTO Alumnos VALUES('18','Curtis','Bowers',EncryptByKey(Key_GUID('Clave_Cuentas'),'6947-1592-3183-4705'));
INSERT INTO Alumnos VALUES('19','Brunon','Darnell',EncryptByKey(Key_GUID('Clave_Cuentas'),'7780-9746-7468-3629'));
INSERT INTO Alumnos VALUES('20','Fabian','Bongard',EncryptByKey(Key_GUID('Clave_Cuentas'),'3633-4008-1539-7131'));
INSERT INTO Alumnos VALUES('21','Haroon','Christensen',EncryptByKey(Key_GUID('Clave_Cuentas'),'6678-8250-2887-8774'));
INSERT INTO Alumnos VALUES('22','Aytug','Resnick',EncryptByKey(Key_GUID('Clave_Cuentas'),'8671-5881-8535-1352'));
INSERT INTO Alumnos VALUES('23','Arturo','Irwin',EncryptByKey(Key_GUID('Clave_Cuentas'),'3216-8988-5783-7286'));
INSERT INTO Alumnos VALUES('24','Derry','Ory',EncryptByKey(Key_GUID('Clave_Cuentas'),'7612-4362-5491-5411'));
INSERT INTO Alumnos VALUES('25','Aran','Weinstein',EncryptByKey(Key_GUID('Clave_Cuentas'),'4927-6229-9691-5722'));
INSERT INTO Alumnos VALUES('26','Andrea','Boyd',EncryptByKey(Key_GUID('Clave_Cuentas'),'5858-3243-6497-8169'));
INSERT INTO Alumnos VALUES('27','Darrius','Tapia',EncryptByKey(Key_GUID('Clave_Cuentas'),'5969-6224-9100-1462'));
REVERT