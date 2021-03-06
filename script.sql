USE [master]
GO
/****** Object:  Database [sistema_compra_venta]    Script Date: 19/10/2018 08:19:24 a.m. ******/
CREATE DATABASE [sistema_compra_venta]
ALTER DATABASE [sistema_compra_venta] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistema_compra_venta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistema_compra_venta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sistema_compra_venta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistema_compra_venta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistema_compra_venta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sistema_compra_venta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistema_compra_venta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sistema_compra_venta] SET  MULTI_USER 
GO
ALTER DATABASE [sistema_compra_venta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistema_compra_venta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistema_compra_venta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistema_compra_venta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sistema_compra_venta] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sistema_compra_venta]
GO
/****** Object:  Table [dbo].[almacen]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[almacen](
	[id_almacen] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[numero] [int] NULL,
	[categoria] [varchar](50) NOT NULL,
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[identidad] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compra]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[proveedor] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[fecha_facturacion] [datetime] NULL,
	[total] [decimal](18, 0) NULL,
	[subtotal] [decimal](18, 0) NULL,
	[isv] [decimal](18, 0) NULL,
	[descuento] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[credito_cliente]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[credito_cliente](
	[id_credito] [int] IDENTITY(1,1) NOT NULL,
	[factura] [int] NOT NULL,
	[pagado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[credito_compra]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[credito_compra](
	[id_credito] [int] IDENTITY(1,1) NOT NULL,
	[compra] [int] NOT NULL,
	[pagado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[descripcion_compra]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descripcion_compra](
	[id_descripcion] [int] IDENTITY(1,1) NOT NULL,
	[producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[compra] [int] NOT NULL,
	[precio] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[descripcion_factura]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descripcion_factura](
	[id_descripcion] [int] IDENTITY(1,1) NOT NULL,
	[producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[factura] [int] NOT NULL,
	[precio] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[factura]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[cliente] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[fecha_facturacion] [datetime] NULL DEFAULT (sysdatetime()),
	[total] [decimal](18, 0) NULL,
	[subtotal] [decimal](18, 0) NULL,
	[isv] [decimal](18, 0) NULL,
	[descuento] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventario]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventario](
	[id_inventario] [int] IDENTITY(1,1) NOT NULL,
	[producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha_inventario] [datetime] NULL DEFAULT (sysdatetime()),
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pago_credito_cliente]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago_credito_cliente](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[recargo] [decimal](18, 0) NOT NULL,
	[fecha_pago] [datetime] NULL,
	[credito] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pago_credito_compra]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago_credito_compra](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[recargo] [decimal](18, 0) NOT NULL,
	[fecha_pago] [datetime] NULL,
	[credito] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producto]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio_compra] [decimal](18, 0) NULL DEFAULT ((0)),
	[precio_venta] [decimal](18, 0) NULL DEFAULT ((0)),
	[codigo] [varchar](20) NULL,
	[minimo] [int] NULL DEFAULT ((0)),
	[maximo] [int] NULL DEFAULT ((0)),
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[rtn] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
	[tipo_empresa] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 19/10/2018 08:19:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](100) NULL,
	[contrasena] [varchar](50) NULL,
	[nombre] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [telefono], [identidad], [direccion]) VALUES (1, N'Jose Briones', N'Briones Rosa', N'33397486', N'18004199920432', N'Nueva Esperanza')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [telefono], [identidad], [direccion]) VALUES (2, N'Fernando Jafet', N'Guzman Pineda', N'37817887', N'283781731878', N'Peña Blanca')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[descripcion_factura] ON 

INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (18, 1, 10, 37, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (19, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (20, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (21, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (22, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (23, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (24, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (25, 1, 10, 38, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (26, 1, 100, 39, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (27, 1, 10, 40, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (28, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (29, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (30, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (31, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (32, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (33, 1, 20, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (34, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (35, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (36, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (37, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (38, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (39, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (40, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (41, 1, 10, 41, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (42, 1, 100, 43, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (43, 1, 100, 43, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[descripcion_factura] ([id_descripcion], [producto], [cantidad], [factura], [precio]) VALUES (44, 1, 100, 43, CAST(15 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[descripcion_factura] OFF
SET IDENTITY_INSERT [dbo].[factura] ON 

INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (1, 1, 1, 1, CAST(N'2018-09-30 13:44:33.907' AS DateTime), CAST(1715 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (2, 2, 1, 1, CAST(N'2018-09-30 15:01:14.970' AS DateTime), CAST(1725 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (4, 3, 1, 1, CAST(N'2018-09-30 15:02:32.347' AS DateTime), CAST(1725 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (5, 4, 1, 1, CAST(N'2018-09-30 15:06:46.437' AS DateTime), CAST(1725 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (22, 6, 1, 1, CAST(N'2018-09-30 15:50:52.963' AS DateTime), CAST(173 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (23, 5, 1, 1, CAST(N'2018-09-30 15:53:11.237' AS DateTime), CAST(172 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (24, 11, 1, 1, CAST(N'2018-09-30 15:55:36.850' AS DateTime), CAST(190 AS Decimal(18, 0)), CAST(165 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (25, 7, 1, 1, CAST(N'2018-09-30 15:58:50.747' AS DateTime), CAST(17 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (26, 8, 1, 1, CAST(N'2018-09-30 15:59:18.003' AS DateTime), CAST(121 AS Decimal(18, 0)), CAST(105 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (28, 9, 1, 1, CAST(N'2018-09-30 16:00:33.650' AS DateTime), CAST(103 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (29, 10, 1, 1, CAST(N'2018-09-30 16:02:13.293' AS DateTime), CAST(949 AS Decimal(18, 0)), CAST(825 AS Decimal(18, 0)), CAST(124 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (31, 12, 1, 1, CAST(N'2018-09-30 16:03:47.787' AS DateTime), CAST(949 AS Decimal(18, 0)), CAST(825 AS Decimal(18, 0)), CAST(124 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (32, 13, 1, 1, CAST(N'2018-09-30 16:13:06.507' AS DateTime), CAST(518 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), CAST(68 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (33, 14, 1, 1, CAST(N'2018-09-30 16:13:56.957' AS DateTime), CAST(1625 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (34, 15, 1, 1, CAST(N'2018-09-30 16:20:28.543' AS DateTime), CAST(1725 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (35, 16, 1, 1, CAST(N'2018-09-30 16:22:30.337' AS DateTime), CAST(3440 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (36, 17, 1, 1, CAST(N'2018-09-30 16:26:15.427' AS DateTime), CAST(345 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (37, 19, 1, 1, CAST(N'2018-09-30 16:30:32.457' AS DateTime), CAST(163 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (38, 20, 1, 1, CAST(N'2018-09-30 16:30:52.173' AS DateTime), CAST(1198 AS Decimal(18, 0)), CAST(1050 AS Decimal(18, 0)), CAST(158 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (39, 22, 1, 1, CAST(N'2018-09-30 18:02:14.547' AS DateTime), CAST(1715 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (40, 67, 1, 1, CAST(N'2018-10-16 09:18:23.010' AS DateTime), CAST(73 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (41, 2000, 1, 1, CAST(N'2018-10-16 09:34:54.830' AS DateTime), CAST(2070 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), CAST(270 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[factura] ([id_factura], [numero], [cliente], [usuario], [fecha_facturacion], [total], [subtotal], [isv], [descuento]) VALUES (43, 23, 1, 1, CAST(N'2018-10-19 08:15:52.957' AS DateTime), CAST(5165 AS Decimal(18, 0)), CAST(4500 AS Decimal(18, 0)), CAST(675 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[factura] OFF
SET IDENTITY_INSERT [dbo].[inventario] ON 

INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (1, 1, 100, CAST(N'2018-09-27 11:23:01.567' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (2, 3, 50, CAST(N'2018-09-27 21:46:43.040' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (3, 1, 100, CAST(N'2018-09-27 21:47:32.607' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (4, 1, 100, CAST(N'2018-09-29 15:00:50.500' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (5, 5, 100, CAST(N'2018-09-29 15:13:03.663' AS DateTime), N'Cocina')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (6, 5, 200, CAST(N'2018-09-29 19:51:43.817' AS DateTime), N'Cocina')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (7, 5, 100, CAST(N'2018-09-29 19:52:37.733' AS DateTime), N'Cocina')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (8, 6, 100, CAST(N'2018-09-29 21:26:45.607' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (9, 1, 100, CAST(N'2018-09-30 18:01:04.237' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (10, 1, 100, CAST(N'2018-10-16 09:16:50.050' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (11, 1, 100, CAST(N'2018-10-16 09:33:15.187' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (12, 3, 100, CAST(N'2018-10-16 09:39:00.553' AS DateTime), N'Limpieza')
INSERT [dbo].[inventario] ([id_inventario], [producto], [cantidad], [fecha_inventario], [tipo]) VALUES (13, 1, 100, CAST(N'2018-10-19 07:17:20.273' AS DateTime), N'Limpieza')
SET IDENTITY_INSERT [dbo].[inventario] OFF
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (1, N'Papel higienico', CAST(10 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), N'1', 100, 200, N'Limpieza')
INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (2, N'Jabon', CAST(5 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), N'2', 100, 120, N'Limpieza')
INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (3, N'Suavitel', CAST(2 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), N'3', 20, 50, N'Limpieza')
INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (4, N'Asistin', CAST(10 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), N'4', 30, 50, N'Limpieza')
INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (5, N'Harina', CAST(5 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), N'5', 10, 50, N'Cocina')
INSERT [dbo].[producto] ([id_producto], [nombre], [precio_compra], [precio_venta], [codigo], [minimo], [maximo], [tipo]) VALUES (6, N'Toallas', CAST(45 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), N'6', 50, 100, N'Limpieza')
SET IDENTITY_INSERT [dbo].[producto] OFF
SET IDENTITY_INSERT [dbo].[proveedor] ON 

INSERT [dbo].[proveedor] ([id_proveedor], [nombre], [telefono], [rtn], [direccion], [tipo_empresa]) VALUES (1, N'Supermercados el Chiki', N'33382321', N'46712672867', N'Peña Blanca', N'S.A')
SET IDENTITY_INSERT [dbo].[proveedor] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (1, N'Briones', N'1234', N'David Briones')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (2, N'Fernando', N'1234', N'Fernando Guzman')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (3, N'Dagoberto', N'1234', N'Alejandro Fernandez')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (4, N'Carlos', N'1234', N'Carlos Orellana')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (5, N'Alejandra', N'1234', N'Alejandra Sagastume')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [contrasena], [nombre]) VALUES (6, N'Junior', N'1234', N'Junior Orlando')
SET IDENTITY_INSERT [dbo].[usuario] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__almacen__72AFBCC6EA3658AF]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[almacen] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__cliente__2A16D945B30EFE12]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__cliente__5BFE4D859138626F]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__compra__FC77F211D867C1E6]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[compra] ADD UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__factura__FC77F211945A227A]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[factura] ADD UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__producto__40F9A206F5079848]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[producto] ADD UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__proveedo__2A16D945076DD8DC]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__proveedo__C2B7A6CA4416616B]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[rtn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__usuario__D4D22D748A4B2284]    Script Date: 19/10/2018 08:19:24 a.m. ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra] ADD  DEFAULT (sysdatetime()) FOR [fecha_facturacion]
GO
ALTER TABLE [dbo].[credito_cliente] ADD  DEFAULT ((0)) FOR [pagado]
GO
ALTER TABLE [dbo].[credito_compra] ADD  DEFAULT ((0)) FOR [pagado]
GO
ALTER TABLE [dbo].[pago_credito_cliente] ADD  DEFAULT (sysdatetime()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[pago_credito_compra] ADD  DEFAULT (sysdatetime()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[credito_cliente]  WITH CHECK ADD FOREIGN KEY([factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[credito_compra]  WITH CHECK ADD FOREIGN KEY([compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[descripcion_compra]  WITH CHECK ADD FOREIGN KEY([compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[descripcion_compra]  WITH CHECK ADD FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[descripcion_factura]  WITH CHECK ADD FOREIGN KEY([factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[descripcion_factura]  WITH CHECK ADD FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[pago_credito_cliente]  WITH CHECK ADD FOREIGN KEY([credito])
REFERENCES [dbo].[credito_cliente] ([id_credito])
GO
ALTER TABLE [dbo].[pago_credito_compra]  WITH CHECK ADD FOREIGN KEY([credito])
REFERENCES [dbo].[credito_compra] ([id_credito])
GO
USE [master]
GO
ALTER DATABASE [sistema_compra_venta] SET  READ_WRITE 
GO
