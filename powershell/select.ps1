$Conn = 
    "Data Source=192.168.1.201;"+
    "Database=Gaitas_Power;"+
    "User id=sa;"+
    "Password=abc123.."
$query='SELECT * FROM Alumnos2;'
$DBNameList = (Invoke-Sqlcmd -ConnectionString $Conn -Query $query)
Write-Host 'ID_alumno; Nombre; Apellido'
foreach ($h in $DBNameList.GetEnumerator()){
    Write-Host "$($h.ID_Alumno); $($h.Nombre); $($h.Apellido)"
}