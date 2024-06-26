USE [master]
GO
/****** Object:  Database [ExcellenceQuest]    Script Date: 29-04-2024 00:34:18 ******/
CREATE DATABASE [ExcellenceQuest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EQDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EQDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EQDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EQDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExcellenceQuest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExcellenceQuest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExcellenceQuest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExcellenceQuest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExcellenceQuest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExcellenceQuest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExcellenceQuest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExcellenceQuest] SET  MULTI_USER 
GO
ALTER DATABASE [ExcellenceQuest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExcellenceQuest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExcellenceQuest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExcellenceQuest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExcellenceQuest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExcellenceQuest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExcellenceQuest] SET QUERY_STORE = OFF
GO
USE [ExcellenceQuest]
GO
/****** Object:  User [GGKU5DELL1938\ACS]    Script Date: 29-04-2024 00:34:18 ******/
CREATE USER [GGKU5DELL1938\ACS] FOR LOGIN [GGKU5DELL1938\ACS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [eq]    Script Date: 29-04-2024 00:34:18 ******/
CREATE SCHEMA [eq]
GO
/****** Object:  Table [eq].[Badge]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Badge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Badge1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[BadgeConfiguration]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[BadgeConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BadgeId] [int] NOT NULL,
	[KpiId] [int] NOT NULL,
	[SubCompetencyId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[KpiCriteria] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BadgeConfiguration1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[Competency]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Competency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Competency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[Employee]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Employee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[GradeId] [int] NOT NULL,
	[CompetencyId] [int] NOT NULL,
	[SubCompetencyId] [int] NOT NULL,
	[StreamId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [eq].[EmployeeAchievements]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[EmployeeAchievements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[KpiId] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[AchievedOn] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAchievements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[Grade]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Grade1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[KeyPerformanceIndex]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[KeyPerformanceIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[StreamId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[SubCompetencyId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_KeyPerformanceIndex1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[KPISuccessCriteria]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[KPISuccessCriteria](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GradeId] [int] NOT NULL,
	[KpiId] [int] NOT NULL,
	[Weightage] [bigint] NOT NULL,
	[Rating] [int] NOT NULL,
	[SubCompetencyId] [int] NOT NULL,
	[SuccessCriteria] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_KPISuccessCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[Role]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[Stream]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[Stream](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Stream1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[SubCompetency]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[SubCompetency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CompetencyId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubCompetency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[User]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[EmployeeId] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [eq].[UserRole]    Script Date: 29-04-2024 00:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [eq].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [eq].[Badge] ON 

INSERT [eq].[Badge] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Novice', N'Beginner', CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, 0)
INSERT [eq].[Badge] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Master', N'Intermediate', CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, 0)
INSERT [eq].[Badge] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'Expert', N'Advanced', CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, 0)
INSERT [eq].[Badge] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Pro', N'Professional', CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, CAST(N'2024-04-25T18:41:35.587' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[Badge] OFF
GO
SET IDENTITY_INSERT [eq].[Competency] ON 

INSERT [eq].[Competency] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Digital Engineering', N'Digital Engineering', CAST(N'2024-04-25T18:49:50.953' AS DateTime), 1, CAST(N'2024-04-25T18:49:50.953' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[Competency] OFF
GO
SET IDENTITY_INSERT [eq].[Employee] ON 

INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (1, N'Ajay', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (2, N'Madesh', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (3, N'Meghana', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (4, N'Sai Kiran', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (5, N'Laxman', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (6, N'Akshay', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (7, N'Bharat', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (8, N'Aamir', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (9, N'Sandeep', N'ASE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (10, N'Garima', N'SSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (11, N'Bhavitha', N'SSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (12, N'Tharun', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (13, N'Shanti', N'JSE', 1, 1, 1, 1, 0)
INSERT [eq].[Employee] ([Id], [Name], [Designation], [GradeId], [CompetencyId], [SubCompetencyId], [StreamId], [IsDeleted]) VALUES (14, N'Suraj', N'JSE', 1, 1, 1, 1, 0)
SET IDENTITY_INSERT [eq].[Employee] OFF
GO
SET IDENTITY_INSERT [eq].[EmployeeAchievements] ON 

INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 10, 4, N'Interview', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, 10, 1, N'RFPs Proposal', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (4, 10, 4, N'Interview', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (5, 10, 1, N'RFP proposal', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (8, 10, 1, N'RFP', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (9, 10, 1, N'rfp', CAST(N'2024-04-25T19:08:23.583' AS DateTime), CAST(N'2024-04-25T19:08:23.583' AS DateTime), 10, 10, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (11, 1, 4, N'Interview', CAST(N'2024-04-25T18:51:57.400' AS DateTime), CAST(N'2024-04-25T18:51:57.400' AS DateTime), 10, 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (12, 1, 1, N'RFP', CAST(N'2024-04-25T18:51:57.400' AS DateTime), CAST(N'2024-04-25T18:51:57.400' AS DateTime), 10, 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 0)
INSERT [eq].[EmployeeAchievements] ([Id], [EmployeeId], [KpiId], [Description], [AchievedOn], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (13, 10, 1, N'Exceeding sales target for Qeeeeee1', CAST(N'2024-04-25T09:00:00.000' AS DateTime), CAST(N'2024-04-29T00:00:00.000' AS DateTime), 123, 10, CAST(N'2024-04-29T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [eq].[EmployeeAchievements] OFF
GO
SET IDENTITY_INSERT [eq].[Grade] ON 

INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'L2', N'Level 2', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'L3', N'Level 3', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'L4', N'Level 4', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'L5', N'Level 5', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (5, N'L6', N'Level 6', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (6, N'L7', N'Level 7', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (7, N'L8', N'Level 8', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
INSERT [eq].[Grade] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (8, N'L9', N'Level 9', CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, CAST(N'2024-04-25T18:57:04.820' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[Grade] OFF
GO
SET IDENTITY_INSERT [eq].[KeyPerformanceIndex] ON 

INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (1, N'RFPs Proposal', N'RFP Proposal', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (2, N'Tech Talks Sessions', N'Tech Talk', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (3, N'Tech Support Across Projects', N'Tech Support', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (4, N'Interview', N'Interviews', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (5, N'Accelerators & Frameworks', N'Accelerators', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (6, N'Tools & Templates', N'Tools', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (7, N'Case Studies', N'Case Studies', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (8, N'White Papers', N'White Papers', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (9, N'Fresher Training Program', N'Training Program', 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (10, N'Functional Support', N'Functional Support', 2, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, CAST(N'2024-04-25T19:08:23.583' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (11, N'test', N'test', 1, CAST(N'2018-04-08T00:00:00.000' AS DateTime), 1, CAST(N'2018-04-08T00:00:00.000' AS DateTime), 1, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (12, N'Example Object', N'This is an example object with a properly formatted DateTime value.', 1, CAST(N'2024-04-26T12:30:45.123' AS DateTime), 10, CAST(N'2024-04-26T12:30:45.123' AS DateTime), 10, 1, 0)
INSERT [eq].[KeyPerformanceIndex] ([Id], [Name], [Description], [StreamId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SubCompetencyId], [IsDeleted]) VALUES (15, N'Example Object', N'This is an example object with a properly formatted DateTime value.', 1, CAST(N'2024-04-26T12:30:45.123' AS DateTime), 10, CAST(N'2024-04-26T12:30:45.123' AS DateTime), 10, 1, 0)
SET IDENTITY_INSERT [eq].[KeyPerformanceIndex] OFF
GO
SET IDENTITY_INSERT [eq].[KPISuccessCriteria] ON 

INSERT [eq].[KPISuccessCriteria] ([Id], [GradeId], [KpiId], [Weightage], [Rating], [SubCompetencyId], [SuccessCriteria], [Description], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 3, 4, 20, 3, 1, 4, N'hjh', 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 0)
INSERT [eq].[KPISuccessCriteria] ([Id], [GradeId], [KpiId], [Weightage], [Rating], [SubCompetencyId], [SuccessCriteria], [Description], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, 3, 1, 10, 3, 1, 3, N'uuuu', 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 10, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 0)
SET IDENTITY_INSERT [eq].[KPISuccessCriteria] OFF
GO
SET IDENTITY_INSERT [eq].[Role] ON 

INSERT [eq].[Role] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Admin', N'Admin', CAST(N'2024-04-25T18:47:37.360' AS DateTime), 1, CAST(N'2024-04-25T18:47:37.360' AS DateTime), 1, 0)
INSERT [eq].[Role] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Employee', N'Employee', CAST(N'2024-04-25T18:47:37.360' AS DateTime), 1, CAST(N'2024-04-25T18:47:37.360' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[Role] OFF
GO
SET IDENTITY_INSERT [eq].[Stream] ON 

INSERT [eq].[Stream] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Technical', N'Technical Stream', CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, 0)
INSERT [eq].[Stream] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Functional', N'Functional Stream', CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, 0)
INSERT [eq].[Stream] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'People', N'People Stream', CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, CAST(N'2024-04-25T18:59:38.013' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[Stream] OFF
GO
SET IDENTITY_INSERT [eq].[SubCompetency] ON 

INSERT [eq].[SubCompetency] ([Id], [Name], [CompetencyId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Microsoft', 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, 0)
INSERT [eq].[SubCompetency] ([Id], [Name], [CompetencyId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Java', 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, 0)
INSERT [eq].[SubCompetency] ([Id], [Name], [CompetencyId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'Mobile', 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, 0)
INSERT [eq].[SubCompetency] ([Id], [Name], [CompetencyId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Open Source', 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, CAST(N'2024-04-25T18:51:57.400' AS DateTime), 1, 0)
SET IDENTITY_INSERT [eq].[SubCompetency] OFF
GO
SET IDENTITY_INSERT [eq].[User] ON 

INSERT [eq].[User] ([Id], [UserName], [Password], [EmployeeId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'mishra.garima@acsicorp.com', N'1234', N'10', CAST(N'2024-04-25T18:49:50.953' AS DateTime), 10, CAST(N'2024-04-25T18:49:50.953' AS DateTime), 10, 0)
SET IDENTITY_INSERT [eq].[User] OFF
GO
SET IDENTITY_INSERT [eq].[UserRole] ON 

INSERT [eq].[UserRole] ([Id], [EmployeeId], [RoleId]) VALUES (1, 10, 1)
SET IDENTITY_INSERT [eq].[UserRole] OFF
GO
ALTER TABLE [eq].[Badge] ADD  CONSTRAINT [DF_Badge_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[BadgeConfiguration] ADD  CONSTRAINT [DF_BadgeConfiguration_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[Competency] ADD  CONSTRAINT [DF_Competency_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[Employee] ADD  CONSTRAINT [DF_Employee_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[EmployeeAchievements] ADD  CONSTRAINT [DF_EmployeeAchievements_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[Grade] ADD  CONSTRAINT [DF_Grade_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[KeyPerformanceIndex] ADD  CONSTRAINT [DF_KeyPerformanceIndex_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[KPISuccessCriteria] ADD  CONSTRAINT [DF_KPISuccessCriteria_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[Role] ADD  CONSTRAINT [DF_Role_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[Stream] ADD  CONSTRAINT [DF_Stream_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[SubCompetency] ADD  CONSTRAINT [DF_SubCompetency_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [eq].[BadgeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK__BadgeConf__Badge__619B8048] FOREIGN KEY([BadgeId])
REFERENCES [eq].[Badge] ([Id])
GO
ALTER TABLE [eq].[BadgeConfiguration] CHECK CONSTRAINT [FK__BadgeConf__Badge__619B8048]
GO
ALTER TABLE [eq].[BadgeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK__BadgeConf__Grade__60A75C0F] FOREIGN KEY([GradeId])
REFERENCES [eq].[Grade] ([Id])
GO
ALTER TABLE [eq].[BadgeConfiguration] CHECK CONSTRAINT [FK__BadgeConf__Grade__60A75C0F]
GO
ALTER TABLE [eq].[BadgeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK__BadgeConf__KpiId__5FB337D6] FOREIGN KEY([KpiId])
REFERENCES [eq].[KeyPerformanceIndex] ([Id])
GO
ALTER TABLE [eq].[BadgeConfiguration] CHECK CONSTRAINT [FK__BadgeConf__KpiId__5FB337D6]
GO
ALTER TABLE [eq].[BadgeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK__BadgeConf__SubCo__5EBF139D] FOREIGN KEY([SubCompetencyId])
REFERENCES [eq].[SubCompetency] ([Id])
GO
ALTER TABLE [eq].[BadgeConfiguration] CHECK CONSTRAINT [FK__BadgeConf__SubCo__5EBF139D]
GO
ALTER TABLE [eq].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Competency] FOREIGN KEY([CompetencyId])
REFERENCES [eq].[Competency] ([Id])
GO
ALTER TABLE [eq].[Employee] CHECK CONSTRAINT [FK_Employee_Competency]
GO
ALTER TABLE [eq].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Id])
REFERENCES [eq].[Employee] ([Id])
GO
ALTER TABLE [eq].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [eq].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Grade] FOREIGN KEY([GradeId])
REFERENCES [eq].[Grade] ([Id])
GO
ALTER TABLE [eq].[Employee] CHECK CONSTRAINT [FK_Employee_Grade]
GO
ALTER TABLE [eq].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_SubCompetency] FOREIGN KEY([SubCompetencyId])
REFERENCES [eq].[SubCompetency] ([Id])
GO
ALTER TABLE [eq].[Employee] CHECK CONSTRAINT [FK_Employee_SubCompetency]
GO
ALTER TABLE [eq].[EmployeeAchievements]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeA__KpiId__52593CB8] FOREIGN KEY([KpiId])
REFERENCES [eq].[KeyPerformanceIndex] ([Id])
GO
ALTER TABLE [eq].[EmployeeAchievements] CHECK CONSTRAINT [FK__EmployeeA__KpiId__52593CB8]
GO
ALTER TABLE [eq].[EmployeeAchievements]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAchievements_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [eq].[Employee] ([Id])
GO
ALTER TABLE [eq].[EmployeeAchievements] CHECK CONSTRAINT [FK_EmployeeAchievements_Employee]
GO
ALTER TABLE [eq].[KeyPerformanceIndex]  WITH CHECK ADD  CONSTRAINT [FK_KeyPerformanceIndex_Stream] FOREIGN KEY([StreamId])
REFERENCES [eq].[Stream] ([Id])
GO
ALTER TABLE [eq].[KeyPerformanceIndex] CHECK CONSTRAINT [FK_KeyPerformanceIndex_Stream]
GO
ALTER TABLE [eq].[KeyPerformanceIndex]  WITH CHECK ADD  CONSTRAINT [FK_KeyPerformanceIndex_SubCompetency] FOREIGN KEY([SubCompetencyId])
REFERENCES [eq].[SubCompetency] ([Id])
GO
ALTER TABLE [eq].[KeyPerformanceIndex] CHECK CONSTRAINT [FK_KeyPerformanceIndex_SubCompetency]
GO
ALTER TABLE [eq].[KPISuccessCriteria]  WITH CHECK ADD  CONSTRAINT [FK__KPISucces__Grade__48CFD27E] FOREIGN KEY([GradeId])
REFERENCES [eq].[Grade] ([Id])
GO
ALTER TABLE [eq].[KPISuccessCriteria] CHECK CONSTRAINT [FK__KPISucces__Grade__48CFD27E]
GO
ALTER TABLE [eq].[KPISuccessCriteria]  WITH CHECK ADD  CONSTRAINT [FK__KPISucces__KpiId__5070F446] FOREIGN KEY([KpiId])
REFERENCES [eq].[KeyPerformanceIndex] ([Id])
GO
ALTER TABLE [eq].[KPISuccessCriteria] CHECK CONSTRAINT [FK__KPISucces__KpiId__5070F446]
GO
ALTER TABLE [eq].[KPISuccessCriteria]  WITH CHECK ADD  CONSTRAINT [FK__KPISucces__SubCo__5165187F] FOREIGN KEY([SubCompetencyId])
REFERENCES [eq].[SubCompetency] ([Id])
GO
ALTER TABLE [eq].[KPISuccessCriteria] CHECK CONSTRAINT [FK__KPISucces__SubCo__5165187F]
GO
ALTER TABLE [eq].[SubCompetency]  WITH CHECK ADD  CONSTRAINT [FK__SubCompet__Compe__46E78A0C] FOREIGN KEY([CompetencyId])
REFERENCES [eq].[Competency] ([Id])
GO
ALTER TABLE [eq].[SubCompetency] CHECK CONSTRAINT [FK__SubCompet__Compe__46E78A0C]
GO
ALTER TABLE [eq].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK__UserRole__RoleId__5812160E] FOREIGN KEY([RoleId])
REFERENCES [eq].[Role] ([Id])
GO
ALTER TABLE [eq].[UserRole] CHECK CONSTRAINT [FK__UserRole__RoleId__5812160E]
GO
ALTER TABLE [eq].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [eq].[Employee] ([Id])
GO
ALTER TABLE [eq].[UserRole] CHECK CONSTRAINT [FK_UserRole_Employee]
GO
USE [master]
GO
ALTER DATABASE [ExcellenceQuest] SET  READ_WRITE 
GO
