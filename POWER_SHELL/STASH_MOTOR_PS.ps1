Function Menu{
    Clear-Host
    Write-Host "MENÚ PRINCIPAL DE ANDRES PRIETO - STASH MOTOR"
    Write-host "0- Volver al inicio"
    Write-host "1- PROCESOS Y SERVICIOS SQL"
    Write-Host "2- DIRECTORIO SQL"
    Write-Host "3- SQL ACTIONS"
}

##MENU PROCESOS
function procesos{
    clear
    Write-Host "GESTIÓN DE PROCESOS Y SERVICIOS SQL"
    Write-host "0- VOLVER AL INICIO"
    Write-host "1- LISTAR PROCESOS SQL"
    Write-Host "2- LISTAR SERVICIOS SQL"
    Write-Host "3- DETENER SERVICIOS SQL"
    Write-host "4- ENCENDER SERVICIOS SQL"

    [string]$opcion = Read-Host "Elija una opción"
    switch ($opcion){
       '0'{menu}
       '1'{listaprocesos;break}
       '2'{listaservicios;break}
       '3'{detenerservicios;break}
       '4'{iniciarservicios;break}
       Default {Write-Host "Opción incorrecta"}
    }
 
}

##PROCESOS Y SERVICIOS
function listaprocesos{
Get-Process -Name sqlservr
}
function listaservicios{
$servicios = Get-Service -DisplayName "*SQL Server*"
$servicios | ForEach-Object { Write-Host "$($_.DisplayName): $($_.Status)" }

$guardartxt = Read-Host "¿QUIERES GUARDAR LOS PROCESOS EN UN FICHERO? (si/no)"
    if ($guardartxt.ToLower() -eq "si") { ##Le otorgamos al usuario la posibilidad de escoger si desea crear un fichero txt
        $fileName = Read-Host "Ingrese el nombre del archivo de texto:" ##Asigname a FileName el nombre que decida el usuario por teclado
        $servicios | Export-csv -Path "C:\$filename.txt" ##Indicamos la variable dentro de la ruta para que coja el nombre que asigna el usuario
        Write-Host "LA LISTA DE PROCESOS HA SIDO GUARDADA CON EL NOMBRE DE:  $fileName"
    } else {
        Write-Host "OPERACION CANCELADA."
    }
}
function DetenerServicios {
    $servicios = Get-Service -DisplayName "*SQL Server*"
    $servicios | ForEach-Object { Write-Host "$($_.DisplayName): $($_.Status)" }

    $detenerServicio = Read-Host "¿Está seguro que desea detener los servicios de SQL Server? Esto podría generar errores (si/no)"
    if ($detenerServicio.ToLower() -eq "si") {
        $servicios | Where-Object {$_.Status -eq "Running"} | Stop-Service -Force
        Write-Host "Servicios detenidos exitosamente."
    }
    else {
        Write-Host "Operación cancelada."
    }
}
function iniciarservicios {
    $servicios = Get-Service -DisplayName "*SQL Server*"
    $servicios | Where-Object {$_.Status -eq "Stopped"} | Start-Service 
    Write-Host "Servicios encendidos exitosamente."
    $servicios | ForEach-Object { Write-Host "$($_.DisplayName): $($_.Status)" }
 } 

##DIRECTORIO SQL

function directoriosql{
    clear
    Write-Host "DIRECTORIO SQL SERVER"
    Write-host "0- VOLVER AL INICIO"
    Write-host "1- DIRECTORIO DE BACKUP"
    Write-Host "2- DIRECTORIO DATA"
    Write-Host "3- DIRECTORIO SCRIPTS"

    [string]$opcion = Read-Host "Elija una opción"
    switch ($opcion){
       '0'{menu}
       '1'{directoriobackup;break}
       '2'{directoriodata;break}
       '3'{directorioscripts;break}
       Default {Write-Host "Opción incorrecta"}
    }
 
}
function directoriobackup {
    $rutaCarpeta = "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup" 
    Invoke-Item $rutaCarpeta
}
function directoriodata {
    $rutaCarpeta = "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA" 
    Invoke-Item $rutaCarpeta
}
function directorioscripts{
    $rutaCarpeta = "C:\Users\AndresPrieto\Documents\SQL Server Management Studio" 
    Invoke-Item $rutaCarpeta
}

##SQL ACTIONS
function sqlactions{
    clear
    Write-Host "SQL ACTIONS"
    Write-host "0- VOLVER AL INICIO"
    Write-host "1- EJECUTAR SQL SERVER"
    Write-Host "2- EJECUTAR SQL SERVER CONFIGURATION MANAGER"
    Write-Host "3- ODBC 64 Bits"
    Write-Host "4- EJECUTAR DATAMODELER"


    [string]$opcion = Read-Host "Elija una opción"
    switch ($opcion){
       '0'{menu}
       '1'{sqlserver;break}
       '2'{configmanager;break}
       '3'{odbc64;break}
       '4'{datamodeler;break}
       Default {Write-Host "Opción incorrecta"}
    }
 
}
function sqlserver {
Invoke-Item "C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\Ssms.exe"
}
function configmanager {
Invoke-Item "C:\Windows\SysWOW64\SQLServerManager16.msc"
}
function odbc64 {
Invoke-Item "C:\Windows\system32\odbcad32.exe"
}
function datamodeler{
Invoke-Item "C:\Users\AndresPrieto\Desktop\datamodeler\datamodeler.exe"
}












##--------------------------------------------------------------------------##
#Inicio
$t= $true
do{
    Menu
    [string]$opcion = Read-Host "Elija una opción"
    switch ($opcion){
       '0'{Write-Host "Ya estás en el inicio"}
       '1'{procesos;break}
       '2'{directoriosql;break}
       '3'{sqlactions;break}
       '4'{$t = $false;break}
       Default {Write-Host "Opción incorrecta"}
    }
    $intro = Read-Host "Pulse intro para continuar"
}while ($t)