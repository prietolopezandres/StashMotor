--TABLAS TEMPORALES / VERSION DEL SISTEMA--

--CREACION BASE DE DATOS--

DROP DATABASE IF EXISTS STASHMOTOR_TABLATEMPORTAL_VS
GO

CREATE DATABASE STASHMOTOR_TABLATEMPORAL_VS
	ON PRIMARY ( NAME = 'STASHMOTOR_TEMPORAL_VS', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEMPORAL_VS\STASHMOTOR_TEMPORAL.MDF' , 
	SIZE = 15360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0) 
	LOG ON ( NAME = 'STASHMOTOR_TEMPORAL_LOG', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEMPORAL_VS\STASHMOTOR_TEMPORAL.LDF' , 
	SIZE = 10176KB , MAXSIZE = 2048GB , FILEGROWTH = 10%) 
GO

USE STASHMOTOR_TABLATEMPORAL_VS
GO

--CREACIÓN TABLA TEMPORA INVENTARIO--

CREATE TABLE Inventario
    (
    ID_Inventario INTEGER IDENTITY(1,1) NOT NULL Primary Key Clustered,
    Conteo_fecha_de_inicio DATE , 
    Conteo_fecha_de_cierre DATE , 
    TOTAL_INVENTARIO INTEGER , 
		SysStartTime datetime2 generated always as row start not null,  
		SysEndTime datetime2 generated always as row end not null,  
			period for System_time (SysStartTime,SysEndTime) ) 
			with (System_Versioning = ON (History_Table = dbo.inventario_historico))
GO	

--INSERCION DE DATOS--

INSERT INTO Inventario (Conteo_fecha_de_inicio,Conteo_fecha_de_cierre,TOTAL_INVENTARIO) 
VALUES	('2023-1-01','2023-1-30',25), 
		('2023-2-01','2023-2-28',46),
		('2023-3-01','2023-3-30',18),
		('2023-4-01','2023-4-30',52)
GO

SELECT * FROM Inventario
GO


--VERIFICAMOS LA TABLA DE HISTORICO--

SELECT * FROM Inventario_historico
GO

--ACTUALIZAMOS LOS DATOS DEL INVENTARIO CORRESPONDIENTE AL MES DE ABRIL--

update Inventario
	set TOTAL_INVENTARIO = 60
	where ID_Inventario = 8
GO

--CONSULTAMOS LA TABLA DE HISTORICO PARA OBSERVAR MAS DETALLADAMENTE LOS CAMBIOS--

SELECT * FROM Inventario_historico
GO

--ACTUALIZAMOS NUEVAMENTE EL INVENTARIO--

update Inventario
	set TOTAL_INVENTARIO = 44
	where ID_Inventario = 8
GO

--CONSULTAMOS NUEVAMENTE LA TABLA DE HISTORICO PARA OBSERVAR MAS DETALLADAMENTE LOS CAMBIOS--

SELECT * FROM Inventario_historico
GO

--BORRADO DE REGISTRO--
-- VAMOS A SIMULAR EL BORRADO POR ERROR DEL INVENTARIO CORRESPONDIENTE AL MES DE ENERO--

delete from Inventario
	where ID_Inventario = 5
GO

--CONSULTAMOS LA TABLA--

SELECT * FROM Inventario
GO

--CONSULTAMOS LA TABLA HISTORICO--

SELECT * FROM Inventario_historico
GO

--INSERTAMOS EL INVENTARIO CORRESPONDIENTE AL MES DE MAYO--

INSERT INTO Inventario (Conteo_fecha_de_inicio,Conteo_fecha_de_cierre,TOTAL_INVENTARIO) 
VALUES	('2023-5-01','2023-5-30',78) 
GO

--CONSULTAMOS LA TABLA DE INVENTARIO--

SELECT * FROM Inventario
GO

--AL CONSULTAR LA TABLA DE HISTORICO, NO OBSERVAREMOS NINGUN CAMBIO MAS ALLA DE LA NUEVA INSERCION--
--YA QUE AUN NO SE HA REALIZADO NINGUNA MODIFICACION--

SELECT * FROM Inventario_historico
GO

--CONSULTAS SOBRE LOS CAMBIOS DE LA TABLA INVENTARIO--

-- Para analizar los datos de las tablas actual e historica usamos la clausula FOR SYSTEM_TIME y las subclausulas:

--AS OF <date_time>

--FROM <start_date_time> TO <end_date_time>

--BETWEEN <start_date_time> AND <end_date_time>

--CONTAINED IN (<start_date_time> , <end_date_time>)

--ALL


--UTILIZANDO "FOR SYSTEM_TIME ALL" OBSERVAMOS--
--TODOS LAS OPERACIONES SOBRE LA TABLA--

SELECT * 
FROM Inventario
FOR SYSTEM_TIME ALL
GO

--CONSULTAR LA TABLA INVENTARIO EN UN TIEMPO DETERMINADO--

SELECT * 
FROM Inventario
FOR SYSTEM_TIME AS OF '2023-03-06 11:37:38.8451513' 
GO


--SI QUISIERAMOS CONSULTAR EL INVENTARIO EN UN RANGO DE FECHA DETERMINADO--

SELECT * 
FROM Inventario
FOR SYSTEM_TIME FROM '2023-03-06 11:51:38.0052885' TO '2023-03-06 12:13:31.6927779' 
GO

--CONSULTARLO EN UN RAGO DE HORAS DETERMINARDO--

SELECT * 
FROM Inventario
FOR SYSTEM_TIME CONTAINED IN ('2023-03-06 11:37:38.8451513','2023-03-06 12:01:18.7396093')
GO





























