-- HABILITAR FILESTREAM --
--REINICIAR SERVICIO--

USE STASHMOTOR
GO

EXEC sp_configure filestream_access_level,2
RECONFIGURE
GO

ALTER DATABASE STASHMOTOR
	ADD FILEGROUP [PRIMARY_FILESTREAM]
	CONTAINS FILESTREAM
GO

--AÑADIR LA CARPETA AL FILEGROUP--
ALTER DATABASE STASHMOTOR
	ADD FILE (
		NAME= 'STASHMOTOR_FILESTREAM',
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FILESTREAM' )
		TO FILEGROUP [PRIMARY_FILESTREAM]
GO

--AÑADIMOS DOS NUEVOS CAMPOS EN LA TABLA ARTICULO PARA REALIZAR LA DEMOSTRACION--

ALTER TABLE Articulo
	ADD ArticuloID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE
GO

ALTER TABLE Articulo	
	ADD Imagen VARBINARY(MAX) FILESTREAM
GO


SELECT [SKU],[Nombre],[Descripcion],[PVP],[Imagen] FROM Articulo
GO

--INSERTAMOS LOS CAMPOS E IMAGENES--

INSERT INTO Articulo (SKU, Nombre, Descripcion, PVP, Inventario_ID_Inventario, Detalle_Venta_ID_DV, Detalle_Compra_ID_DC, Modelo_ID_Modelo, ArticuloID, Imagen)
VALUES ( 'SKU1', 'Llave de Gasolina', 'Regula la salida de gasolina', 35.00, 1, 1, 1, 1, NEWID(),
	(SELECT * FROM OPENROWSET (BULK 'C:\ImagenArticulos\SKU1.PNG', SINGLE_BLOB) AS f ));
GO

INSERT INTO Articulo (ArticuloID, SKU, Nombre, Descripcion, PVP, Imagen, Inventario_ID_Inventario, Detalle_Venta_ID_DV, Detalle_Compra_ID_DC, Modelo_ID_Modelo)
VALUES (NEWID(), 'SKU2', 'Filtro de Aire', 'Regula la entrada de aire', 25.00,
	(SELECT * FROM OPENROWSET (BULK 'C:\ImagenArticulos\SKU2.PNG', SINGLE_BLOB) AS f), 1, 1, 1, 1);
GO

INSERT INTO Articulo (ArticuloID, SKU, Nombre, Descripcion, PVP, Imagen, Inventario_ID_Inventario, Detalle_Venta_ID_DV, Detalle_Compra_ID_DC, Modelo_ID_Modelo)
VALUES (NEWID(), 'SKU3', 'Kit Carburador', 'Kit', 38.00,
	(SELECT * FROM OPENROWSET (BULK 'C:\ImagenArticulos\SKU3.PNG', SINGLE_BLOB) AS f), 1, 1, 1, 1);
GO

--MODIFICACION PARA GIT--
















	





