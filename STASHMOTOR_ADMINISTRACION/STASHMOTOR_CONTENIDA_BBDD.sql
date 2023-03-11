
-- Inicialmente nos aseguramos de estar en master--

USE MASTER
GO

-- Primero activamos las opciones avanzas--

EXEC sp_configure 'show advanced options', 1
GO

--Actualizamos el valor--

RECONFIGURE
GO

--Activamos la caracteristica--

EXEC sp_configure 'contained database authentication' , 1
GO

--Ya hemos preparado el entorno para las siguientes ejecuciones--

--Activamos la base de datos y configuramos la misma como contenida--

CREATE DATABASE STASHMOTOR_CONTENIDA
GO

ALTER DATABASE STASHMOTOR_CONTENIDA
SET RESTRICTED_USER
WITH ROLLBACK IMMEDIATE;
GO

ALTER DATABASE STASHMOTOR_CONTENIDA
SET containment=partial;
GO

ALTER DATABASE STASHMOTOR_CONTENIDA
SET MULTI_USER;
GO

USE STASHMOTOR_CONTENIDA
GO

--Creamos el usuario Prieto dentro de la base de datos--

DROP USER IF EXISTS Prieto
GO

CREATE USER Prieto 
	WITH PASSWORD= '1234.',
	DEFAULT_SCHEMA=[dbo]
GO

--Añadimos el usuario que acabos de crear al rol owner--

ALTER ROLE db_owner
	ADD MEMBER Prieto
GO

--Otorgamos permisos de "grant" al usuario para que pueda conectares a la base de datos--

GRANT CONNECT TO Prieto
GO

--Una vez conectados procedemos a realizar la creacion de una tabla--

CREATE TABLE [dbo].[ArticulosContenida](
	[SKU] VARCHAR (10) NULL,
	[Nombre] VARCHAR (20) NULL,
	[Descripcion] VARCHAR (50)
) ON [PRIMARY]
GO






--






