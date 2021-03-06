USE [master]
GO
/****** Object:  Database [Pos]    Script Date: 2/13/2021 6:22:45 PM ******/
CREATE DATABASE [Pos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pos] SET  MULTI_USER 
GO
ALTER DATABASE [Pos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pos] SET QUERY_STORE = OFF
GO
USE [Pos]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ParentCategoryID] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] NOT NULL,
	[ParentMenuID] [int] NULL,
	[ModuleID] [int] NULL,
	[Name] [varchar](100) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Class] [varchar](100) NULL,
	[Icon] [varchar](100) NULL,
	[MenulLevel] [int] NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__Menu__C99ED250BE3C2C45] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ModuleID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__Module__2B747787595A8A18] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__Role__8AFACE3A8CDC7E6F] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[RoleID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[CanView] [bit] NULL,
	[CanAdd] [bit] NULL,
	[CanEdit] [bit] NULL,
	[CanDelete] [bit] NULL,
	[CanApprove] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/13/2021 6:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NULL,
	[DepartmentID] [int] NULL,
	[LocationID] [int] NULL,
	[DesignationID] [int] NULL,
	[EmployeeID] [int] NULL,
	[FirstName] [varchar](40) NULL,
	[MiddleName] [varchar](20) NULL,
	[LastName] [varchar](40) NULL,
	[Name] [varchar](100) NULL,
	[Id] [varchar](100) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Salt] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__User__1788CCACBDBF1D34] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Kg', N'Kilogram unit', 2, 0, 0, CAST(N'2021-02-01T15:42:36.840' AS DateTime), 1, CAST(N'2021-02-01T17:32:58.677' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Liters', N'lt', 0, 0, 0, CAST(N'2021-02-01T15:50:43.660' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Test', N'test', 0, 0, 0, CAST(N'2021-02-01T15:53:26.157' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'other', N'abc', 0, 0, 0, CAST(N'2021-02-01T17:29:04.397' AS DateTime), 1, CAST(N'2021-02-01T17:32:11.563' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Other8', N'Other', 2, 0, 0, CAST(N'2021-02-05T09:19:15.553' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (19, N'Other12', N'Other', 2, 0, 0, CAST(N'2021-02-05T09:19:35.117' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (20, N'Other13', N'Other', 2, 0, 0, CAST(N'2021-02-05T09:19:37.263' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (21, N'Other14', N'Other', 0, 0, 0, CAST(N'2021-02-05T09:19:43.993' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (22, N'Other15', N'Other', 0, 0, 0, CAST(N'2021-02-05T09:19:46.383' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (23, N'pieces3333', N'This is pieces', 3, 0, 0, CAST(N'2021-02-05T09:46:35.080' AS DateTime), 1, CAST(N'2021-02-06T14:06:54.890' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (24, N'Other', N'test', 3, 0, 0, CAST(N'2021-02-05T10:45:38.047' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (25, N'dsfsf', N'', 0, 0, 0, CAST(N'2021-02-05T11:45:47.547' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (27, N'rewrwe', N'', 0, 0, 0, CAST(N'2021-02-05T11:49:25.870' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (28, N'test1', N'esaf', 9, 0, 0, CAST(N'2021-02-05T12:14:58.203' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (29, N'rwer', N'rew', 2, 0, 0, CAST(N'2021-02-05T12:19:08.860' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (30, N'rwer', N'rew', 2, 0, 0, CAST(N'2021-02-05T12:19:13.490' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (31, N'rewrw', N'rew', 0, 0, 0, CAST(N'2021-02-05T12:22:35.877' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (32, N'dsa', N'dsa', 32, 0, 0, CAST(N'2021-02-05T12:31:48.207' AS DateTime), 1, CAST(N'2021-02-06T12:04:54.643' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (33, N'sdaad', N'dsad', 9, 0, 0, CAST(N'2021-02-05T12:41:27.883' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (34, N'dafad', N'fdsafsa', 2, 0, 0, CAST(N'2021-02-05T12:43:17.127' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (35, N'ewqeq', N'ewq', 2, 0, 0, CAST(N'2021-02-05T12:46:22.510' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (36, N'rewr', N'rew', 2, 0, 0, CAST(N'2021-02-05T12:47:18.343' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (37, N'Again test1', N'', 0, 0, 0, CAST(N'2021-02-05T13:13:59.590' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (38, N'Again test2', N'', 0, 0, 0, CAST(N'2021-02-05T13:14:02.820' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (39, N'Again test3', N'', 0, 0, 0, CAST(N'2021-02-05T13:14:05.133' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (40, N'Again test4', N'', 0, 0, 0, CAST(N'2021-02-05T13:14:07.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (41, N'Again test5', N'', 0, 0, 0, CAST(N'2021-02-05T13:14:11.357' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (42, N'string', N'string', 0, 1, 0, CAST(N'2021-02-06T12:33:07.393' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (43, N'string', N'string', 0, 1, 0, CAST(N'2021-02-06T12:33:07.393' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (44, N'string', N'string', 0, 1, 0, CAST(N'2021-02-06T12:33:07.393' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryID], [IsActive], [IsDeleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (45, N'string', N'string', 0, 1, 0, CAST(N'2021-02-06T12:33:07.393' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, NULL, N'Dashboard', N'/', NULL, N'ti-home', 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, NULL, 1, N'User Management', N'/', NULL, N'ti-settings', 1, 51, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, 51, 1, N'Role', N'/roles', NULL, NULL, 2, 53, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, 51, 1, N'User', N'/users', NULL, NULL, 2, 55, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, 51, 1, N'Role Permissions', NULL, NULL, NULL, 2, 57, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, 51, 1, N'Reset Password', NULL, NULL, NULL, 2, 59, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (101, NULL, 2, N'Products', N'/', NULL, N'ti-user', 1, 101, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (111, 101, 2, N'List Of Products', N'/product', NULL, NULL, 2, 111, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (112, 101, 2, N'Add Products', N'/product/add-product', NULL, NULL, 2, 112, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (113, 101, 2, N'Variation', N'/product/variation', NULL, NULL, 2, 113, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (137, 101, 2, N'Units', N'/product/unit', NULL, NULL, 2, 135, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (201, 101, 2, N'Categories', N'/product/category', NULL, NULL, 2, 201, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (251, NULL, 3, N'Purchase', N'/', NULL, N'ti-layers-alt', 1, 251, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (261, 251, 3, N'List Of Purchases', N'/purchases', NULL, NULL, 2, 261, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (263, 251, 3, N'Add Purchases', N'/purchases/add-purchase', NULL, NULL, 2, 263, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (265, 251, 3, N'List Of Purchases Return', N'/purchases/purchase-return-list', NULL, NULL, 2, 265, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (267, NULL, 4, N'Sell', N'/', NULL, NULL, 1, 267, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (269, 267, 4, N'Sell List', N'/sell', NULL, NULL, 2, 269, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (271, 267, 4, N'Add Sell', N'/sell/add-sell', NULL, NULL, 2, 271, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (272, 267, 4, N'Draft', N'/sell/draft', NULL, NULL, 2, 272, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (273, 267, 4, N'Qoutation', N'/sell/qoutation', NULL, NULL, 2, 273, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (274, 267, 4, N'Sell Return', N'/sell/sell-return', NULL, NULL, 2, 274, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (275, NULL, 5, N'Accounts', N'/', NULL, NULL, 1, 275, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (276, 275, 5, N'Manage Account', N'/account', NULL, NULL, 2, 276, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (277, NULL, 6, N'Entries', N'/', NULL, NULL, 1, 277, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (278, 277, 6, N'Journal Entry', N'/account/journal-entry', NULL, NULL, 2, 278, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (279, 277, 6, N'Combine Entry', N'/account/combine-entry', NULL, NULL, 2, 279, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (280, 277, 6, N'Cash Book', N'/account/cashbook', NULL, NULL, 2, 280, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (281, 277, 6, N'List of entries', N'/account/list-of-entries', NULL, NULL, 2, 281, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (282, NULL, 7, N'Reporting', N'/', NULL, NULL, 1, 282, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (283, 282, 7, N'Ledger', N'/account/ledger', NULL, NULL, 2, 283, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (284, 282, 7, N'Trial Balance', N'/account/trial-balance', NULL, NULL, 2, 284, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (285, 282, 7, N'Profit And Loss', N'/account/profit-lnd-loss', NULL, NULL, 2, 285, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (286, 282, 7, N'Balance Sheet', N'/account/balance-sheet', NULL, NULL, 2, 286, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (287, NULL, 9, N'Setting', N'/', NULL, NULL, 1, 287, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (288, 287, 9, N'Business Setting', N'/setting', NULL, NULL, 2, 288, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (289, 287, 9, N'Business Location', N'/setting/business-location', NULL, NULL, 2, 289, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (290, 287, 9, N'Invoice Setting', N'/setting/invoice-setting', NULL, NULL, 2, 290, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (291, 287, 9, N'Barcode Setting', N'/setting/barcode-setting', NULL, NULL, 2, 291, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (292, 287, 9, N'Receipt Printer', N'/setting/receipt-printer', NULL, NULL, 2, 292, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (293, 287, 9, N'Tax Rate', N'/setting/tax-rate', NULL, NULL, 2, 293, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Menu] ([MenuID], [ParentMenuID], [ModuleID], [Name], [Url], [Class], [Icon], [MenulLevel], [SortOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (294, 287, 9, N'Package Subscription', N'/setting/package-subscription', NULL, NULL, 2, 294, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Admin Panel', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Products', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Purchase', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Sell', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Accounts', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Entries', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Reporting', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'User', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Module] ([ModuleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Settings', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Super Admin', 1, 1, CAST(N'2018-12-29T10:54:16.400' AS DateTime), 1, CAST(N'2019-02-17T02:27:11.207' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Managers', 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), 1, CAST(N'2019-02-09T18:49:35.087' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [Name], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Staff', 1, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 51, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 53, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 55, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 57, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 59, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 101, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 111, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 112, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 113, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 137, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 201, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 251, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 261, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-06T14:31:27.260' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 51, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 53, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 55, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 57, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 59, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 101, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 111, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 112, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 113, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 137, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 201, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 251, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 261, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-09T14:27:22.307' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 263, 1, 1, 1, 1, 1, 1, CAST(N'2019-03-01T11:29:45.047' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 265, 1, 1, 1, 1, 1, 1, CAST(N'2019-03-01T11:29:45.050' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 267, 1, 1, 1, 1, 1, 1, CAST(N'2019-03-01T11:29:45.050' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 269, 1, 1, 1, 1, 1, 1, CAST(N'2019-03-01T11:29:45.053' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 271, 1, 1, 1, 1, 1, 1, CAST(N'2019-03-01T11:33:46.813' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 51, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 53, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 55, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 57, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 59, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 101, 1, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 111, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 112, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 113, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 137, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 201, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 251, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
INSERT [dbo].[RolePermission] ([RoleID], [MenuID], [CanView], [CanAdd], [CanEdit], [CanDelete], [CanApprove], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 261, 0, 0, 0, 0, 0, 1, CAST(N'2019-02-09T18:50:35.087' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 0, 0, 0, 0, 0, N'm', N'sohail', N'shahzad', N'm sohail shahzad', N'admin', N'-huf�U+���nPc^�(��J2��.�
��', N'폔奬坟ྡྷ䎶漬폞Ǳ놉곛ㄪ瀲俩⾂娑', 1, 0, CAST(N'2021-02-03T19:20:50.980' AS DateTime), 0, CAST(N'2021-02-03T19:20:50.980' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 1, 1, 1, 1, 1, N'm', N'waqas', N's', N'waqas', N'system', N'fsd', N'fdsf', 1, 0, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 0, CAST(N'2021-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 2, 2, 2, 2, 2, N'm', N'waleed', N'shahzad', N'waleed', N'admin2', N'�`��J\��);>U�gYmn*�B�?�7R d�', N'娥খ鹮砨焽༏﹃ᅿ픥ꕂ絫䁒ꑧ蹶', 1, 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime), 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 6, 6, 6, 6, 6, N'm1', N'anjum', N'CET', N'anjum', N'admin3', N':/�:��l�e���H5+�,����`}��,�', N'萠瘘焏㜆꒑瘆䡾ᕳ⨂试䈁趒猳', 1, 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime), 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 5, 5, 5, 5, 5, N'm1', N'arslan', N'QA', N'arslan', N'admin5', N'�>n5��"+,sd	H��\v:R����EKv�=', N'຺僅䌞㉤롇檱臘ḍ㼽䴸궳禸齇쌵볚', 1, 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime), 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 4, 4, 4, 4, 4, N'm1', N'shahzad', N'syed', N'shahzad', N'admin4', N'is-w���rl_\S@T|df����tC���6_a', N'猟ￃ逤敞㗆쌻ꠟ꿅ﳐﮀ胾᠘ꐣ틏', 1, 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime), 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime))
INSERT [dbo].[Users] ([UserID], [OrganizationID], [DepartmentID], [LocationID], [DesignationID], [EmployeeID], [FirstName], [MiddleName], [LastName], [Name], [Id], [Password], [Salt], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, 7, 7, 7, 7, 7, N'm1', N'mazhar', N'shah', N'mazhar', N'admin7', N'�Nދ>: $JCԞ��h��J��@��hI�0�� ', N'׊䡶봂仓쑤Ȉ蜇눼淹⧉꾋Ñ붋', 1, 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime), 0, CAST(N'2021-02-07T13:12:12.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uc_module]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [uc_module] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uc_role]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [uc_role] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_RoleMenu]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[RolePermission] ADD  CONSTRAINT [pk_RoleMenu] PRIMARY KEY NONCLUSTERED 
(
	[RoleID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_UserRole]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [pk_UserRole] PRIMARY KEY NONCLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uc_user]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [uc_user] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uc_user_employee]    Script Date: 2/13/2021 6:22:46 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [uc_user_employee] UNIQUE NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([ParentMenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [fk_Menu_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Module] ([ModuleID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [fk_Menu_Module]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Menu]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Role]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllUsers]    Script Date: 2/13/2021 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetAllUsers]
AS
BEGIN
select * from Users
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCategories]    Script Date: 2/13/2021 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetCategories]
@Action varchar(10) =null,
	@PageOffset int =0,
	@MaxRecords int =10,
	@SearchParam nvarchar(50) = null,
	@SortOrder varchar(4)='asc'
AS
BEGIN
if @Action = 'getAll'
	BEGIN
		Select * from Categories
	END
    else if @Action = ''
	BEGIN
		Declare @TotalCount int = (Select Count(*) from Categories) 
		SELECT @TotalCount as 'Count', *  from Categories cat WHERE IsDeleted <> 1 
		and 
		(@SearchParam IS NULL OR cat.CategoryName like '%' + @SearchParam +'%') OR
		(@SearchParam IS NULL OR cat.[Description] like '%' + @SearchParam +'%')
		order by 
		case when @SortOrder <> 'asc' then cat.CategoryID end asc,
		case when @SortOrder <> 'desc' then cat.CategoryID end desc
		offset  @PageOffset ROWS FETCH NEXT @MaxRecords ROWS ONLY
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenus]    Script Date: 2/13/2021 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetMenus]
AS
BEGIN
select * FROM Menu
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserRoles]    Script Date: 2/13/2021 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_GetUserRoles]
as
begin
select r.[Name] as 'Role',m.[Name] as 'Menu' ,rp.* from RolePermission rp
join [role] r on r.RoleId = rp.RoleID
join Menu m on rp.MenuID= m.MenuID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserRolesById]    Script Date: 2/13/2021 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROC [dbo].[SP_GetUserRolesById]
@userId int =1
AS
BEGIN
select UserRole.*,RolePermission.* from UserRole as UserRole
join RolePermission as RolePermission 
on UserRole.RoleID = RolePermission.RoleID
where UserID =@userId;
END
GO
USE [master]
GO
ALTER DATABASE [Pos] SET  READ_WRITE 
GO
