$Conn = 
    "Data Source=192.168.1.201;"+
    "User id=sa;"+
    "Password=abc123.."
$query = 'CREATE DATABASE Gaitas_Power;'
Invoke-Sqlcmd -ConnectionString $Conn -Query $query
#CREAR TABLA
$Conn = 
    "Data Source=192.168.1.201;"+
    "Database=Gaitas_Power;"+
    "User id=sa;"+
    "Password=abc123.."
$query = 'CREATE TABLE Alumnos(
    ID_Alumno VARCHAR(50) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
)'
Invoke-Sqlcmd -ConnectionString $Conn -Query $query
#INSERT DATOS
$Conn = 
    "Data Source=192.168.1.201;"+
    "Database=Gaitas_Power;"+
    "User id=sa;"+
    "Password=abc123.."
$query=''
$Nombre=@('Pedro','Peter','Pablo','ElNano','Magic')
$ape=@('Rodriguez','Lista','Otros','Un capo')
for($x=0;$x -lt 15;$x++){
    $dni=Get-Random -Minimum 100000 -Maximum 999999
    $go_dni=$dni.ToString()+'A'
    $nombres=$Nombre | Get-Random
    $apel=$ape | Get-Random
    $query=$query+"INSERT INTO Alumnos VALUES('$go_dni','$nombres','$apel');"
}
Invoke-Sqlcmd -ConnectionString $Conn -Query $query