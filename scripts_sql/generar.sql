-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2023-03-14 23:50:40 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Alumno_curso 
    (
     Alumnos_NIF CHAR (9) NOT NULL , 
     Curso_ID_Curso CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Alumno_curso ADD CONSTRAINT Alumno_curso_PK PRIMARY KEY CLUSTERED (Alumnos_NIF, Curso_ID_Curso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Alumnos 
    (
     NIF CHAR (9) NOT NULL , 
     ID_Alumno CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Alumnos ADD CONSTRAINT Alumnos_PK PRIMARY KEY CLUSTERED (NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE Alumnos ADD CONSTRAINT Alumnos_PKv1 UNIQUE NONCLUSTERED (ID_Alumno)
GO

CREATE TABLE Aula 
    (
     ID_Aula CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Aula ADD CONSTRAINT Aula_PK PRIMARY KEY CLUSTERED (ID_Aula)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Conserje 
    (
     NIF CHAR (9) NOT NULL , 
     ID_Conserje CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Conserje ADD CONSTRAINT Conserje_PK PRIMARY KEY CLUSTERED (NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE Conserje ADD CONSTRAINT Conserje_PKv1 UNIQUE NONCLUSTERED (ID_Conserje)
GO

CREATE TABLE Curso 
    (
     ID_Curso CHAR (9) NOT NULL , 
     Aula_ID_Aula CHAR (9) NOT NULL , 
     Nombre VARCHAR (100) NOT NULL , 
     Fecha_Inicio DATE NOT NULL , 
     Fecha_Final DATE , 
     Descrición VARCHAR (MAX) 
    )
GO

ALTER TABLE Curso ADD CONSTRAINT Curso_PK PRIMARY KEY CLUSTERED (ID_Curso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Curso_Estilo 
    (
     Estilo_de_música_ID_estilo CHAR (9) NOT NULL , 
     Curso_ID_Curso CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Curso_Estilo ADD CONSTRAINT Curso_Estilo_PK PRIMARY KEY CLUSTERED (Estilo_de_música_ID_estilo, Curso_ID_Curso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Efectivo 
    (
     ID_Pago CHAR (9) NOT NULL , 
     ID_Alumno CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Efectivo ADD CONSTRAINT Efectivo_PK PRIMARY KEY CLUSTERED (ID_Pago, ID_Alumno)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Email 
    (
     Emails VARCHAR (200) NOT NULL , 
     Personas_NIF CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Email ADD CONSTRAINT Email_PK PRIMARY KEY CLUSTERED (Emails, Personas_NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Especialidades 
    (
     ID_Especialidad CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     Descripción VARCHAR (MAX) 
    )
GO

ALTER TABLE Especialidades ADD CONSTRAINT Especialidades_PK PRIMARY KEY CLUSTERED (ID_Especialidad)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Estilo_de_música 
    (
     ID_estilo CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Estilo_de_música ADD CONSTRAINT Estilo_de_música_PK PRIMARY KEY CLUSTERED (ID_estilo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Instrumentos 
    (
     ID_Instrumento CHAR (9) NOT NULL , 
     Aula_ID_Aula CHAR (9) NOT NULL , 
     Tipos_de_gaitas_ID_Tipo_de_gaita CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Instrumentos ADD CONSTRAINT Instrumentos_PK PRIMARY KEY CLUSTERED (ID_Instrumento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Localización 
    (
     ID_Localización CHAR (9) NOT NULL , 
     Municipio_ID_Municipio CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     Codigo_Postal CHAR (5) NOT NULL 
    )
GO

ALTER TABLE Localización ADD CONSTRAINT Localización_PK PRIMARY KEY CLUSTERED (ID_Localización)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Municipio 
    (
     ID_Municipio CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Municipio ADD CONSTRAINT Municipio_PK PRIMARY KEY CLUSTERED (ID_Municipio)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pagos 
    (
     ID_Pago CHAR (9) NOT NULL , 
     Alumnos_ID_Alumno CHAR (9) NOT NULL , 
     Fecha DATE NOT NULL , 
     Precio MONEY NOT NULL 
    )
GO

ALTER TABLE Pagos ADD CONSTRAINT Pagos_PK PRIMARY KEY CLUSTERED (ID_Pago, Alumnos_ID_Alumno)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Personas 
    (
     NIF CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     Apellidos VARCHAR (100) NOT NULL , 
     Localización_ID_Localización CHAR (9) NOT NULL , 
     Fecha_de_nacimiento DATE 
    )
GO

ALTER TABLE Personas ADD CONSTRAINT Personas_PK PRIMARY KEY CLUSTERED (NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Profesor_Curso 
    (
     Profesores_NIF CHAR (9) NOT NULL , 
     Curso_ID_Curso CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Profesor_Curso ADD CONSTRAINT Profesor_Curso_PK PRIMARY KEY CLUSTERED (Profesores_NIF, Curso_ID_Curso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Profesor_Especialidad 
    (
     Especialidades_ID_Especialidad CHAR (9) NOT NULL , 
     Profesores_NIF CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Profesor_Especialidad ADD CONSTRAINT Profesor_Especialidad_PK PRIMARY KEY CLUSTERED (Especialidades_ID_Especialidad, Profesores_NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Profesores 
    (
     NIF CHAR (9) NOT NULL , 
     ID_Profesor CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Profesores ADD CONSTRAINT Profesores_PK PRIMARY KEY CLUSTERED (NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE Profesores ADD CONSTRAINT Profesores_PKv1 UNIQUE NONCLUSTERED (ID_Profesor)
GO

CREATE TABLE Salario 
    (
     ID_Salario CHAR (9) NOT NULL , 
     Trabajadores_NIF CHAR (9) NOT NULL , 
     Importe MONEY NOT NULL , 
     Cuenta VARBINARY NOT NULL , 
     Fecha DATE NOT NULL 
    )
GO

ALTER TABLE Salario ADD CONSTRAINT Salario_PK PRIMARY KEY CLUSTERED (ID_Salario, Trabajadores_NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tarjeta 
    (
     ID_Pago CHAR (9) NOT NULL , 
     ID_Alumno CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_PK PRIMARY KEY CLUSTERED (ID_Pago, ID_Alumno)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Telefono 
    (
     Telefono CHAR (9) NOT NULL , 
     Personas_NIF CHAR (9) NOT NULL 
    )
GO

ALTER TABLE Telefono ADD CONSTRAINT Telefono_PK PRIMARY KEY CLUSTERED (Telefono, Personas_NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tipos_de_gaitas 
    (
     ID_Tipo_de_gaita CHAR (9) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     Imagen VARBINARY NOT NULL 
    )
GO

ALTER TABLE Tipos_de_gaitas ADD CONSTRAINT Tipos_de_gaitas_PK PRIMARY KEY CLUSTERED (ID_Tipo_de_gaita)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Trabajadores 
    (
     NIF CHAR (9) NOT NULL , 
     Fecha_de_contración DATE NOT NULL , 
     Alta BIT NOT NULL 
    )
GO

ALTER TABLE Trabajadores ADD CONSTRAINT Trabajadores_PK PRIMARY KEY CLUSTERED (NIF)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Alumno_curso 
    ADD CONSTRAINT Alumno_curso_Alumnos_FK FOREIGN KEY 
    ( 
     Alumnos_NIF
    ) 
    REFERENCES Alumnos 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Alumno_curso 
    ADD CONSTRAINT Alumno_curso_Curso_FK FOREIGN KEY 
    ( 
     Curso_ID_Curso
    ) 
    REFERENCES Curso 
    ( 
     ID_Curso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Alumnos 
    ADD CONSTRAINT Alumnos_Personas_FK FOREIGN KEY 
    ( 
     NIF
    ) 
    REFERENCES Personas 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Conserje 
    ADD CONSTRAINT Conserje_Trabajadores_FK FOREIGN KEY 
    ( 
     NIF
    ) 
    REFERENCES Trabajadores 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Curso 
    ADD CONSTRAINT Curso_Aula_FK FOREIGN KEY 
    ( 
     Aula_ID_Aula
    ) 
    REFERENCES Aula 
    ( 
     ID_Aula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Curso_Estilo 
    ADD CONSTRAINT Curso_Estilo_Curso_FK FOREIGN KEY 
    ( 
     Curso_ID_Curso
    ) 
    REFERENCES Curso 
    ( 
     ID_Curso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Curso_Estilo 
    ADD CONSTRAINT Curso_Estilo_Estilo_de_música_FK FOREIGN KEY 
    ( 
     Estilo_de_música_ID_estilo
    ) 
    REFERENCES Estilo_de_música 
    ( 
     ID_estilo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Efectivo 
    ADD CONSTRAINT Efectivo_Pagos_FK FOREIGN KEY 
    ( 
     ID_Pago, 
     ID_Alumno
    ) 
    REFERENCES Pagos 
    ( 
     ID_Pago , 
     Alumnos_ID_Alumno 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Email 
    ADD CONSTRAINT Email_Personas_FK FOREIGN KEY 
    ( 
     Personas_NIF
    ) 
    REFERENCES Personas 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Instrumentos 
    ADD CONSTRAINT Instrumentos_Aula_FK FOREIGN KEY 
    ( 
     Aula_ID_Aula
    ) 
    REFERENCES Aula 
    ( 
     ID_Aula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Instrumentos 
    ADD CONSTRAINT Instrumentos_Tipos_de_gaitas_FK FOREIGN KEY 
    ( 
     Tipos_de_gaitas_ID_Tipo_de_gaita
    ) 
    REFERENCES Tipos_de_gaitas 
    ( 
     ID_Tipo_de_gaita 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Localización 
    ADD CONSTRAINT Localización_Municipio_FK FOREIGN KEY 
    ( 
     Municipio_ID_Municipio
    ) 
    REFERENCES Municipio 
    ( 
     ID_Municipio 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pagos 
    ADD CONSTRAINT Pagos_Alumnos_FK FOREIGN KEY 
    ( 
     Alumnos_ID_Alumno
    ) 
    REFERENCES Alumnos 
    ( 
     ID_Alumno 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Personas 
    ADD CONSTRAINT Personas_Localización_FK FOREIGN KEY 
    ( 
     Localización_ID_Localización
    ) 
    REFERENCES Localización 
    ( 
     ID_Localización 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Profesor_Curso 
    ADD CONSTRAINT Profesor_Curso_Curso_FK FOREIGN KEY 
    ( 
     Curso_ID_Curso
    ) 
    REFERENCES Curso 
    ( 
     ID_Curso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Profesor_Curso 
    ADD CONSTRAINT Profesor_Curso_Profesores_FK FOREIGN KEY 
    ( 
     Profesores_NIF
    ) 
    REFERENCES Profesores 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Profesor_Especialidad 
    ADD CONSTRAINT Profesor_Especialidad_Especialidades_FK FOREIGN KEY 
    ( 
     Especialidades_ID_Especialidad
    ) 
    REFERENCES Especialidades 
    ( 
     ID_Especialidad 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Profesor_Especialidad 
    ADD CONSTRAINT Profesor_Especialidad_Profesores_FK FOREIGN KEY 
    ( 
     Profesores_NIF
    ) 
    REFERENCES Profesores 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Profesores 
    ADD CONSTRAINT Profesores_Trabajadores_FK FOREIGN KEY 
    ( 
     NIF
    ) 
    REFERENCES Trabajadores 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Salario 
    ADD CONSTRAINT Salario_Trabajadores_FK FOREIGN KEY 
    ( 
     Trabajadores_NIF
    ) 
    REFERENCES Trabajadores 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Tarjeta 
    ADD CONSTRAINT Tarjeta_Pagos_FK FOREIGN KEY 
    ( 
     ID_Pago, 
     ID_Alumno
    ) 
    REFERENCES Pagos 
    ( 
     ID_Pago , 
     Alumnos_ID_Alumno 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Telefono 
    ADD CONSTRAINT Telefono_Personas_FK FOREIGN KEY 
    ( 
     Personas_NIF
    ) 
    REFERENCES Personas 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Trabajadores 
    ADD CONSTRAINT Trabajadores_Personas_FK FOREIGN KEY 
    ( 
     NIF
    ) 
    REFERENCES Personas 
    ( 
     NIF 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            23
-- CREATE INDEX                             0
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
