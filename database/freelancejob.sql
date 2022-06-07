USE [master]
GO
/****** Object:  Database [FPTFreelanceJob]    Script Date: 6/7/2022 3:16:52 PM ******/
CREATE DATABASE [FPTFreelanceJob]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTFreelanceJob', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTFreelanceJob.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTFreelanceJob_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTFreelanceJob_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTFreelanceJob] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTFreelanceJob].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTFreelanceJob] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTFreelanceJob] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTFreelanceJob] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTFreelanceJob] SET  MULTI_USER 
GO
ALTER DATABASE [FPTFreelanceJob] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTFreelanceJob] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTFreelanceJob] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTFreelanceJob] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTFreelanceJob] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTFreelanceJob] SET QUERY_STORE = OFF
GO
USE [FPTFreelanceJob]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[id_admin] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContract]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContract](
	[id_contract] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_employer] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployer]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployer](
	[id_employer] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_employer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[id_feedback] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[rating] [int] NULL,
	[id_freelancer] [int] NOT NULL,
	[id_employer] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_feedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFreelancer]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFreelancer](
	[id_freelancer] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_freelancer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFreelancerSkill]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFreelancerSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_skill] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJob]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJob](
	[id_job] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[salary] [float] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[duration] [float] NULL,
	[start_date] [date] NULL,
	[id_status] [int] NULL,
	[id_employer] [int] NULL,
	[id_major] [char](5) NOT NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_job] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobApplication]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobApplication](
	[id_application] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_application] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobSkill]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_skill] [int] NULL,
	[id_job] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobStatus]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobStatus](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMajor]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMajor](
	[id_major] [char](5) NOT NULL,
	[major_name] [nvarchar](255) NOT NULL,
	[img_major] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[id_noti] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_noti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkill]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkill](
	[id_skill] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkillByMajor]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkillByMajor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_major] [char](5) NOT NULL,
	[id_skill] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/7/2022 3:16:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[dob] [date] NULL,
	[address] [nvarchar](255) NULL,
	[bio] [nvarchar](3000) NULL,
	[phone] [char](20) NULL,
	[avatar] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAdmin] ([id_admin], [type]) VALUES (8, N'Admin     ')
GO
SET IDENTITY_INSERT [dbo].[tblContract] ON 

INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (1, 4, 1, 1, 0, CAST(N'2022-06-06T21:57:56.100' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (2, 6, 4, 6, 1, CAST(N'2022-06-06T23:55:58.053' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (3, 4, 6, 6, 0, CAST(N'2022-06-07T08:44:44.943' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (4, 1, 6, 19, 0, CAST(N'2022-06-07T13:03:48.213' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (5, 1, 6, 1, 0, CAST(N'2022-06-07T14:05:03.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblContract] OFF
GO
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (1, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (4, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (6, N'Employer  ')
GO
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (1, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (4, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (6, N'Freelancer')
GO
SET IDENTITY_INSERT [dbo].[tblFreelancerSkill] ON 

INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (1, 6, 1)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (2, 6, 8)
SET IDENTITY_INSERT [dbo].[tblFreelancerSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJob] ON 

INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (1, N'Thi dùm fe SWE', 1000000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 1, CAST(N'2022-05-30' AS Date), 2, 6, N'SE   ', CAST(N'2022-06-03T08:59:08.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (6, N'Làm assignment PRJ301', 1000000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 2, CAST(N'2022-05-30' AS Date), 1, 6, N'SE   ', CAST(N'2022-06-03T08:59:08.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (7, N'Cắt layout', 1000000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 1, CAST(N'2022-06-01' AS Date), 1, 6, N'GD   ', CAST(N'2022-06-03T08:59:08.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (8, N'Làm tiểu luận cuối kì', 1000000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 5, CAST(N'2022-06-20' AS Date), 2, 4, N'SE   ', CAST(N'2022-06-03T08:59:08.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (17, N'SWE', 1000000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 1, CAST(N'2022-06-23' AS Date), 2, 1, N'SE   ', CAST(N'2022-06-03T08:59:08.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (18, N'Vẽ nhân vật anime ', 100000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page,', 10, CAST(N'2022-06-05' AS Date), 2, 6, N'GD   ', CAST(N'2022-06-05T09:01:34.303' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (19, N'Viết New LUK', 100000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 10, CAST(N'2022-06-06' AS Date), 2, 6, N'AI   ', CAST(N'2022-06-06T20:33:00.033' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (20, N'test post job', 100000, N'test', 2, CAST(N'2022-06-09' AS Date), 2, 6, N'EN   ', CAST(N'2022-06-07T13:09:17.147' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblJob] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobApplication] ON 

INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (2, 4, 1, 0)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (3, 4, 6, 1)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (4, 1, 6, 0)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (5, 1, 7, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (6, 4, 7, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (7, 1, 8, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (8, 6, 8, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (9, 4, 17, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (10, 6, 17, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (11, 1, 18, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (12, 4, 18, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (13, 1, 19, 1)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (14, 4, 19, 0)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (15, 6, 17, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (17, 6, 19, 0)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (19, 6, 1, NULL)
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status]) VALUES (20, 6, 8, NULL)
SET IDENTITY_INSERT [dbo].[tblJobApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobSkill] ON 

INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (2, 2, 1)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (3, 1, 6)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (4, 5, 6)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (5, 12, 6)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (6, 13, 6)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (7, 10, 18)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (8, 11, 18)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (9, 12, 18)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (10, 1, 19)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (11, 2, 19)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (12, 3, 19)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (13, 1, 20)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (14, 2, 20)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (15, 3, 20)
SET IDENTITY_INSERT [dbo].[tblJobSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobStatus] ON 

INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (1, N'Spam')
INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (2, N'Posted')
SET IDENTITY_INSERT [dbo].[tblJobStatus] OFF
GO
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'AI   ', N'Artificial intelligence', N'https://cdn-icons-png.flaticon.com/512/1693/1693894.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'EN   ', N'English linguistics', N'https://cdn-icons.flaticon.com/png/512/4964/premium/4964022.png?token=exp=1654523843~hmac=4beab6a3f64b7f12ba01522f4c8ab2d1')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'GD   ', N'Graphic design', N'https://cdn-icons-png.flaticon.com/512/2779/2779775.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'IA   ', N'Information assurance', N'https://as2.ftcdn.net/v2/jpg/04/17/87/83/1000_F_417878342_a2J6ZrAT46YvZjUm5W9LPNXZVQYAeqs5.jpg')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'IB   ', N'International business', N'https://cdn-icons-png.flaticon.com/512/609/609120.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'JP   ', N'Japanese linguistics', N'https://as2.ftcdn.net/v2/jpg/01/91/97/31/1000_F_191973173_x7cswOU1nsrBnzxbz4TfjhE8o31pgJPT.jpg')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'MC   ', N'Multimedia communication', N'https://cdn-icons-png.flaticon.com/512/1055/1055662.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'MK   ', N'Marketing', N'https://cdn-icons.flaticon.com/png/512/2518/premium/2518048.png?token=exp=1654524315~hmac=05381112954569ffb07ab49488be0fcd')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'SE   ', N'Software Engineering', N'https://cdn-icons.flaticon.com/png/512/3242/premium/3242257.png?token=exp=1654524330~hmac=7c6f56d2230044da5106be60f5553dd8')
GO
SET IDENTITY_INSERT [dbo].[tblSkill] ON 

INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (1, N'Java')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (2, N'C#')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (3, N'C++')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (4, N'Python')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (5, N'SQL')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (6, N'Photoshop')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (7, N'Javascript')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (8, N'NodeJS')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (9, N'React')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (10, N'Angular')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (11, N'Spring Boot')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (12, N'HTML')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (13, N'CSS')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (14, N'MySQL')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (15, N'MongoDB')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (16, N'.NET')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (17, N'Azure')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (18, N'AWS')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (19, N'Adobe Illustrator')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (20, N'Adobe Indesgin')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (21, N'MS Office')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (22, N'Adobe Premiere')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (23, N'Copywriting')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (24, N'Planning')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (25, N'English to Vietnamese Translation')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (26, N'Power BI')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (27, N'R')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (28, N'VueJS')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (29, N'Japanese to Vietnamese Translation')
SET IDENTITY_INSERT [dbo].[tblSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSkillByMajor] ON 

INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (1, N'SE   ', 1)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (2, N'SE   ', 2)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (3, N'SE   ', 3)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (4, N'SE   ', 4)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (5, N'SE   ', 5)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (6, N'SE   ', 7)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (7, N'SE   ', 8)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (8, N'SE   ', 9)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (9, N'SE   ', 10)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (10, N'SE   ', 11)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (11, N'SE   ', 12)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (12, N'SE   ', 13)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (13, N'SE   ', 14)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (14, N'SE   ', 15)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (15, N'SE   ', 16)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (16, N'SE   ', 17)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (17, N'SE   ', 18)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (18, N'SE   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (19, N'SE   ', 27)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (20, N'SE   ', 28)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (21, N'IA   ', 1)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (22, N'IA   ', 2)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (23, N'IA   ', 3)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (24, N'IA   ', 4)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (25, N'IA   ', 5)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (26, N'IA   ', 7)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (27, N'IA   ', 8)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (28, N'IA   ', 9)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (29, N'IA   ', 10)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (30, N'IA   ', 11)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (31, N'IA   ', 12)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (32, N'IA   ', 13)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (33, N'IA   ', 14)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (34, N'IA   ', 15)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (35, N'IA   ', 16)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (36, N'IA   ', 17)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (37, N'IA   ', 18)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (38, N'IA   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (39, N'IA   ', 27)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (40, N'IA   ', 28)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (41, N'AI   ', 1)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (42, N'AI   ', 2)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (43, N'AI   ', 3)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (46, N'AI   ', 4)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (47, N'AI   ', 5)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (48, N'AI   ', 6)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (49, N'AI   ', 7)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (50, N'AI   ', 8)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (51, N'AI   ', 9)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (52, N'AI   ', 10)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (53, N'AI   ', 11)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (54, N'AI   ', 12)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (55, N'AI   ', 13)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (56, N'AI   ', 14)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (57, N'AI   ', 15)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (58, N'AI   ', 16)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (59, N'AI   ', 17)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (60, N'AI   ', 18)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (61, N'AI   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (62, N'AI   ', 27)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (63, N'AI   ', 28)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (64, N'MC   ', 20)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (65, N'MC   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (66, N'MC   ', 22)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (67, N'MC   ', 23)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (68, N'MC   ', 24)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (69, N'MC   ', 26)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (71, N'MK   ', 19)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (72, N'MK   ', 20)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (73, N'MK   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (74, N'MK   ', 22)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (75, N'MK   ', 23)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (76, N'MK   ', 24)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (77, N'MK   ', 26)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (78, N'JP   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (79, N'JP   ', 29)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (80, N'EN   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (81, N'EN   ', 25)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (82, N'IB   ', 21)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (83, N'IB   ', 24)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (84, N'IB   ', 4)
INSERT [dbo].[tblSkillByMajor] ([id], [id_major], [id_skill]) VALUES (85, N'IB   ', 26)
SET IDENTITY_INSERT [dbo].[tblSkillByMajor] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (1, N'Nguyen Thanh Tung', N'tungntse151167@fpt.edu.vn', CAST(N'2001-09-16' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0868649875          ', N'https://lh3.googleusercontent.com/a-/AOh14Gg1FepAR0a7QPecGiCjewAkPlvViFlewVyhWbUJxQ=s96-c?fbclid=IwAR036LzOxBs-SpmPnBMZZ_iDemNUlOKhkiHqveIoSD1KCN_QW0mNpC-sfmU', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (4, N'Ngo Xuan Thiep', N'thiepnxse151074@fpt.edu.vn', CAST(N'2001-01-01' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0987654321          ', N'https://lh3.googleusercontent.com/a-/AOh14Gh0g7NnfVO8L3hUL8EvzgRM1Oxy_hBKx77HKrc4=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (6, N'Doan Vu Quang Huy', N'huydvqse151224@fpt.edu.vn', CAST(N'2001-10-06' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0909563183          ', N'https://lh3.googleusercontent.com/a-/AOh14GjA10ilxjaK-ex8IUmwOVHzNmx7yhwDjoZ22GND3Q=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (8, N'Nguyen Trong Nguyen Vũ', N'vuntnse151234@fpt.edu.vn', NULL, N'FPT University HCMC', N'Happy code - Happy money - Happy life', NULL, N'https://lh3.googleusercontent.com/a-/AOh14GhAIUdYRS2050BOcaNbCpCozTLnqpxKlqT1DWm1=s96-c', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__AB6E616496D77C0D]    Script Date: 6/7/2022 3:16:53 PM ******/
ALTER TABLE [dbo].[tblUser] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdmin] ADD  DEFAULT ('Admin') FOR [type]
GO
ALTER TABLE [dbo].[tblContract] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblEmployer] ADD  DEFAULT ('Employer') FOR [type]
GO
ALTER TABLE [dbo].[tblFreelancer] ADD  DEFAULT ('Freelancer') FOR [type]
GO
ALTER TABLE [dbo].[tblJob] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD FOREIGN KEY([id_admin])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblEmployer]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblFreelancer]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblFreelancerSkill]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblFreelancerSkill]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_major])
REFERENCES [dbo].[tblMajor] ([id_major])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[tblJobStatus] ([id_status])
GO
ALTER TABLE [dbo].[tblJobApplication]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblJobApplication]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblSkillByMajor]  WITH CHECK ADD FOREIGN KEY([id_major])
REFERENCES [dbo].[tblMajor] ([id_major])
GO
ALTER TABLE [dbo].[tblSkillByMajor]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD CHECK  (([rating]>=(0) OR [rating]<=(5)))
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD CHECK  (([salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [FPTFreelanceJob] SET  READ_WRITE 
GO
