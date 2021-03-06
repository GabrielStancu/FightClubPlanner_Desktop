USE [master]
GO
/****** Object:  Database [FightClubDb]    Script Date: 3/28/2021 4:50:54 AM ******/
CREATE DATABASE [FightClubDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FightClubDb', FILENAME = N'D:\Program Files\SQL Server Management Studio 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\FightClubDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FightClubDb_log', FILENAME = N'D:\Program Files\SQL Server Management Studio 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\FightClubDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FightClubDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FightClubDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FightClubDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FightClubDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FightClubDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FightClubDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FightClubDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FightClubDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FightClubDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FightClubDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FightClubDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FightClubDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FightClubDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FightClubDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FightClubDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FightClubDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FightClubDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FightClubDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FightClubDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FightClubDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FightClubDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FightClubDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FightClubDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FightClubDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FightClubDb] SET RECOVERY FULL 
GO
ALTER DATABASE [FightClubDb] SET  MULTI_USER 
GO
ALTER DATABASE [FightClubDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FightClubDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FightClubDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FightClubDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FightClubDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FightClubDb', N'ON'
GO
ALTER DATABASE [FightClubDb] SET QUERY_STORE = OFF
GO
USE [FightClubDb]
GO
/****** Object:  User [abstract]    Script Date: 3/28/2021 4:50:55 AM ******/
CREATE USER [abstract] FOR LOGIN [abstract] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [abstract]
GO
/****** Object:  Schema [FightClubDbSchema]    Script Date: 3/28/2021 4:50:56 AM ******/
CREATE SCHEMA [FightClubDbSchema]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CovidTests]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CovidTests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsPositive] [bit] NULL,
	[TestDate] [datetime] NULL,
	[FighterId] [int] NULL,
	[IsolationBubbleId] [int] NULL,
 CONSTRAINT [PK_CovidTests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fighters]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fighters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[Birthday] [datetime] NULL,
	[Weight] [int] NULL,
	[Height] [int] NULL,
 CONSTRAINT [PK_Fighters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fights]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FighterId1] [int] NULL,
	[FighterId2] [int] NULL,
	[TournamentId] [int] NULL,
	[FightTime] [datetime] NULL,
	[WinnerId] [int] NULL,
 CONSTRAINT [PK_Fights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invites]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FighterId] [int] NULL,
	[TournamentId] [int] NULL,
	[DateSent] [datetime] NULL,
	[InviteState] [int] NULL,
 CONSTRAINT [PK_Invites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IsolationBubbles]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsolationBubbles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_IsolationBubbles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentFighters]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentFighters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[FighterId] [int] NULL,
 CONSTRAINT [PK_TournamentFighters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 3/28/2021 4:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[OrganizerId] [int] NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CovidTests] ON 

INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (95, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (96, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (97, 0, CAST(N'2021-03-21T00:00:00.000' AS DateTime), 45, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (98, 0, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 45, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (99, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 44, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (100, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 44, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (101, 0, CAST(N'2021-03-21T00:00:00.000' AS DateTime), 44, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (102, 0, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 44, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (103, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 46, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (104, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 46, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (105, 0, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 46, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (106, 0, CAST(N'2021-03-12T00:00:00.000' AS DateTime), 46, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (107, 1, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 47, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (108, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 47, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (109, 0, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 47, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (110, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 48, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (111, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 48, 3)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (112, 0, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 48, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (113, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 49, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (114, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 49, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (115, 0, CAST(N'2021-03-19T00:00:00.000' AS DateTime), 49, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (116, 0, CAST(N'2021-03-10T00:00:00.000' AS DateTime), 49, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (117, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 51, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (118, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 51, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (119, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 52, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (120, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 52, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (121, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45, 2)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (122, 1, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 53, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (123, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 53, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (124, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (125, 1, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 54, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (126, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 54, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (127, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45, 1)
INSERT [dbo].[CovidTests] ([Id], [IsPositive], [TestDate], [FighterId], [IsolationBubbleId]) VALUES (128, 0, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 48, 2)
SET IDENTITY_INSERT [dbo].[CovidTests] OFF
GO
SET IDENTITY_INSERT [dbo].[Fighters] ON 

INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (44, N'Adrian', N'Buciuman', N'AdiB', N'adi', CAST(N'1999-02-10T00:00:00.000' AS DateTime), 70, 178)
INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (45, N'Daniel', N'Bancos', N'DaniB', N'dani', CAST(N'2000-07-05T00:00:00.000' AS DateTime), 80, 185)
INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (46, N'Robert', N'Calatoae', N'RobiC', N'robi', CAST(N'1999-09-29T00:00:00.000' AS DateTime), 74, 170)
INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (47, N'Dan', N'Anghel', N'DanA', N'dan', CAST(N'1999-06-14T00:00:00.000' AS DateTime), 68, 175)
INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (48, N'Tudor', N'Pop', N'TudorP', N'tudor', CAST(N'1999-11-10T00:00:00.000' AS DateTime), 84, 180)
INSERT [dbo].[Fighters] ([Id], [FirstName], [LastName], [Username], [Password], [Birthday], [Weight], [Height]) VALUES (49, N'Andrei', N'Stirbu', N'AndreiS', N'andrei', CAST(N'1999-11-18T00:00:00.000' AS DateTime), 72, 178)
SET IDENTITY_INSERT [dbo].[Fighters] OFF
GO
SET IDENTITY_INSERT [dbo].[Fights] ON 

INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (111, 44, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 44)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (112, 46, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 46)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (113, 44, 46, 15, CAST(N'2021-03-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (114, 45, 49, 15, CAST(N'2021-03-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (115, 45, 44, 15, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (116, 45, 46, 15, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (119, 44, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (120, 46, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 46)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (121, 44, 46, 15, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (131, 45, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[Fights] ([Id], [FighterId1], [FighterId2], [TournamentId], [FightTime], [WinnerId]) VALUES (132, 45, 44, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 44)
SET IDENTITY_INSERT [dbo].[Fights] OFF
GO
SET IDENTITY_INSERT [dbo].[Invites] ON 

INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (31, 44, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (32, 45, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (33, 46, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (34, 48, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (35, 47, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (36, 44, 17, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (37, 45, 17, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (38, 49, 15, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (39, 47, 18, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (40, 48, 18, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Invites] ([Id], [FighterId], [TournamentId], [DateSent], [InviteState]) VALUES (41, 48, 17, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Invites] OFF
GO
SET IDENTITY_INSERT [dbo].[IsolationBubbles] ON 

INSERT [dbo].[IsolationBubbles] ([Id], [Name]) VALUES (1, N'Cluj - Napoca')
INSERT [dbo].[IsolationBubbles] ([Id], [Name]) VALUES (2, N'Orastie')
INSERT [dbo].[IsolationBubbles] ([Id], [Name]) VALUES (3, N'Timisoara')
SET IDENTITY_INSERT [dbo].[IsolationBubbles] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [Username], [Password]) VALUES (5, N'Gabriel', N'Stancu', N'GabrielS', N'gabi')
INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [Username], [Password]) VALUES (6, N'Mircea', N'Tantau', N'MirceaT', N'mircea')
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[TournamentFighters] ON 

INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (29, 15, 45)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (30, 15, 44)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (31, 15, 46)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (32, 15, 47)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (33, 15, 48)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (34, 15, 49)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (35, 18, 47)
INSERT [dbo].[TournamentFighters] ([Id], [TournamentId], [FighterId]) VALUES (36, 17, 48)
SET IDENTITY_INSERT [dbo].[TournamentFighters] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([Id], [Name], [Location], [OrganizerId], [StartDate]) VALUES (15, N'UFC Orastie', N'Orastie', 5, CAST(N'2021-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Tournaments] ([Id], [Name], [Location], [OrganizerId], [StartDate]) VALUES (17, N'MMA Cluj-Napoca', N'Cluj-Napoca', 5, CAST(N'2021-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Tournaments] ([Id], [Name], [Location], [OrganizerId], [StartDate]) VALUES (18, N'UFC Cluj-Napoca', N'Cluj-Napoca', 5, CAST(N'2021-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tournaments] ([Id], [Name], [Location], [OrganizerId], [StartDate]) VALUES (25, N'MMA', N'Timisoara', 5, CAST(N'2021-03-28T04:19:19.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
GO
USE [master]
GO
ALTER DATABASE [FightClubDb] SET  READ_WRITE 
GO
