--AUDITORIAS--

--A NIVEL DE SERVIDOR--

--LOG--

USE MASTER
GO

--CREAMOS LA AUDITORIA--

-- APPLICATION LOG--

CREATE SERVER AUDIT [STASH_AUDIT]
	TO	application_log
WITH
	( QUEUE_DELAY = 1000,
	ON_FAILURE = FAIL_OPERATION
)
GO

--HABILITAMOS LA AUDITORIA--

ALTER SERVER AUDIT STASH_AUDIT WITH (STATE = ON) 
GO

--VER RESULTADO EN EL GUI SECURITY --> AUDIT

--SECURITY LOG--

USE master
GO

--SCRIPT GENERADO DESDE EL ENTORNO GRAFICO--

CREATE SERVER AUDIT [STASH_SECURITY_LOG]
TO SECURITY_LOG WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE)
GO

--AL ENCENDER DICHA POLITICA GENERA UN ERROR SOBRE LA CARPETA DONDE SE GUARDAN LOS LOGS--

-------------------------------------------------------------------------------------------------------

--FILE LOG--

CREATE SERVER AUDIT [STASH_MOTOR_AUDIT]
TO FILE
	(FILEPATH = 'C:\Auditoria',
	maxsize = 0 mb,
	max_rollover_files = 2147483647,
	reserve_disk_space = off
)
with
(QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE)
GO

--HABILITAMOS LA AUDITORIA--

--GENERAMOS UN BACKUP PARA PROBAR LA AUDITORIA-- --HACER DBCC--

BACKUP DATABASE STASHMOTOR
	TO DISK = 'C:\Auditoria\STASHMOTOR.bak'
	with init;
go

--CONTROLAMOS LAS OPERACIONES O BIEN DESDE EL ENTORNO GRAFICO O DESDE TRANSACT--

SELECT event_time, action_id,class_type, server_instance_name, 
server_principal_name , [database_name], [statement] , database_principal_name 
FROM sys.fn_get_audit_file ('C:\Auditoria\* ', default,default)
GO

SELECT * FROM sys.fn_get_audit_file ('C:\Auditoria\* ', default,default)


--------------------------------------------------------------------------------------------

--AUDITORIA SOBRE BASES DE DATOS--

CREATE DATABASE STASH_AUDIT
GO

USE STASH_AUDIT
GO

CREATE TABLE CLIENTE (
	ID_Cliente int IDENTITY (1,1),
	Nombre VARCHAR(20),
	Apellido VARCHAR (20)
)
GO

INSERT INTO CLIENTE VALUES (
	'Sairelys','Verde'
);
GO

SELECT * FROM CLIENTE
GO

PRINT USER

--CREAMOS UN USUARIO SIN LOGIN --

CREATE USER ADMIN WITHOUT LOGIN
GO

--CONCEDEMOS PERMISOS DE LOGIN--

GRANT SELECT ON CLIENTE TO ADMIN
GO

EXECUTE AS USER = 'ADMIN'
GO

REVERT

--UPDATE SOBRE LA TABLA CON DBO--

UPDATE CLIENTE
SET Apellido = 'Verde'
WHERE ID_Cliente = 1;



















