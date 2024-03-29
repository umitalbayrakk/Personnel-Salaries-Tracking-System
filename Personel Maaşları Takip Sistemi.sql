USE master
GO
/****** Veritabanını Oluşturma ******/
CREATE DATABASE db_ArifSahin
ON PRIMARY 
(NAME = 'db_ArifSahin', FILENAME = 'C:\db_ArifSahin.mdf', SIZE = 5120KB, FILEGROWTH = 1024KB)
 LOG ON 
(NAME = 'db_ArifSahin_log', FILENAME = 'C:\db_ArifSahin_log.ldf', SIZE = 1024KB , FILEGROWTH = 1024KB)
GO
ALTER DATABASE db_ArifSahin SET COMPATIBILITY_LEVEL = 150
GO
USE db_ArifSahin
GO

USE [master]
GO
/****** Object:  Database [db_ArifSahin]    Script Date: 8.06.2023 10:35:09 ******/
CREATE DATABASE [db_ArifSahin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ArifSahin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\db_ArifSahin.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_ArifSahin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\db_ArifSahin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_ArifSahin] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ArifSahin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ArifSahin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ArifSahin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ArifSahin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ArifSahin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ArifSahin] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ArifSahin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ArifSahin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ArifSahin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ArifSahin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ArifSahin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ArifSahin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ArifSahin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ArifSahin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ArifSahin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ArifSahin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_ArifSahin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ArifSahin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ArifSahin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ArifSahin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ArifSahin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ArifSahin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ArifSahin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ArifSahin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ArifSahin] SET  MULTI_USER 
GO
ALTER DATABASE [db_ArifSahin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ArifSahin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ArifSahin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ArifSahin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_ArifSahin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_ArifSahin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_ArifSahin] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_ArifSahin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_ArifSahin]
GO
/****** Object:  Table [dbo].[tbl_Departments]    Script Date: 8.06.2023 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Departments](
	[Dept_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[Dept_Phone] [nchar](10) NULL,
	[Maneger_ID] [int] NULL,
 CONSTRAINT [PK_tbl_Departmens] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employees]    Script Date: 8.06.2023 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employees](
	[Empl_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_FName] [nvarchar](50) NULL,
	[Empl_LName] [nvarchar](50) NULL,
	[Empl_BDate] [smalldatetime] NULL,
	[Empl_Name]  AS ((isnull([Empl_FName],'')+'')+isnull([Empl_LName],'')),
	[Empl_Start_Date] [smalldatetime] NULL,
	[Empl_Left_Date] [smalldatetime] NULL,
	[Empl_Address] [nvarchar](50) NULL,
	[Empl_City] [nvarchar](50) NULL,
	[Empl_Province] [nvarchar](50) NULL,
	[Empl_Phone] [varchar](50) NULL,
	[Empl_Cell] [varchar](50) NULL,
	[Empl_Email] [nvarchar](50) NULL,
	[Dept_ID] [int] NULL,
	[Gender_ID] [int] NULL,
	[Title_ID] [int] NULL,
	[Empl_Photo] [image] NULL,
	[Empl_CV] [nvarchar](50) NULL,
	[Empl_CV_File] [nvarchar](50) NULL,
	[Empl_CV_Web] [nvarchar](50) NULL,
	[Entered_By] [nvarchar](50) NULL,
	[Entered_Date] [smalldatetime] NULL,
	[Is_Empl_Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Employess] PRIMARY KEY CLUSTERED 
(
	[Empl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmployeeWages]    Script Date: 8.06.2023 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmployeeWages](
	[Wage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_ID] [int] NULL,
	[Wage_Date] [smalldatetime] NULL,
	[Wage_Amount] [money] NULL,
	[Wage_Commision] [money] NULL,
	[Wage_Total]  AS ([Wage_Amount]+[Wage_Commision]),
	[Month_ID] [int] NULL,
	[Wage_Year]  AS (datepart(year,[Wage_Date])),
 CONSTRAINT [PK_tbl_EmployeeWages] PRIMARY KEY CLUSTERED 
(
	[Wage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Lookups]    Script Date: 8.06.2023 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Lookups](
	[LK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Month] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Lookups] PRIMARY KEY CLUSTERED 
(
	[LK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 8.06.2023 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_ID] [int] NOT NULL,
	[User_Name] [nvarchar](50) NULL,
	[User_Psw] [nvarchar](50) NULL,
	[Role_ID] [int] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Departments] ON 

INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Maneger_ID]) VALUES (1, N'Satış', N'5364167829', 1)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Maneger_ID]) VALUES (2, N'Pazarlama', N'4569874569', 2)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Maneger_ID]) VALUES (3, N'Bilgi İşlem', N'4578945245', 3)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Maneger_ID]) VALUES (4, N'Muhasebe', N'5569874568', 4)
SET IDENTITY_INSERT [dbo].[tbl_Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (1, N'Arif', N'Şahin', CAST(N'2000-01-01T00:00:00' AS SmallDateTime), CAST(N'2020-04-08T00:00:00' AS SmallDateTime), NULL, N'Down St.No1', N'Ereğli', N'Zonguldak', N'5367858985', N'2425987458', N'arif78@gmail.com', 1, 1, 1, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (2, N'Nazife', N'Yılmaz', CAST(N'2000-06-06T00:00:00' AS SmallDateTime), CAST(N'2021-06-02T00:00:00' AS SmallDateTime), NULL, N'Aşağı Sok No:2', N'Silivri', N'İstanbul', N'5689548955', N'4567895564', N'nazife12@gmail.com', 2, 2, 2, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (3, N'Meliha', N'Diniz', CAST(N'2000-04-04T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), NULL, N'Upper St No:1', N'Sincan', N'Ankara', N'9657845632', N'6658965555', N'Meliha2@gmail.com', 3, 2, 3, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (4, N'Mustafa', N'Çoruh', CAST(N'2001-06-02T00:00:00' AS SmallDateTime), CAST(N'2020-12-06T00:00:00' AS SmallDateTime), NULL, N'Maslak Sok No:1', N'Sarıyer', N'Edirne', N'3325658965', N'3256478954', N'Mustafa1@gmail.com', 4, 1, 4, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (5, N'Ali', N'Korkmaz', CAST(N'2001-02-04T00:00:00' AS SmallDateTime), CAST(N'2020-06-02T00:00:00' AS SmallDateTime), NULL, N'Yukarı Sok No:2', N'Manavgat', N'Antalya', N'5897865456', N'1254654855', N'Ali78@gmail.com', 1, 1, 1, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (6, N'Selman', N'Demir', CAST(N'2003-07-24T00:00:00' AS SmallDateTime), CAST(N'2022-08-07T00:00:00' AS SmallDateTime), NULL, N'Ersoy Sok No:2', N'Alanya', N'Bursa', N'4789658795', N'4589658745', N'Selman@gmail.com', 2, 1, 2, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (7, N'Osman', N'Uysal', CAST(N'2002-04-25T00:00:00' AS SmallDateTime), CAST(N'2023-05-02T00:00:00' AS SmallDateTime), NULL, N'Nisantasi Sok No:5', N'Aksu', N'Kastamonu', N'4564897894', N'4564564654', N'Osman07@gmail.com', 4, 1, 3, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (8, N'Süleyman', N'Arıkan', CAST(N'2000-04-02T00:00:00' AS SmallDateTime), CAST(N'2021-03-02T00:00:00' AS SmallDateTime), NULL, N'Konaklı Sok No:5', N'Bodrum', N'Urfa', N'4554878945', N'4254548784', N'Arikan@gmail.com', 3, 1, 2, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (9, N'Arda', N'Ergin', CAST(N'2001-08-18T00:00:00' AS SmallDateTime), CAST(N'2023-02-06T00:00:00' AS SmallDateTime), NULL, N'İncekum Sok No:1', N'İzmit', N'Konya', N'5655489545', N'4587896554', N'Ergin12@gmail.com', 1, 1, 1, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Empl_Start_Date], [Empl_Left_Date], [Empl_Address], [Empl_City], [Empl_Province], [Empl_Phone], [Empl_Cell], [Empl_Email], [Dept_ID], [Gender_ID], [Title_ID], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Is_Empl_Active]) VALUES (10, N'Mustafa', N'Akdağ', CAST(N'2003-08-01T00:00:00' AS SmallDateTime), CAST(N'2020-01-03T00:00:00' AS SmallDateTime), NULL, N'Okurcalar Sok No:2', N'Kepez', N'Sivas', N'5478965487', N'5478965478', N'Mustafa1@gmail.com', 2, 1, 2, NULL, NULL, NULL, NULL, N'Arif', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] ON 

INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Date], [Wage_Amount], [Wage_Commision], [Month_ID]) VALUES (1, 1, CAST(N'2021-03-01T00:00:00' AS SmallDateTime), 10000.0000, 2000.0000, 3)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Date], [Wage_Amount], [Wage_Commision], [Month_ID]) VALUES (2, 2, CAST(N'2023-04-01T00:00:00' AS SmallDateTime), 10000.0000, 1000.0000, 4)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Date], [Wage_Amount], [Wage_Commision], [Month_ID]) VALUES (3, 3, CAST(N'2022-04-06T00:00:00' AS SmallDateTime), 12000.0000, 4000.0000, 4)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Date], [Wage_Amount], [Wage_Commision], [Month_ID]) VALUES (4, 4, CAST(N'2020-06-01T00:00:00' AS SmallDateTime), 14000.0000, 3000.0000, 6)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Lookups] ON 

INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (1, N'Kadın', N'Programcı', N'Sarıyer', N'Ankara', N'Türkiye', N'Ocak', N'Raporcu')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (2, N'Erkek', N'VT Yöneticisi', N'Bornova', N'Samsun', N'ABD', N'Şubat', N'Satış Görevlisi')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (3, NULL, N'Satış Elemanı', N'Alanya', N'Bursa', NULL, N'Mart', N'Veritabancı')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (4, NULL, N'CEO', N'Miami', N'Burdur', NULL, N'Nisan', N'Yönetici')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (5, NULL, N'Müdür', N'Mudanya', N'Florida', NULL, N'Mayıs', N'VT Uzmanı')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (6, NULL, N'VT Tasarımcısı', N'Bucak', N'Van', NULL, N'Haziran', N'Bilgi İşlem')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (7, NULL, N'CIO', N'Fatih', N'Iğdır', NULL, N'Temmuz', N'IT Görevlisi')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (8, NULL, N'Pazarlamacı', N'Gazlıgöl', N'Kastamonu', NULL, N'Ağustos', N'Grafiker')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (9, NULL, N'Programcı', N'Manavgat', N'Mardin', NULL, N'Eylül', N'Yazılım')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (10, NULL, N'Proje Yöneticisi', N'Çankaya', N'Isparta', NULL, N'Ekim', N'Sunucu')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (11, NULL, N'IT Uzmanı', N'Çukurova', N'Çanakkale', NULL, N'Kasım', N'Uzman')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (12, NULL, N'Yazılımcı', N'Kadıköy', N'Kütahya', NULL, N'Aralık', N'Tasarlayıcı')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Gender], [Title], [City], [Province], [Country], [Month], [Role]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Lookups] OFF
GO
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Psw], [Role_ID]) VALUES (1, N'Admin', N'9874', 1)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Psw], [Role_ID]) VALUES (2, N'Sunum', N'3265', 2)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Psw], [Role_ID]) VALUES (3, N'Dosya', N'5698', 3)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Psw], [Role_ID]) VALUES (4, N'Belge', N'4182', 4)
GO
ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Empl_Start_Date]  DEFAULT (getdate()) FOR [Empl_Start_Date]
GO
ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employess_Is_Empl_Active]  DEFAULT ((1)) FOR [Is_Empl_Active]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Date]  DEFAULT (getdate()) FOR [Wage_Date]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Amount]  DEFAULT ((0)) FOR [Wage_Amount]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Commision]  DEFAULT ((0)) FOR [Wage_Commision]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Departments2] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[tbl_Departments] ([Dept_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Departments2]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups1] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups1]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employess_Empl_ID] FOREIGN KEY([Empl_ID])
REFERENCES [dbo].[tbl_Employees] ([Empl_ID])
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employess_Empl_ID]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Lookups1] FOREIGN KEY([Month_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Lookups1]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Lookups1] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Lookups1]
GO
USE [master]
GO
ALTER DATABASE [db_ArifSahin] SET  READ_WRITE 
GO
