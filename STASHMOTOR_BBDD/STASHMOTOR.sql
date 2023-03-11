﻿USE [master]
GO
/****** Object:  Database [STASHMOTOR]    Script Date: 11/03/2023 5:08:52 ******/
CREATE DATABASE [STASHMOTOR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STASHMOTOR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\STASHMOTOR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [PRIMARY_FILESTREAM] CONTAINS FILESTREAM  DEFAULT
( NAME = N'STASHMOTOR_FILESTREAM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FILESTREAM' , MAXSIZE = UNLIMITED)
 LOG ON 
( NAME = N'STASHMOTOR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\STASHMOTOR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [STASHMOTOR] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STASHMOTOR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STASHMOTOR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STASHMOTOR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STASHMOTOR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STASHMOTOR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STASHMOTOR] SET ARITHABORT OFF 
GO
ALTER DATABASE [STASHMOTOR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STASHMOTOR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STASHMOTOR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STASHMOTOR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STASHMOTOR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STASHMOTOR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STASHMOTOR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STASHMOTOR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STASHMOTOR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STASHMOTOR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STASHMOTOR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STASHMOTOR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STASHMOTOR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STASHMOTOR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STASHMOTOR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STASHMOTOR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STASHMOTOR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STASHMOTOR] SET RECOVERY FULL 
GO
ALTER DATABASE [STASHMOTOR] SET  MULTI_USER 
GO
ALTER DATABASE [STASHMOTOR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STASHMOTOR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STASHMOTOR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STASHMOTOR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [STASHMOTOR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [STASHMOTOR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'STASHMOTOR', N'ON'
GO
ALTER DATABASE [STASHMOTOR] SET QUERY_STORE = ON
GO
ALTER DATABASE [STASHMOTOR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [STASHMOTOR]
GO
/****** Object:  Table [dbo].[Alto]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alto](
	[ID_Comision] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [Alto_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Alto_PKv1] UNIQUE NONCLUSTERED 
(
	[Porcentaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[SKU] [varchar](20) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[PVP] [decimal](28, 0) NOT NULL,
	[Inventario_ID_Inventario] [int] NOT NULL,
	[Detalle_Venta_ID_DV] [int] NOT NULL,
	[Detalle_Compra_ID_DC] [int] NOT NULL,
	[Modelo_ID_Modelo] [int] NOT NULL,
	[ArticuloID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Imagen] [varbinary](max) FILESTREAM  NULL,
 CONSTRAINT [Articulo_PK] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY] FILESTREAM_ON [PRIMARY_FILESTREAM],
UNIQUE NONCLUSTERED 
(
	[ArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] FILESTREAM_ON [PRIMARY_FILESTREAM]
GO
/****** Object:  Table [dbo].[Bajo]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bajo](
	[ID_Comision] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [Bajov1_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Bajo_PK] UNIQUE NONCLUSTERED 
(
	[Porcentaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[ID_Cargo] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Descripcion_Cargo] [varchar](50) NULL,
 CONSTRAINT [Cargo_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritoWeb]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoWeb](
	[ID_Carrito_Web] [int] NULL,
	[Cliente_DNI] [int] NOT NULL,
	[Envio_ID_Envio] [int] NOT NULL,
	[CarritoWeb_ID] [numeric](28, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [CarritoWeb_PK] PRIMARY KEY CLUSTERED 
(
	[CarritoWeb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_Categoria] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [Categoria_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cilindrada]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cilindrada](
	[ID_Cilindrada] [int] NOT NULL,
	[Cilindrada] [varchar](10) NOT NULL,
	[Modelo_ID_Modelo] [int] NOT NULL,
 CONSTRAINT [Cilindrada_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Cilindrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NULL,
	[Telefono] [varchar](20) NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Pais_ISO] [varchar](50) NOT NULL,
 CONSTRAINT [Cliente_PK] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comisiones]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comisiones](
	[ID_Comision] [int] NOT NULL,
	[Comisiones_TYPE] [varchar](10) NOT NULL,
 CONSTRAINT [Comisiones_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[ID_Compra] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Proovedor_ID_Proovedor] [int] NOT NULL,
	[ID_Proovedor] [int] NOT NULL,
 CONSTRAINT [Compra_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[ID_Contrato] [int] NOT NULL,
	[Documento] [varbinary](1) NULL,
	[Empleado_ID_Empleado] [int] NOT NULL,
	[ID_Comision] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[ID_Departamento] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [Departamento_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Compra](
	[ID_DC] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Compra_ID_Compra] [int] NOT NULL,
 CONSTRAINT [Detalle_Compra_PK] PRIMARY KEY CLUSTERED 
(
	[ID_DC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[ID_DV] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Venta_ID_Venta] [int] NOT NULL,
 CONSTRAINT [Detalle_Venta_PK] PRIMARY KEY CLUSTERED 
(
	[ID_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Efectivo]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Efectivo](
	[ID_Modalidad_Pago] [int] NOT NULL,
	[ID_Efectivo] [int] NOT NULL,
	[Cantidad] [decimal](28, 0) NOT NULL,
 CONSTRAINT [Efectivo_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Modalidad_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Efectivo_PKv1] UNIQUE NONCLUSTERED 
(
	[ID_Efectivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID_Empleado] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Email] [varchar](30) NULL,
	[Telefono] [varchar](20) NULL,
	[Cargo_ID_Cargo] [int] NOT NULL,
	[Departamento_ID_Departamento] [int] NOT NULL,
	[Comisiones_ID_Comision] [int] NOT NULL,
	[Comisiones_ID_Comision1] [int] NOT NULL,
 CONSTRAINT [Empleado_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envio](
	[ID_Envio] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [Envio_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricante]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricante](
	[ID_Fabricante] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Logo] [image] NULL,
	[Categoria_ID_Categoria] [int] NOT NULL,
 CONSTRAINT [Fabricante_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Fabricante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Inventario] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [Inventario_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[ID_Localidad] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Pais_ISO] [varchar](50) NOT NULL,
 CONSTRAINT [Localidad_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medio]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medio](
	[ID_Comision] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [Medio_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Medio_PKv1] UNIQUE NONCLUSTERED 
(
	[Porcentaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mod_Pago]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_Pago](
	[ID_Mod] [int] NOT NULL,
	[Mod_Pago_TYPE] [varchar](8) NOT NULL,
 CONSTRAINT [Mod_Pago_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Mod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[ID_Modelo] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Fecha_Fabricacion] [date] NULL,
	[Fabricante_ID_Fabricante] [int] NOT NULL,
	[Categoria_ID_Categoria] [int] NOT NULL,
 CONSTRAINT [Modelo_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[ID_Municipio] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Localidad_ID_Localidad] [int] NOT NULL,
 CONSTRAINT [Municipio_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[ID_Pago] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Modalidad_Pago_ID_Mod] [int] NOT NULL,
	[CarritoWeb_CarritoWeb_ID] [numeric](28, 0) NOT NULL,
	[Mod_Pago_ID_Mod] [int] NOT NULL,
 CONSTRAINT [Pago_PK] PRIMARY KEY CLUSTERED 
(
	[Mod_Pago_ID_Mod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[ISO] [varchar](50) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [Pais_PK] PRIMARY KEY CLUSTERED 
(
	[ISO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paypal]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paypal](
	[ID_Modalidad_Pago] [int] NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
 CONSTRAINT [Paypal_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Modalidad_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Paypal_PKv1] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proovedor]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proovedor](
	[ID_Proovedor] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Web] [varchar](30) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[Pais_ISO] [varchar](50) NOT NULL,
 CONSTRAINT [Proovedor_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Proovedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[ID_Modalidad_Pago] [int] NOT NULL,
	[ID_Tarjeta] [int] NOT NULL,
	[Numero_Tarjeta] [int] NOT NULL,
	[CCV] [int] NOT NULL,
 CONSTRAINT [Tarjeta_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Modalidad_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Tarjeta_PKv1] UNIQUE NONCLUSTERED 
(
	[ID_Tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 11/03/2023 5:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID_Venta] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Cliente_DNI] [int] NOT NULL,
	[Total_Venta] [decimal](28, 0) NULL,
 CONSTRAINT [Venta_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CarritoWeb__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [CarritoWeb__IDX] ON [dbo].[CarritoWeb]
(
	[Envio_ID_Envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cilindrada__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Cilindrada__IDX] ON [dbo].[Cilindrada]
(
	[Modelo_ID_Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Contrato__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Contrato__IDX] ON [dbo].[Contrato]
(
	[Empleado_ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Detalle_Compra__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Detalle_Compra__IDX] ON [dbo].[Detalle_Compra]
(
	[Compra_ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Detalle_Venta__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Detalle_Venta__IDX] ON [dbo].[Detalle_Venta]
(
	[Venta_ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Empleado__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Empleado__IDX] ON [dbo].[Empleado]
(
	[Comisiones_ID_Comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Fabricante__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Fabricante__IDX] ON [dbo].[Fabricante]
(
	[Categoria_ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Pago__IDX]    Script Date: 11/03/2023 5:08:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Pago__IDX] ON [dbo].[Pago]
(
	[CarritoWeb_CarritoWeb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alto]  WITH CHECK ADD  CONSTRAINT [Alto_Comisiones_FK] FOREIGN KEY([ID_Comision])
REFERENCES [dbo].[Comisiones] ([ID_Comision])
GO
ALTER TABLE [dbo].[Alto] CHECK CONSTRAINT [Alto_Comisiones_FK]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Detalle_Compra_FK] FOREIGN KEY([Detalle_Compra_ID_DC])
REFERENCES [dbo].[Detalle_Compra] ([ID_DC])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Detalle_Compra_FK]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Detalle_Venta_FK] FOREIGN KEY([Detalle_Venta_ID_DV])
REFERENCES [dbo].[Detalle_Venta] ([ID_DV])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Detalle_Venta_FK]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Inventario_FK] FOREIGN KEY([Inventario_ID_Inventario])
REFERENCES [dbo].[Inventario] ([ID_Inventario])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Inventario_FK]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Modelo_FK] FOREIGN KEY([Modelo_ID_Modelo])
REFERENCES [dbo].[Modelo] ([ID_Modelo])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Modelo_FK]
GO
ALTER TABLE [dbo].[Bajo]  WITH CHECK ADD  CONSTRAINT [Bajov1_Comisiones_FK] FOREIGN KEY([ID_Comision])
REFERENCES [dbo].[Comisiones] ([ID_Comision])
GO
ALTER TABLE [dbo].[Bajo] CHECK CONSTRAINT [Bajov1_Comisiones_FK]
GO
ALTER TABLE [dbo].[CarritoWeb]  WITH CHECK ADD  CONSTRAINT [CarritoWeb_Cliente_FK] FOREIGN KEY([Cliente_DNI])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[CarritoWeb] CHECK CONSTRAINT [CarritoWeb_Cliente_FK]
GO
ALTER TABLE [dbo].[CarritoWeb]  WITH CHECK ADD  CONSTRAINT [CarritoWeb_Envio_FK] FOREIGN KEY([Envio_ID_Envio])
REFERENCES [dbo].[Envio] ([ID_Envio])
GO
ALTER TABLE [dbo].[CarritoWeb] CHECK CONSTRAINT [CarritoWeb_Envio_FK]
GO
ALTER TABLE [dbo].[Cilindrada]  WITH CHECK ADD  CONSTRAINT [Cilindrada_Modelo_FK] FOREIGN KEY([Modelo_ID_Modelo])
REFERENCES [dbo].[Modelo] ([ID_Modelo])
GO
ALTER TABLE [dbo].[Cilindrada] CHECK CONSTRAINT [Cilindrada_Modelo_FK]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_Pais_FK] FOREIGN KEY([Pais_ISO])
REFERENCES [dbo].[Pais] ([ISO])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_Pais_FK]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [Compra_Proovedor_FK] FOREIGN KEY([Proovedor_ID_Proovedor])
REFERENCES [dbo].[Proovedor] ([ID_Proovedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [Compra_Proovedor_FK]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [Contrato_Empleado_FK] FOREIGN KEY([Empleado_ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [Contrato_Empleado_FK]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [Detalle_Compra_Compra_FK] FOREIGN KEY([Compra_ID_Compra])
REFERENCES [dbo].[Compra] ([ID_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [Detalle_Compra_Compra_FK]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Detalle_Venta_Venta_FK] FOREIGN KEY([Venta_ID_Venta])
REFERENCES [dbo].[Venta] ([ID_Venta])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Detalle_Venta_Venta_FK]
GO
ALTER TABLE [dbo].[Efectivo]  WITH CHECK ADD  CONSTRAINT [Efectivo_Modalidad_Pago_FK] FOREIGN KEY([ID_Modalidad_Pago])
REFERENCES [dbo].[Mod_Pago] ([ID_Mod])
GO
ALTER TABLE [dbo].[Efectivo] CHECK CONSTRAINT [Efectivo_Modalidad_Pago_FK]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Empleado_Cargo_FK] FOREIGN KEY([Cargo_ID_Cargo])
REFERENCES [dbo].[Cargo] ([ID_Cargo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Empleado_Cargo_FK]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Empleado_Comisiones_FK] FOREIGN KEY([Comisiones_ID_Comision])
REFERENCES [dbo].[Comisiones] ([ID_Comision])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Empleado_Comisiones_FK]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Empleado_Comisiones_FKv1] FOREIGN KEY([Comisiones_ID_Comision1])
REFERENCES [dbo].[Comisiones] ([ID_Comision])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Empleado_Comisiones_FKv1]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Empleado_Departamento_FK] FOREIGN KEY([Departamento_ID_Departamento])
REFERENCES [dbo].[Departamento] ([ID_Departamento])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Empleado_Departamento_FK]
GO
ALTER TABLE [dbo].[Fabricante]  WITH CHECK ADD  CONSTRAINT [Fabricante_Categoria_FK] FOREIGN KEY([Categoria_ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Fabricante] CHECK CONSTRAINT [Fabricante_Categoria_FK]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [Localidad_Pais_FK] FOREIGN KEY([Pais_ISO])
REFERENCES [dbo].[Pais] ([ISO])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [Localidad_Pais_FK]
GO
ALTER TABLE [dbo].[Medio]  WITH CHECK ADD  CONSTRAINT [Medio_Comisiones_FK] FOREIGN KEY([ID_Comision])
REFERENCES [dbo].[Comisiones] ([ID_Comision])
GO
ALTER TABLE [dbo].[Medio] CHECK CONSTRAINT [Medio_Comisiones_FK]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [Modelo_Categoria_FK] FOREIGN KEY([Categoria_ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [Modelo_Categoria_FK]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [Modelo_Fabricante_FK] FOREIGN KEY([Fabricante_ID_Fabricante])
REFERENCES [dbo].[Fabricante] ([ID_Fabricante])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [Modelo_Fabricante_FK]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [Municipio_Localidad_FK] FOREIGN KEY([Localidad_ID_Localidad])
REFERENCES [dbo].[Localidad] ([ID_Localidad])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [Municipio_Localidad_FK]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_CarritoWeb_FK] FOREIGN KEY([CarritoWeb_CarritoWeb_ID])
REFERENCES [dbo].[CarritoWeb] ([CarritoWeb_ID])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_CarritoWeb_FK]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_Mod_Pago_FK] FOREIGN KEY([Mod_Pago_ID_Mod])
REFERENCES [dbo].[Mod_Pago] ([ID_Mod])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_Mod_Pago_FK]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_Modalidad_Pago_FK] FOREIGN KEY([Modalidad_Pago_ID_Mod])
REFERENCES [dbo].[Mod_Pago] ([ID_Mod])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_Modalidad_Pago_FK]
GO
ALTER TABLE [dbo].[Paypal]  WITH CHECK ADD  CONSTRAINT [Paypal_Modalidad_Pago_FK] FOREIGN KEY([ID_Modalidad_Pago])
REFERENCES [dbo].[Mod_Pago] ([ID_Mod])
GO
ALTER TABLE [dbo].[Paypal] CHECK CONSTRAINT [Paypal_Modalidad_Pago_FK]
GO
ALTER TABLE [dbo].[Proovedor]  WITH CHECK ADD  CONSTRAINT [Proovedor_Pais_FK] FOREIGN KEY([Pais_ISO])
REFERENCES [dbo].[Pais] ([ISO])
GO
ALTER TABLE [dbo].[Proovedor] CHECK CONSTRAINT [Proovedor_Pais_FK]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [Tarjeta_Modalidad_Pago_FK] FOREIGN KEY([ID_Modalidad_Pago])
REFERENCES [dbo].[Mod_Pago] ([ID_Mod])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [Tarjeta_Modalidad_Pago_FK]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [Venta_Cliente_FK] FOREIGN KEY([Cliente_DNI])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [Venta_Cliente_FK]
GO
ALTER TABLE [dbo].[Comisiones]  WITH CHECK ADD  CONSTRAINT [CH_INH_Comisiones] CHECK  (([Comisiones_TYPE]='Medio' OR [Comisiones_TYPE]='Comisiones' OR [Comisiones_TYPE]='Bajo' OR [Comisiones_TYPE]='Alto'))
GO
ALTER TABLE [dbo].[Comisiones] CHECK CONSTRAINT [CH_INH_Comisiones]
GO
ALTER TABLE [dbo].[Mod_Pago]  WITH CHECK ADD  CONSTRAINT [CH_INH_Mod_Pago] CHECK  (([Mod_Pago_TYPE]='Tarjeta' OR [Mod_Pago_TYPE]='Paypal' OR [Mod_Pago_TYPE]='Mod_Pago' OR [Mod_Pago_TYPE]='Efectivo'))
GO
ALTER TABLE [dbo].[Mod_Pago] CHECK CONSTRAINT [CH_INH_Mod_Pago]
GO
USE [master]
GO
ALTER DATABASE [STASHMOTOR] SET  READ_WRITE 
GO
--
