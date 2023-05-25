-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema EscuelaGaitas_prl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EscuelaGaitas_prl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EscuelaGaitas_prl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `EscuelaGaitas_prl` ;

-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Municipio` (
  `ID_Municipio` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Municipio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Localización`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Localización` (
  `ID_Localización` CHAR(9) NOT NULL,
  `Municipio_ID_Municipio` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Codigo_Postal` CHAR(5) NOT NULL,
  PRIMARY KEY (`ID_Localización`),
  INDEX `Localización_Municipio_FK` (`Municipio_ID_Municipio` ASC) VISIBLE,
  CONSTRAINT `Localización_Municipio_FK`
    FOREIGN KEY (`Municipio_ID_Municipio`)
    REFERENCES `EscuelaGaitas_prl`.`Municipio` (`ID_Municipio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Personas` (
  `NIF` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Localización_ID_Localización` CHAR(9) NOT NULL,
  `Fecha_de_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `Personas_Localización_FK` (`Localización_ID_Localización` ASC) VISIBLE,
  CONSTRAINT `Personas_Localización_FK`
    FOREIGN KEY (`Localización_ID_Localización`)
    REFERENCES `EscuelaGaitas_prl`.`Localización` (`ID_Localización`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Alumnos` (
  `NIF` CHAR(9) NOT NULL,
  `ID_Alumno` CHAR(9) NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `Alumnos_PKv1` (`ID_Alumno` ASC) VISIBLE,
  CONSTRAINT `Alumnos_Personas_FK`
    FOREIGN KEY (`NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Personas` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Aula` (
  `ID_Aula` CHAR(9) NOT NULL,
  PRIMARY KEY (`ID_Aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Curso` (
  `ID_Curso` CHAR(9) NOT NULL,
  `Aula_ID_Aula` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Final` DATE NULL DEFAULT NULL,
  `Descrición` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Curso`),
  INDEX `Curso_Aula_FK` (`Aula_ID_Aula` ASC) VISIBLE,
  CONSTRAINT `Curso_Aula_FK`
    FOREIGN KEY (`Aula_ID_Aula`)
    REFERENCES `EscuelaGaitas_prl`.`Aula` (`ID_Aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Alumno_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Alumno_curso` (
  `Alumnos_NIF` CHAR(9) NOT NULL,
  `Curso_ID_Curso` CHAR(9) NOT NULL,
  PRIMARY KEY (`Alumnos_NIF`, `Curso_ID_Curso`),
  INDEX `Alumno_curso_Curso_FK` (`Curso_ID_Curso` ASC) VISIBLE,
  CONSTRAINT `Alumno_curso_Alumnos_FK`
    FOREIGN KEY (`Alumnos_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Alumnos` (`NIF`),
  CONSTRAINT `Alumno_curso_Curso_FK`
    FOREIGN KEY (`Curso_ID_Curso`)
    REFERENCES `EscuelaGaitas_prl`.`Curso` (`ID_Curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Trabajadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Trabajadores` (
  `NIF` CHAR(9) NOT NULL,
  `Fecha_de_contración` DATE NOT NULL,
  `Alta` TINYINT(1) NOT NULL,
  PRIMARY KEY (`NIF`),
  CONSTRAINT `Trabajadores_Personas_FK`
    FOREIGN KEY (`NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Personas` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Conserje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Conserje` (
  `NIF` CHAR(9) NOT NULL,
  `ID_Conserje` CHAR(9) NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `Conserje_PKv1` (`ID_Conserje` ASC) VISIBLE,
  CONSTRAINT `Conserje_Trabajadores_FK`
    FOREIGN KEY (`NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Trabajadores` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Estilo_de_música`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Estilo_de_música` (
  `ID_estilo` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_estilo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Curso_Estilo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Curso_Estilo` (
  `Estilo_de_música_ID_estilo` CHAR(9) NOT NULL,
  `Curso_ID_Curso` CHAR(9) NOT NULL,
  PRIMARY KEY (`Estilo_de_música_ID_estilo`, `Curso_ID_Curso`),
  INDEX `Curso_Estilo_Curso_FK` (`Curso_ID_Curso` ASC) VISIBLE,
  CONSTRAINT `Curso_Estilo_Curso_FK`
    FOREIGN KEY (`Curso_ID_Curso`)
    REFERENCES `EscuelaGaitas_prl`.`Curso` (`ID_Curso`),
  CONSTRAINT `Curso_Estilo_Estilo_de_música_FK`
    FOREIGN KEY (`Estilo_de_música_ID_estilo`)
    REFERENCES `EscuelaGaitas_prl`.`Estilo_de_música` (`ID_estilo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Pagos` (
  `ID_Pago` CHAR(9) NOT NULL,
  `Alumnos_ID_Alumno` CHAR(9) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Precio` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`ID_Pago`, `Alumnos_ID_Alumno`),
  INDEX `Pagos_Alumnos_FK` (`Alumnos_ID_Alumno` ASC) VISIBLE,
  CONSTRAINT `Pagos_Alumnos_FK`
    FOREIGN KEY (`Alumnos_ID_Alumno`)
    REFERENCES `EscuelaGaitas_prl`.`Alumnos` (`ID_Alumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Efectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Efectivo` (
  `ID_Pago` CHAR(9) NOT NULL,
  `ID_Alumno` CHAR(9) NOT NULL,
  PRIMARY KEY (`ID_Pago`, `ID_Alumno`),
  CONSTRAINT `Efectivo_Pagos_FK`
    FOREIGN KEY (`ID_Pago` , `ID_Alumno`)
    REFERENCES `EscuelaGaitas_prl`.`Pagos` (`ID_Pago` , `Alumnos_ID_Alumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Email` (
  `Emails` VARCHAR(200) NOT NULL,
  `Personas_NIF` CHAR(9) NOT NULL,
  PRIMARY KEY (`Emails`, `Personas_NIF`),
  INDEX `Email_Personas_FK` (`Personas_NIF` ASC) VISIBLE,
  CONSTRAINT `Email_Personas_FK`
    FOREIGN KEY (`Personas_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Personas` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Especialidades` (
  `ID_Especialidad` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripción` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Tipos_de_gaitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Tipos_de_gaitas` (
  `ID_Tipo_de_gaita` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Imagen` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo_de_gaita`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Instrumentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Instrumentos` (
  `ID_Instrumento` CHAR(9) NOT NULL,
  `Aula_ID_Aula` CHAR(9) NOT NULL,
  `Tipos_de_gaitas_ID_Tipo_de_gaita` CHAR(9) NOT NULL,
  PRIMARY KEY (`ID_Instrumento`),
  INDEX `Instrumentos_Aula_FK` (`Aula_ID_Aula` ASC) VISIBLE,
  INDEX `Instrumentos_Tipos_de_gaitas_FK` (`Tipos_de_gaitas_ID_Tipo_de_gaita` ASC) VISIBLE,
  CONSTRAINT `Instrumentos_Aula_FK`
    FOREIGN KEY (`Aula_ID_Aula`)
    REFERENCES `EscuelaGaitas_prl`.`Aula` (`ID_Aula`),
  CONSTRAINT `Instrumentos_Tipos_de_gaitas_FK`
    FOREIGN KEY (`Tipos_de_gaitas_ID_Tipo_de_gaita`)
    REFERENCES `EscuelaGaitas_prl`.`Tipos_de_gaitas` (`ID_Tipo_de_gaita`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Profesores` (
  `NIF` CHAR(9) NOT NULL,
  `ID_Profesor` CHAR(9) NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `Profesores_PKv1` (`ID_Profesor` ASC) VISIBLE,
  CONSTRAINT `Profesores_Trabajadores_FK`
    FOREIGN KEY (`NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Trabajadores` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Profesor_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Profesor_Curso` (
  `Profesores_NIF` CHAR(9) NOT NULL,
  `Curso_ID_Curso` CHAR(9) NOT NULL,
  PRIMARY KEY (`Profesores_NIF`, `Curso_ID_Curso`),
  INDEX `Profesor_Curso_Curso_FK` (`Curso_ID_Curso` ASC) VISIBLE,
  CONSTRAINT `Profesor_Curso_Curso_FK`
    FOREIGN KEY (`Curso_ID_Curso`)
    REFERENCES `EscuelaGaitas_prl`.`Curso` (`ID_Curso`),
  CONSTRAINT `Profesor_Curso_Profesores_FK`
    FOREIGN KEY (`Profesores_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Profesores` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Profesor_Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Profesor_Especialidad` (
  `Especialidades_ID_Especialidad` CHAR(9) NOT NULL,
  `Profesores_NIF` CHAR(9) NOT NULL,
  PRIMARY KEY (`Especialidades_ID_Especialidad`, `Profesores_NIF`),
  INDEX `Profesor_Especialidad_Profesores_FK` (`Profesores_NIF` ASC) VISIBLE,
  CONSTRAINT `Profesor_Especialidad_Especialidades_FK`
    FOREIGN KEY (`Especialidades_ID_Especialidad`)
    REFERENCES `EscuelaGaitas_prl`.`Especialidades` (`ID_Especialidad`),
  CONSTRAINT `Profesor_Especialidad_Profesores_FK`
    FOREIGN KEY (`Profesores_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Profesores` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Salario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Salario` (
  `ID_Salario` CHAR(9) NOT NULL,
  `Trabajadores_NIF` CHAR(9) NOT NULL,
  `Importe` DECIMAL(19,4) NOT NULL,
  `Cuenta` VARBINARY(1) NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`ID_Salario`, `Trabajadores_NIF`),
  INDEX `Salario_Trabajadores_FK` (`Trabajadores_NIF` ASC) VISIBLE,
  CONSTRAINT `Salario_Trabajadores_FK`
    FOREIGN KEY (`Trabajadores_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Trabajadores` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Tarjeta` (
  `ID_Pago` CHAR(9) NOT NULL,
  `ID_Alumno` CHAR(9) NOT NULL,
  PRIMARY KEY (`ID_Pago`, `ID_Alumno`),
  CONSTRAINT `Tarjeta_Pagos_FK`
    FOREIGN KEY (`ID_Pago` , `ID_Alumno`)
    REFERENCES `EscuelaGaitas_prl`.`Pagos` (`ID_Pago` , `Alumnos_ID_Alumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`Telefono` (
  `Telefono` CHAR(9) NOT NULL,
  `Personas_NIF` CHAR(9) NOT NULL,
  PRIMARY KEY (`Telefono`, `Personas_NIF`),
  INDEX `Telefono_Personas_FK` (`Personas_NIF` ASC) VISIBLE,
  CONSTRAINT `Telefono_Personas_FK`
    FOREIGN KEY (`Personas_NIF`)
    REFERENCES `EscuelaGaitas_prl`.`Personas` (`NIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EscuelaGaitas_prl`.`sysdiagrams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscuelaGaitas_prl`.`sysdiagrams` (
  `name` VARCHAR(160) NOT NULL,
  `principal_id` INT NOT NULL,
  `diagram_id` INT NOT NULL,
  `version` INT NULL DEFAULT NULL,
  `definition` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE INDEX `UK_principal_name` (`principal_id` ASC, `name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
