USE [master]
GO
/****** Object:  Database [MilkTeaManagement]    Script Date: 6/30/2022 4:10:44 PM ******/
CREATE DATABASE [MilkTeaManagement]

GO
ALTER DATABASE [MilkTeaManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkTeaManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkTeaManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkTeaManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MilkTeaManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkTeaManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MilkTeaManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MilkTeaManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkTeaManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkTeaManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkTeaManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MilkTeaManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MilkTeaManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MilkTeaManagement] SET QUERY_STORE = OFF
GO
USE [MilkTeaManagement]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[cateID] [char](3) NOT NULL,
	[cateName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [char](3) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [char](3) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[price] [float] NULL,
	[image] [varchar](300) NULL,
	[description] [nvarchar](300) NULL,
	[cateID] [char](3) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [char](3) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/30/2022 4:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[email] [nvarchar](200) NULL,
	[address] [nvarchar](500) NULL,
	[phoneNo] [varchar](11) NULL,
	[roleID] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'ICB', N'Đá xay')
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'LTE', N'Latte Series')
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'SPC', N'Thức Uống Đặc Biệt')
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'TRN', N'Trà Nguyên Chất')
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'TRS', N'Trà Sữa')
INSERT [dbo].[tblCategories] ([cateID], [cateName]) VALUES (N'TST', N'Thức Uống Sáng Tạo')
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (3, 3, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (4, 3, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (5, 4, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (6, 4, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (7, 5, N'MT4', 70000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (8, 5, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (9, 6, N'SP2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (10, 6, N'SP3', 55000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (11, 7, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (12, 7, NULL, 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (13, 8, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (14, 8, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (15, 9, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (16, 9, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (17, 10, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (18, 10, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (19, 11, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (20, 12, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (21, 12, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (22, 13, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (23, 13, N'MT1', 60000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (24, 14, N'TR1', 42000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (25, 15, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (26, 15, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (27, 24, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (28, 29, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (29, 30, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (30, 30, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (31, 31, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (32, 31, N'IB1', 65000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (33, 32, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (34, 33, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (35, 34, N'MT4', 70000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (36, 35, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (37, 36, N'MT4', 70000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (38, 37, N'SP3', 55000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (39, 37, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (40, 37, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (41, 38, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (42, 38, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (43, 39, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (44, 40, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (45, 41, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (46, 42, N'SP1', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (47, 42, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (48, 42, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (49, 43, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (50, 43, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (51, 44, N'TR2', 42000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (52, 45, N'TR2', 42000, 4)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (53, 46, N'TR2', 42000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (54, 47, N'TR2', 42000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (55, 48, N'TR1', 42000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (56, 49, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (57, 49, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (58, 50, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (59, 51, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (60, 52, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (61, 53, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (62, 54, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (63, 55, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (64, 56, NULL, 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (65, 57, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (66, 57, N'CR3', 67000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (67, 57, NULL, 60000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (68, 57, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (69, 58, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (70, 58, N'CR3', 67000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (71, 58, NULL, 60000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (72, 58, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (73, 59, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (74, 59, N'CR3', 67000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (75, 59, NULL, 60000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (76, 59, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (77, 60, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (78, 60, N'CR3', 67000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (79, 60, NULL, 60000, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (80, 60, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (81, 61, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (82, 61, N'CR1', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (83, 62, N'CR2', 58000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (84, 63, N'CR1', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (85, 64, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (86, 65, N'MT1', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (87, 66, N'IB2', 60000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (88, 67, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (89, 68, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (90, 69, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (91, 70, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (92, 71, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (93, 72, N'IB1', 65000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (94, 73, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (95, 74, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (96, 75, N'MT2', 57000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (97, 76, N'MT2', 57000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (98, 77, N'CR3', 67000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (99, 78, N'MT3', 59000, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (100, 79, N'TR1', 42000, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (3, N'103466032095273078008', CAST(N'2022-06-19' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (4, NULL, CAST(N'2022-06-19' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (5, N'103466032095273078008', CAST(N'2022-06-19' AS Date), 129000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (6, N'103466032095273078008', CAST(N'2022-06-19' AS Date), 115000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (7, N'103466032095273078008', CAST(N'2022-06-19' AS Date), 119000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (8, N'103466032095273078008', CAST(N'2022-06-20' AS Date), 125000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (9, NULL, CAST(N'2022-06-20' AS Date), 125000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (10, N'103466032095273078008', CAST(N'2022-06-21' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (11, N'103466032095273078008', CAST(N'2022-06-21' AS Date), 65000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (12, NULL, CAST(N'2022-06-21' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (13, NULL, CAST(N'2022-06-21' AS Date), 180000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (14, N'103466032095273078008', CAST(N'2022-06-21' AS Date), 84000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (15, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (16, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (17, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (18, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (19, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (20, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (21, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (22, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (23, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (24, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (25, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (26, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 119000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (27, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 178000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (28, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (29, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 65000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (30, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (31, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 190000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (32, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (33, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (34, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 70000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (35, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (36, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 210000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (37, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 174000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (38, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 125000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (39, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (40, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 59000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (41, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 59000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (42, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 179000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (43, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 116000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (44, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 42000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (45, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 168000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (46, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 126000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (47, N'100129541662209644947', CAST(N'2022-06-22' AS Date), 42000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (48, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 42000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (49, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 120000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (50, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (51, N'103466032095273078008', CAST(N'2022-06-22' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (52, N'103466032095273078008', CAST(N'2022-06-23' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (53, N'100129541662209644947', CAST(N'2022-06-23' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (54, N'100129541662209644947', CAST(N'2022-06-23' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (55, N'100129541662209644947', CAST(N'2022-06-23' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (56, N'103466032095273078008', CAST(N'2022-06-23' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (57, N'103466032095273078008', CAST(N'2022-06-24' AS Date), 432000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (58, N'103466032095273078008', CAST(N'2022-06-24' AS Date), 432000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (59, N'103466032095273078008', CAST(N'2022-06-24' AS Date), 432000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (60, N'103466032095273078008', CAST(N'2022-06-24' AS Date), 432000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (61, N'103466032095273078008', CAST(N'2022-06-25' AS Date), 117000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (62, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 58000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (63, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 59000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (64, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (65, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (66, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 60000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (67, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 59000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (68, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (69, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (70, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (71, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (72, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 65000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (73, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (74, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (75, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 57000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (76, N'103466032095273078008', CAST(N'2022-06-26' AS Date), 114000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (77, N'USuser011567989833', CAST(N'2022-06-27' AS Date), 67000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (78, N'103466032095273078008', CAST(N'2022-06-27' AS Date), 59000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [total]) VALUES (79, N'103466032095273078008', CAST(N'2022-06-28' AS Date), 42000)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'CR1', N'Strawberry Choco Milk Tea', 59000, N'https://gongcha.com.vn/wp-content/uploads/2022/02/Strawberry-Chocolate-Milk-Tea.png', N'', N'TST', 3)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'CR2', N'Strawberry Choco Smoothie', 58000, N'https://gongcha.com.vn/wp-content/uploads/2022/02/Strawberry-Chocolate-Smoothie.png', N'', N'TST', 4)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'CR3', N'Trà Trái Cây Trân Châu Hoàng Kim', 67000, N'https://gongcha.com.vn/wp-content/uploads/2022/06/Tra-trai-cay-tran-chau-HK.png', N'', N'TST', 41)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'IB1', N'Taro Ice Blended', 65000, N'http://gongcha.com.vn/wp-content/uploads/2018/02/Khoai-m%C3%B4n-%C4%91%C3%A1-xay-2.png', N'Khoai môn ngọt ngào được xay chung với sữa, có thể dùng kèm với Kem (Whipping Cream) hoặc Trân Châu Đen.', N'ICB', 91)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'IB2', N'Chocolate Ice Blended', 60000, N'http://gongcha.com.vn/wp-content/uploads/2018/02/Chocolate-%C4%91%C3%A1-xay-2.png', N'Vị Socola thơm ngon được xay chung với sữa cho ra ly đá xay Socola ngọt ngào', N'ICB', 81)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'MT1', N'Peach Milk Tea', 60000, N'http://gongcha.com.vn/wp-content/uploads/2021/12/Tra-Sua-Dao.png', N'Milk Tea with Peach Flavours', N'TRS', 90)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'MT2', N'Hokkaido Milk Tea', 57000, N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Hokkaido-2.png', N'Signature Milk Tea', N'TRS', 89)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'MT3', N'Trà Sữa Matcha Đậu Đỏ', 59000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Matcha-%C4%91%E1%BA%ADu-%C4%91%E1%BB%8F-2.png', N'Vị chát của trà xanh Nhật Bản (Matcha) pha chút ngọt ngào của sữa dùng kèm Đậu Đỏ bùi và béo sẽ làm bạn bất ngờ.', N'TRS', 93)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'MT4', N'Okinawa Oreo Cream Milk Tea', 70000, N'https://gongcha.com.vn/wp-content/uploads/2019/11/Okinawa-Milk-Foam-Smoothie.png', N'', N'TRS', 95)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'SP1', N'Trà Xanh Gongcha', 57000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tra%CC%80-xanh-GC.png', N'Vị trà Xanh (Lục Trà) thơm nhẹ và thanh mát, hòa cùng lớp kem sữa mặn.
', N'SPC', 99)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'SP2', N'Trà Oolong Gongcha', 60000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Oolong-Milkfoam-3.png', N'Vị trà đậm và thơm kết hợp hòa quyện với lớp kem sữa mặn.', N'SPC', 99)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'SP3', N'Trà Allisan Gongcha', 55000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Alisan-Milkfoam-2.png', N'Loại trà đặc trưng của vùng đồi núi Alisan ở Đài Loan, hương trà thơm hòa quyện cùng lớp kem sữa mặn.', N'SPC', 98)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'TR1', N'Trà Bí Đao Alisan', 42000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-B%C3%AD-%C4%90ao-Alisan-2.png', N'Trà bí đao ngọt ngào kết hợp với trà Alisan, cho ra ly trà thơm, ngọt dịu dễ uống.', N'TRN', 2)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [image], [description], [cateID], [quantity]) VALUES (N'TR2', N'Trà Bí Đao', 42000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-B%C3%AD-%C4%90ao-2.png', N'Trà bí đao ngọt ngào, thanh mát, giúp giải nhiệt tốt.', N'TRN', 0)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'ADM', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'USR', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [username], [fullName], [email], [address], [phoneNo], [roleID]) VALUES (N'100129541662209644947', N'12345', N'quangtm0404', N'Minh Quang Trang', N'zuesnanii@gmail.com', N'104/2, Trần Quang Khải, Tân Định, Quận 1, Hồ Chí Minh   ', N'0909014403', N'USR')
INSERT [dbo].[tblUsers] ([userID], [password], [username], [fullName], [email], [address], [phoneNo], [roleID]) VALUES (N'103466032095273078008', N'sa123', N'admin', N'Trang Minh Quang', N'quangtmse161987@fpt.edu.vn', N'12/21/21 Hoàng Diệu, Quận 4, Thành Phố Hồ Chí Minh', N'0909014402', N'ADM')
INSERT [dbo].[tblUsers] ([userID], [password], [username], [fullName], [email], [address], [phoneNo], [roleID]) VALUES (N'US quangtm01521392650526', N'12345', N'quangtm0152', N'Võ Thái Anh', N'hrtak1819@gmail.com', N'12345, Bùi Văn Ba, Phường Tân Thuận Đông, Quận 7', N'0909050607', N'USR')
INSERT [dbo].[tblUsers] ([userID], [password], [username], [fullName], [email], [address], [phoneNo], [roleID]) VALUES (N'USadmin1707253026', N'1', N'admin', N'Tui La Admin', N'tuilaadmin@gmail.com', N'12345, ABCD, EFGH', N'093256874', N'ADM')
INSERT [dbo].[tblUsers] ([userID], [password], [username], [fullName], [email], [address], [phoneNo], [roleID]) VALUES (N'USuser011567989833', N'1', N'user01', N'Hoàng Anh Tú', N'tuhanmsk@gmail.com', N'12389, Đường số 7, Phường An Nhàn, Quận Rảnh rỗi, Thành Phố An Toàn', N'0909080706', N'USR')
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[tblCategories] ([cateID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [MilkTeaManagement] SET  READ_WRITE 
GO
