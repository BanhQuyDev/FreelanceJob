USE [master]
GO
/****** Object:  Database [FPTFreelanceJob]    Script Date: 6/23/2022 8:44:28 PM ******/
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
ALTER DATABASE [FPTFreelanceJob] SET  ENABLE_BROKER 
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
/****** Object:  UserDefinedFunction [dbo].[tvf-Date-Elapsed]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tvf-Date-Elapsed] (@D1 DateTime,@D2 DateTime)
Returns Table
Return (
    with cteBN(N)   as (Select 1 From (Values(1),(1),(1),(1),(1),(1),(1),(1),(1),(1)) N(N)),
         cteRN(R)   as (Select Row_Number() Over (Order By (Select NULL))-1 From cteBN a,cteBN b,cteBN c),
         cteYY(N,D) as (Select Max(R),Max(DateAdd(YY,R,@D1))From cteRN R Where DateAdd(YY,R,@D1)<=@D2),
         cteMM(N,D) as (Select Max(R),Max(DateAdd(MM,R,D))  From (Select Top 12 R From cteRN Order By 1) R, cteYY P Where DateAdd(MM,R,D)<=@D2),
         cteDD(N,D) as (Select Max(R),Max(DateAdd(DD,R,D))  From (Select Top 31 R From cteRN Order By 1) R, cteMM P Where DateAdd(DD,R,D)<=@D2),
         cteHH(N,D) as (Select Max(R),Max(DateAdd(HH,R,D))  From (Select Top 24 R From cteRN Order By 1) R, cteDD P Where DateAdd(HH,R,D)<=@D2),
         cteMI(N,D) as (Select Max(R),Max(DateAdd(MI,R,D))  From (Select Top 60 R From cteRN Order By 1) R, cteHH P Where DateAdd(MI,R,D)<=@D2),
         cteSS(N,D) as (Select Max(R),Max(DateAdd(SS,R,D))  From (Select Top 60 R From cteRN Order By 1) R, cteMI P Where DateAdd(SS,R,D)<=@D2)

    Select [Years]   = cteYY.N
          ,[Months]  = cteMM.N
          ,[Days]    = cteDD.N
          ,[Hours]   = cteHH.N
          ,[Minutes] = cteMI.N
          ,[Seconds] = cteSS.N
          --,[Elapsed] = Format(cteYY.N,'0000')+':'+Format(cteMM.N,'00')+':'+Format(cteDD.N,'00')+' '+Format(cteHH.N,'00')+':'+Format(cteMI.N,'00')+':'+Format(cteSS.N,'00')
     From  cteYY,cteMM,cteDD,cteHH,cteMI,cteSS
)
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblChat]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](255) NULL,
	[idUserSend] [int] NULL,
	[idUserReceive] [int] NULL,
	[create_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContract]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblEmployer]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblFreelancer]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblFreelancerSkill]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblJob]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJob](
	[id_job] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[salary] [float] NOT NULL,
	[description] [nvarchar](max) NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobApplication]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobApplication](
	[id_application] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_application] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobReport]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobReport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_report] [nvarchar](2000) NULL,
	[id_job] [int] NULL,
	[id_user_report] [int] NOT NULL,
	[create_date] [datetime] NULL,
	[job_title] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobSkill]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblJobStatus]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblMajor]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblNotification]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[id_noti] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[id_status] [int] NULL,
	[id_sender] [int] NULL,
	[create_date] [datetime] NULL,
	[id_mode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_noti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotiStatus]    Script Date: 6/23/2022 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotiStatus](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkill]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblSkillByMajor]    Script Date: 6/23/2022 8:44:28 PM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/23/2022 8:44:28 PM ******/
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
SET IDENTITY_INSERT [dbo].[tblChat] ON 

INSERT [dbo].[tblChat] ([id], [message], [idUserSend], [idUserReceive], [create_time]) VALUES (6, N'hello', 4, 6, CAST(N'20:30:00' AS Time))
INSERT [dbo].[tblChat] ([id], [message], [idUserSend], [idUserReceive], [create_time]) VALUES (7, N'hello huy', 6, 4, CAST(N'20:31:00' AS Time))
INSERT [dbo].[tblChat] ([id], [message], [idUserSend], [idUserReceive], [create_time]) VALUES (8, N'khoe khong', 4, 6, CAST(N'20:32:00' AS Time))
INSERT [dbo].[tblChat] ([id], [message], [idUserSend], [idUserReceive], [create_time]) VALUES (9, N'nop bai code di', 4, 6, CAST(N'20:33:00' AS Time))
INSERT [dbo].[tblChat] ([id], [message], [idUserSend], [idUserReceive], [create_time]) VALUES (10, NULL, 4, 9, CAST(N'20:34:00' AS Time))
SET IDENTITY_INSERT [dbo].[tblChat] OFF
GO
SET IDENTITY_INSERT [dbo].[tblContract] ON 

INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (10, 6, 4, 30, 0, CAST(N'2022-06-15T21:20:57.297' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (11, 9, 4, 28, 0, CAST(N'2022-06-15T21:21:06.177' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (12, 6, 4, 27, 0, CAST(N'2022-06-16T13:27:07.480' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (13, 9, 6, 32, 0, CAST(N'2022-06-17T10:24:13.143' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (14, 9, 4, 29, 0, CAST(N'2022-06-17T14:36:36.453' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (15, 6, 4, 39, 0, CAST(N'2022-06-23T10:16:07.923' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (16, 6, 4, 40, 0, CAST(N'2022-06-23T10:46:20.090' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (17, 4, 6, 23, 0, CAST(N'2022-06-23T10:49:28.553' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (18, 9, 6, 34, 0, CAST(N'2022-06-23T11:12:17.107' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (19, 9, 6, 25, 0, CAST(N'2022-06-23T11:18:45.953' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (20, 9, 6, 26, 0, CAST(N'2022-06-23T11:21:08.993' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblContract] OFF
GO
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (1, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (4, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (6, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (9, N'Employer  ')
GO
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (1, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (4, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (6, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (9, N'Freelancer')
GO
SET IDENTITY_INSERT [dbo].[tblFreelancerSkill] ON 

INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (1, 6, 1)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (2, 6, 8)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (3, 1, 1)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (4, 1, 5)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (5, 1, 8)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (6, 1, 9)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (7, 1, 12)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (8, 1, 13)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (9, 1, 14)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (10, 6, 2)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (12, 9, 1)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (13, 9, 2)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (14, 9, 3)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (15, 4, 8)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (16, 4, 2)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (17, 4, 1)
INSERT [dbo].[tblFreelancerSkill] ([id], [id_freelancer], [id_skill]) VALUES (18, 4, 3)
SET IDENTITY_INSERT [dbo].[tblFreelancerSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJob] ON 

INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (23, N'Viết document môn swr', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 3, CAST(N'2022-06-23' AS Date), 4, 6, N'AI   ', CAST(N'2022-06-15T20:48:56.303' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (24, N'Làm topic môn swt appium', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-22' AS Date), 1, 6, N'AI   ', CAST(N'2022-06-15T20:50:10.387' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (25, N'Làm coursera môn swe', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-23' AS Date), 4, 6, N'EN   ', CAST(N'2022-06-15T20:51:16.253' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (26, N'Vẽ môn typo 2 ', 3000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-21' AS Date), 4, 6, N'GD   ', CAST(N'2022-06-15T20:53:20.130' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (27, N'Cần người làm midterm nhật 1', 100000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-18' AS Date), 4, 4, N'JP   ', CAST(N'2022-06-15T20:58:40.690' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (28, N'Làm midterm nhật 2 ', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-19' AS Date), 4, 4, N'JP   ', CAST(N'2022-06-15T20:59:23.340' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (29, N'Cần tìm lại nick facebook', 300000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 2, CAST(N'2022-06-18' AS Date), 4, 4, N'IA   ', CAST(N'2022-06-15T21:00:01.837' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (30, N'Hack fb thầy hoàng ', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-21' AS Date), 4, 4, N'IA   ', CAST(N'2022-06-15T21:00:32.310' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (32, N'Test 2', 1000000, N'test', 10, CAST(N'2022-06-19' AS Date), 4, 6, N'GD   ', CAST(N'2022-06-16T13:41:28.970' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (33, N'Data Analyst Dashboard', 1000000, N'ok', 10, CAST(N'2022-06-18' AS Date), 2, 6, N'AI   ', CAST(N'2022-06-17T17:43:34.333' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (34, N'Thiết kế trang web bằng Wordpress', 1000000, N'ok', 10, CAST(N'2022-06-30' AS Date), 4, 6, N'SE   ', CAST(N'2022-06-17T17:50:12.173' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (35, N'Cắt layout HTML', 100000, N'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 5, CAST(N'2022-06-23' AS Date), 1, 9, N'GD   ', CAST(N'2022-06-17T20:28:03.023' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (36, N'Dịch bài viết tiếng nhật', 300000, N'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-29' AS Date), 2, 9, N'JP   ', CAST(N'2022-06-17T20:28:39.060' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (37, N'Vẽ logo brand freelance job', 400000, N'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 4, CAST(N'2022-06-24' AS Date), 2, 9, N'GD   ', CAST(N'2022-06-17T20:29:22.767' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (38, N'Chụp ảnh concept ca sỹ', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 2, CAST(N'2022-06-19' AS Date), 2, 4, N'MC   ', CAST(N'2022-06-17T20:49:46.683' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (39, N'Đi học nha poaiiiii', 1000000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 2, CAST(N'2022-06-18' AS Date), 2, 4, N'MK   ', CAST(N'2022-06-17T20:50:21.770' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (40, N'Viết tiểu luận bằng tiếng anh ', 300000, N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 3, CAST(N'2022-06-25' AS Date), 4, 4, N'IB   ', CAST(N'2022-06-17T20:51:12.597' AS DateTime))
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date]) VALUES (41, N'Job làm project ', 1000000, N'<p><strong>l&agrave;m project lost and found</strong></p>

<p><strong>c<sup>2</sup></strong></p>
', 10, CAST(N'2022-06-25' AS Date), 2, 6, N'MC   ', CAST(N'2022-06-23T15:10:08.983' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblJob] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobApplication] ON 

INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (24, 9, 30, 0, CAST(N'2022-06-15T21:19:37.640' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (25, 9, 28, 1, CAST(N'2022-06-15T21:19:50.590' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (26, 6, 30, 1, CAST(N'2022-06-15T21:20:10.323' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (27, 6, 29, 0, CAST(N'2022-06-15T21:20:18.557' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (28, 6, 27, 1, CAST(N'2022-06-15T22:40:34.963' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (29, 4, 23, 1, CAST(N'2022-06-16T13:19:27.023' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (30, 9, 32, 1, CAST(N'2022-06-16T13:43:34.750' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (31, 9, 29, 1, CAST(N'2022-06-17T14:36:05.697' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (32, 9, 34, 1, CAST(N'2022-06-17T20:21:39.660' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (33, 9, 33, NULL, CAST(N'2022-06-17T20:21:46.107' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (34, 9, 25, 1, CAST(N'2022-06-17T20:21:52.520' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (35, 9, 24, NULL, CAST(N'2022-06-17T20:26:40.580' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (36, 4, 35, NULL, CAST(N'2022-06-17T20:33:19.307' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (38, 4, 24, NULL, CAST(N'2022-06-17T20:35:07.160' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (39, 6, 40, 1, CAST(N'2022-06-18T09:36:41.250' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (40, 6, 36, NULL, CAST(N'2022-06-18T10:10:22.760' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (41, 6, 38, NULL, CAST(N'2022-06-18T10:10:42.743' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (42, 6, 37, NULL, CAST(N'2022-06-22T09:36:33.183' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (43, 9, 40, 0, CAST(N'2022-06-22T09:36:48.333' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (44, 9, 26, 1, CAST(N'2022-06-22T09:37:29.427' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (45, 6, 39, 1, CAST(N'2022-06-23T10:15:03.787' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (46, 4, 26, 0, CAST(N'2022-06-23T10:47:38.237' AS DateTime))
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date]) VALUES (47, 4, 41, NULL, CAST(N'2022-06-23T15:13:13.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblJobApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobReport] ON 

INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (1, N'xàm', 40, 6, CAST(N'2022-06-22T09:35:21.937' AS DateTime), N'Viết tiểu luận bằng tiếng anh ')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (2, N'Job xàm', 37, 6, CAST(N'2022-06-22T09:36:27.187' AS DateTime), N'Vẽ logo brand freelance job')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (3, N'employer bịp', 40, 9, CAST(N'2022-06-22T09:37:16.617' AS DateTime), N'Viết tiểu luận bằng tiếng anh ')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (4, N'ok', 26, 9, CAST(N'2022-06-22T09:37:37.193' AS DateTime), N'Vẽ môn typo 2 ')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (5, N'tào lao', 26, 4, CAST(N'2022-06-23T10:47:48.413' AS DateTime), N'Vẽ môn typo 2 ')
SET IDENTITY_INSERT [dbo].[tblJobReport] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobSkill] ON 

INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (114, 1, 24)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (115, 2, 24)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (116, 3, 24)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (117, 11, 25)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (118, 12, 25)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (119, 13, 25)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (120, 1, 26)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (121, 2, 26)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (122, 3, 26)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (123, 4, 26)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (124, 5, 26)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (125, 1, 27)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (126, 2, 27)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (127, 3, 27)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (128, 29, 28)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (129, 9, 29)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (130, 10, 29)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (131, 11, 29)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (132, 3, 30)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (133, 4, 30)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (134, 5, 30)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (141, 6, 32)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (142, 7, 32)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (143, 8, 32)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (150, 1, 23)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (151, 2, 23)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (152, 3, 23)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (158, 2, 34)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (159, 4, 34)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (160, 1, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (161, 2, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (162, 3, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (163, 1, 35)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (164, 2, 35)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (165, 3, 35)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (166, 15, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (167, 16, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (168, 17, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (169, 4, 37)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (170, 5, 37)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (171, 1, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (172, 2, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (173, 3, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (174, 19, 39)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (175, 20, 39)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (176, 21, 39)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (177, 3, 40)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (178, 4, 40)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (179, 5, 40)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (180, 1, 41)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (181, 3, 41)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (182, 4, 41)
SET IDENTITY_INSERT [dbo].[tblJobSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobStatus] ON 

INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (1, N'Spam')
INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (2, N'Posted')
INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (3, N'Updated')
INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (4, N'Applied')
SET IDENTITY_INSERT [dbo].[tblJobStatus] OFF
GO
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'AI   ', N'Artificial intelligence', N'https://cdn-icons-png.flaticon.com/512/1693/1693894.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'EN   ', N'English linguistics', N'https://cdn-icons-png.flaticon.com/512/5388/5388698.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'GD   ', N'Graphic design', N'https://cdn-icons-png.flaticon.com/512/2779/2779775.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'IA   ', N'Information assurance', N'https://as2.ftcdn.net/v2/jpg/04/17/87/83/1000_F_417878342_a2J6ZrAT46YvZjUm5W9LPNXZVQYAeqs5.jpg')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'IB   ', N'International business', N'https://cdn-icons-png.flaticon.com/512/609/609120.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'JP   ', N'Japanese linguistics', N'https://as2.ftcdn.net/v2/jpg/01/91/97/31/1000_F_191973173_x7cswOU1nsrBnzxbz4TfjhE8o31pgJPT.jpg')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'MC   ', N'Multimedia communication', N'https://cdn-icons-png.flaticon.com/512/1055/1055662.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'MK   ', N'Marketing', N'https://cdn-icons-png.flaticon.com/512/1055/1055669.png')
INSERT [dbo].[tblMajor] ([id_major], [major_name], [img_major]) VALUES (N'SE   ', N'Software Engineering', N'https://cdn-icons-png.flaticon.com/512/1688/1688400.png')
GO
SET IDENTITY_INSERT [dbo].[tblNotification] ON 

INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (2, 8, N'Cắt layout was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (9, 8, N'Làm assignment PRJ301 was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (10, 8, N'Thi dùm FE  SWE was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (11, 8, N'Viết document môn swrr was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (12, 8, N'Viết document môn swr was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (13, 8, N'Viết document môn swr was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (14, 8, N'Viết document môn swr was updated by Doan Vu Quang Huy', 1, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (15, 8, N'test report', 3, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (16, 8, N'test', 3, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (17, 8, N'gÃ ', 3, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (18, 8, N'test', 3, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (19, 8, N'được lunn', 3, NULL, NULL, NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (20, 6, N'approved a job Viết tiểu luận bằng tiếng anh ', 3, 4, CAST(N'2022-06-23T10:46:20.047' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (21, 9, N'rejected a job Viết tiểu luận bằng tiếng anh ', 3, 4, CAST(N'2022-06-23T10:46:20.073' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (22, 6, N'applied a the job Vẽ môn typo 2 ', 2, 4, CAST(N'2022-06-23T10:47:38.320' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (23, 4, N'approved a job Viết document môn swr', 3, 6, CAST(N'2022-06-23T10:49:28.570' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (24, 9, N'approved a job Thiết kế trang web bằng Wordpress', 3, 6, CAST(N'2022-06-23T11:12:17.127' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (25, 9, N'approved a job Làm coursera môn swe', 3, 6, CAST(N'2022-06-23T11:18:45.970' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (26, 9, N'approved a job Vẽ môn typo 2 ', 3, 6, CAST(N'2022-06-23T11:21:08.940' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (27, 4, N'rejected a job Vẽ môn typo 2 ', 3, 6, CAST(N'2022-06-23T11:21:08.977' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (28, 6, N'applied a the job Job làm project ', 2, 4, CAST(N'2022-06-23T15:13:13.780' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tblNotification] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNotiStatus] ON 

INSERT [dbo].[tblNotiStatus] ([id_status], [status_name]) VALUES (1, N'Update')
INSERT [dbo].[tblNotiStatus] ([id_status], [status_name]) VALUES (2, N'Read')
INSERT [dbo].[tblNotiStatus] ([id_status], [status_name]) VALUES (3, N'Unread')
SET IDENTITY_INSERT [dbo].[tblNotiStatus] OFF
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
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (6, N'Doan Vu Quang Huy', N'huydvqse151224@fpt.edu.vn', CAST(N'2001-10-06' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0909563182          ', N'https://lh3.googleusercontent.com/a-/AOh14GjA10ilxjaK-ex8IUmwOVHzNmx7yhwDjoZ22GND3Q=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (8, N'Nguyen Trong Nguyen Vũ', N'vuntnse151234@fpt.edu.vn', NULL, N'FPT University HCMC', N'Happy code - Happy money - Happy life', NULL, N'https://lh3.googleusercontent.com/a-/AOh14GhAIUdYRS2050BOcaNbCpCozTLnqpxKlqT1DWm1=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (9, N'Nguyen Quoc Sy (K15 HCM)', N'synqse151029@fpt.edu.vn', CAST(N'2022-06-16' AS Date), N'FPT University Address', N'Happy Code - Happy Money - Happy Life', N'0909563111          ', N'https://lh3.googleusercontent.com/a-/AOh14GjXYEr6kKhobEJZPMKBxGjgLTQsUKsdbbuPxb19=s96-c', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__AB6E6164EAACBA9D]    Script Date: 6/23/2022 8:44:29 PM ******/
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
ALTER TABLE [dbo].[tblJobApplication] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblJobReport] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblNotification] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD FOREIGN KEY([id_admin])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblChat]  WITH CHECK ADD  CONSTRAINT [FK_chatuserreceive] FOREIGN KEY([idUserReceive])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblChat] CHECK CONSTRAINT [FK_chatuserreceive]
GO
ALTER TABLE [dbo].[tblChat]  WITH CHECK ADD  CONSTRAINT [FK_chatusersend] FOREIGN KEY([idUserSend])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblChat] CHECK CONSTRAINT [FK_chatusersend]
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
ALTER TABLE [dbo].[tblJobReport]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[tblNotiStatus] ([id_status])
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
