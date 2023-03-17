ALTER TABLE Tipos_de_gaitas
ADD Tipo_de_gaitas UNIQUEIDENTIFIER NOT NULL
PRIMARY KEY NONCLUSTERED DEFAULT NEWID()
GO
ALTER TABLE Tipos_de_gaitas
ALTER COLUMN Tipo_de_gaitas ADD ROWGUIDCOL
GO
ALTER TABLE Tipos_de_gaitas
ADD Imagen VARBINARY(MAX) FILESTREAM NULL
GO 
ALTER TABLE Instrumentos
ALTER COLUMN Tipos_de_gaitas_ID_Tipo_de_gaita uniqueidentifier


ALTER TABLE Instrumentos
ADD CONSTRAINT FK_TIPO
FOREIGN KEY (Tipos_de_gaitas_ID_Tipo_de_gaita) REFERENCES Tipos_de_gaitas(Tipo_de_Gaitas);