USE [master]
GO
/****** Object:  Database [FPTFreelanceJob]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[tvf-Date-Elapsed]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblChat]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblContract]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblEmployer]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblFreelancer]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblFreelancerSkill]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblJob]    Script Date: 8/4/2022 9:37:57 AM ******/
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
	[payment_status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_job] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobApplication]    Script Date: 8/4/2022 9:37:57 AM ******/
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
	[note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_application] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobReport]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblJobSkill]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblJobStatus]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblMajor]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblMilestone]    Script Date: 8/4/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMilestone](
	[id_milestone] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](255) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[status] [bit] NULL,
	[id_job] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_milestone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblNotiStatus]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblSkill]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblSkillByMajor]    Script Date: 8/4/2022 9:37:57 AM ******/
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
/****** Object:  Table [dbo].[tblStorage]    Script Date: 8/4/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStorage](
	[id_file] [int] IDENTITY(1,1) NOT NULL,
	[urlS3] [nvarchar](255) NULL,
	[id_job] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_file] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 8/4/2022 9:37:57 AM ******/
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
	[balance] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAdmin] ([id_admin], [type]) VALUES (8, N'Admin     ')
GO
SET IDENTITY_INSERT [dbo].[tblContract] ON 

INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (18, 9, 6, 34, 1, CAST(N'2022-06-23T11:12:17.107' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (21, 4, 6, 41, 1, CAST(N'2022-06-26T01:21:46.620' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (22, 1, 4, 38, 1, CAST(N'2022-06-27T22:18:03.620' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (24, 1, 6, 33, 1, CAST(N'2022-07-04T12:54:17.430' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (29, 6, 4, 42, 1, CAST(N'2022-07-16T14:23:00.833' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (30, 6, 4, 50, 1, CAST(N'2022-07-16T17:06:11.193' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (31, 6, 1, 43, 1, CAST(N'2022-07-31T10:10:50.750' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (32, 4, 6, 51, 1, CAST(N'2022-07-31T12:17:43.247' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (33, 6, 9, 37, 0, CAST(N'2022-07-31T14:07:33.057' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (34, 1, 9, 36, 0, CAST(N'2022-07-31T14:07:44.593' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (35, 4, 6, 60, 0, CAST(N'2022-07-31T18:04:47.637' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (36, 6, 1, 52, 1, CAST(N'2022-07-31T21:15:16.813' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (37, 6, 1, 55, 0, CAST(N'2022-07-31T21:15:26.043' AS DateTime))
INSERT [dbo].[tblContract] ([id_contract], [id_freelancer], [id_employer], [id_job], [status], [create_date]) VALUES (38, 6, 1, 44, 0, CAST(N'2022-08-01T10:00:09.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblContract] OFF
GO
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (1, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (4, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (6, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (9, N'Employer  ')
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (21, N'Good job', 5, 6, 4, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (23, N'Anh ấy rất đúng deadline', 5, 6, 1, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (24, N'Greate', 4, 6, 9, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (25, N'Amazing good job', 5, 6, 9, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (26, N'Tuyệt vời quá ', 5, 4, 6, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (27, N'Not bad', 3, 4, 1, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (28, N'Good', 4, 4, 9, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (29, N'Freelance này uy tín giỏi', 5, 1, 9, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (30, N'Freelancer này gà quá', 2, 1, 6, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (31, N'Thằng này xạo đó', 1, 9, 6, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (32, N'nice xừ', 5, 6, 1, 1)
INSERT [dbo].[tblFeedback] ([id_feedback], [content], [rating], [id_freelancer], [id_employer], [status]) VALUES (33, N'làm tốt lắm', 5, 6, 1, 1)
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
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

INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (33, N'Data Analyst Dashboard', 1000000, N'ok', 10, CAST(N'2022-06-18' AS Date), 4, 6, N'AI   ', CAST(N'2022-06-17T17:43:34.333' AS DateTime), 0)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (34, N'Thiết kế trang web bằng Wordpress', 1000000, N'<p>Cần bạn lập tr&igrave;nh vi&ecirc;n c&oacute; &gt;3 năm kinh nghiệm, c&oacute; kỹ năng lập tr&igrave;nh, tư duy sản phẩm tốt, cụ thể:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm lập tr&igrave;nh tr&ecirc;n ABP.IO framework</p>

<p>- Khả năng phối hợp code giữa ABP.IO framework kết hợp với thư viện js font-end để thực hiện c&aacute;c chức năng web theo đặc tả.</p>

<p>- C&oacute; kinh nghiệm code web function, UI c&oacute; nhiều tương t&aacute;c v&agrave; nghiệp vụ.</p>
', 10, CAST(N'2022-06-30' AS Date), 4, 6, N'SE   ', CAST(N'2022-06-17T17:50:12.173' AS DateTime), 0)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (36, N'Dịch bài viết tiếng nhật', 300000, N'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 10, CAST(N'2022-06-29' AS Date), 4, 9, N'JP   ', CAST(N'2022-06-17T20:28:39.060' AS DateTime), 0)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (37, N'Vẽ logo brand freelance job', 400000, N'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', 4, CAST(N'2022-06-24' AS Date), 4, 9, N'GD   ', CAST(N'2022-06-17T20:29:22.767' AS DateTime), 0)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (38, N'Chụp ảnh concept ca sỹ', 1000000, N'<p>B&ecirc;n m&igrave;nh kinh doanh Brand thời trang nữ cần hợp t&aacute;c với 1 nữ Photophone. Thời gian l&agrave;m việc: 1-2 buổi s&aacute;ng trong tuần.</p>

<p>Y&ecirc;u cầu:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm chụp / quay thời trang nữ + flatlay sản phẩm;</p>

<p>- Chỉnh ảnh cơ bản + edit video cơ bản;</p>

<p>- Chủ động, vui vẻ, l&agrave;m việc tr&aacute;ch nhiệm.</p>

<p>Li&ecirc;n hệ m&igrave;nh + gửi ảnh / video đ&atilde; từng thực hiện nh&eacute;</p>
', 20, CAST(N'2022-07-31' AS Date), 4, 4, N'MC   ', CAST(N'2022-06-17T20:49:46.683' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (41, N'Viết trang web bằng php', 1000000, N'<p>M&igrave;nh muốn tạo một trang web c&oacute; chức năng đăng nhập, đăng k&yacute;, thanh to&aacute;n, ph&acirc;n quyền người d&ugrave;ng, tạo điểm cho th&agrave;nh vi&ecirc;n, sẽ trừ điểm khi sử dụng dịch vụ tr&ecirc;n web.</p>

<p>Y&ecirc;u cầu l&agrave;m việc tỉ mỉ chăm chỉ ch&iacute;nh x&aacute;c. ho&agrave;n th&agrave;nh đ&uacute;ng hạn, Code sạch. tinh gọn.</p>

<p>ng&ocirc;n ngữ php html js ...</p>
', 10, CAST(N'2022-07-31' AS Date), 4, 6, N'IA   ', CAST(N'2022-06-23T15:10:08.983' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (42, N'Cần làm luận văn SE', 1000000, N'<p>B&ecirc;n m&igrave;nh kinh doanh Brand thời trang nữ cần hợp t&aacute;c với 1 nữ Photophone. Thời gian l&agrave;m việc: 1-2 buổi s&aacute;ng trong tuần.</p>

<p>Y&ecirc;u cầu:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm chụp / quay thời trang nữ + flatlay sản phẩm;</p>

<p>- Chỉnh ảnh cơ bản + edit video cơ bản;</p>

<p>- Chủ động, vui vẻ, l&agrave;m việc tr&aacute;ch nhiệm.</p>

<p>Li&ecirc;n hệ m&igrave;nh + gửi ảnh / video đ&atilde; từng thực hiện nh&eacute;</p>
', 10, CAST(N'2022-08-04' AS Date), 4, 4, N'MK   ', CAST(N'2022-06-27T21:38:13.573' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (43, N'Hỗ trợ truyền thông event', 300000, N'<p><strong>T&ecirc;n c&ocirc;ng ty: C&ocirc;ng ty TNHH kỹ thuật số T&acirc;m Đạt</strong></p>

<p><strong>Thương hiệu cần l&agrave;m logo</strong>: In T&Acirc;M ĐẠT</p>

<p><strong>Website</strong>: intamdat.com (web đang trong qu&aacute; tr&igrave;nh x&acirc;y dựng)</p>

<p><strong>Ng&agrave;nh nghề</strong>: in ấn (in tem nh&atilde;n, In decal, in sticker, tờ rơi, tờ gấp, card visit, catalogue .v.v...)</p>

<p><strong>Kiểu d&aacute;ng</strong>: Đơn giản, hiện đại, s&aacute;ng tạo.</p>

<p><strong>M&agrave;u sắc nhận diện</strong>: Theo hệ m&agrave;u CMYK hoặc c&aacute;c bạn tự chọn m&agrave;u kh&aacute;c thể hiện được t&iacute;nh hiện đại, s&aacute;ng tạo, năng động, chuy&ecirc;n nghiệp, lấy kh&aacute;ch h&agrave;ng l&agrave;m trọng t&acirc;m.</p>

<p><strong>Slogan</strong>: N&acirc;ng Tầm Nh&atilde;n Hiệu Việt</p>

<p><strong>Độ tuổi kh&aacute;ch h&agrave;ng</strong>: 24 - 45 tuổi</p>

<p><strong>Y&ecirc;u cầu kh&aacute;c</strong>: Thiết kế logo đơn giản, hiện đại, s&aacute;ng tạo, dễ nhận diện thương hiệu, ấn tượng. Đội ngũ l&agrave;m việc t&acirc;m huyết, lấy kh&aacute;ch h&agrave;ng l&agrave;m trọng t&acirc;m, mang lại trải nghiệm dịch vụ/ sản phẩm tốt nhất cho kh&aacute;ch h&agrave;ng.</p>
', 5, CAST(N'2022-06-28' AS Date), 4, 1, N'MC   ', CAST(N'2022-06-27T21:41:27.187' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (44, N'Viết bài tiếng anh cho website du lịch', 3000000, N'<p>Xin ch&agrave;o c&aacute;c bạn,</p>

<p>M&igrave;nh muốn t&igrave;m 1 bạn viết gi&uacute;p m&igrave;nh 4 b&agrave;i du lịch bằng tiếng anh về 1 địa điểm ở Việt Nam (How to get to, When is the best time to visit, Best places to visit..) . Viết tốt sẽ thu&ecirc; tiếp.</p>

<p>Y&ecirc;u cầu cụ thể về năng lực:</p>

<p>- Ưu cầu c&aacute;c bạn c&oacute; kinh nghiệm viết b&agrave;i 6 th&aacute;ng trở l&ecirc;n</p>

<p>- Văn phong mạch lạc, c&oacute; tư duy logic trong tr&igrave;nh b&agrave;y &yacute; tưởng của b&agrave;i viết</p>

<p>- C&oacute; khả năng research nghi&ecirc;n cứu th&ocirc;ng tin</p>

<p>- Đ&uacute;ng ngữ ph&aacute;p, kh&ocirc;ng bị tr&ugrave;ng lặp nội dung, kh&ocirc;ng copy từ c&aacute;c website kh&aacute;c tr&ecirc;n internet, kh&ocirc;ng spin nội dung, kh&ocirc;ng PARAPHRASE</p>

<p>Th&ugrave; Lao v&agrave; thanh to&aacute;n</p>

<p>-Mức rate 18k/100 từ</p>

<p>-Viết xong nghiệm thu thanh to&aacute;n lu&ocirc;n.</p>
', 10, CAST(N'2022-08-01' AS Date), 4, 1, N'EN   ', CAST(N'2022-06-27T21:42:26.433' AS DateTime), 0)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (50, N'Chụp ảnh, quay clip cho Brand thời trang nữ', 4000000, N'<p>B&ecirc;n m&igrave;nh kinh doanh Brand thời trang nữ cần hợp t&aacute;c với 1 nữ Photophone. Thời gian l&agrave;m việc: 1-2 buổi s&aacute;ng trong tuần.</p>

<p>Y&ecirc;u cầu:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm chụp / quay thời trang nữ + flatlay sản phẩm;</p>

<p>- Chỉnh ảnh cơ bản + edit video cơ bản;</p>

<p>- Chủ động, vui vẻ, l&agrave;m việc tr&aacute;ch nhiệm.</p>

<p>Li&ecirc;n hệ m&igrave;nh + gửi ảnh / video đ&atilde; từng thực hiện nh&eacute;</p>
', 10, CAST(N'2022-07-31' AS Date), 4, 4, N'IA   ', CAST(N'2022-07-16T17:00:58.397' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (51, N'Code module web sử dụng ABP.IO', 1000000, N'<p>Cần bạn lập tr&igrave;nh vi&ecirc;n c&oacute; &gt;3 năm kinh nghiệm, c&oacute; kỹ năng lập tr&igrave;nh, tư duy sản phẩm tốt, cụ thể:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm lập tr&igrave;nh tr&ecirc;n ABP.IO framework</p>

<p>- Khả năng phối hợp code giữa ABP.IO framework kết hợp với thư viện js font-end để thực hiện c&aacute;c chức năng web theo đặc tả.</p>

<p>- C&oacute; kinh nghiệm code web function, UI c&oacute; nhiều tương t&aacute;c v&agrave; nghiệp vụ.</p>
', 20, CAST(N'2022-07-31' AS Date), 4, 6, N'SE   ', CAST(N'2022-07-31T12:10:20.690' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (52, N'Thiết kế logo IN ẤN', 3000000, N'<p><strong>T&ecirc;n c&ocirc;ng ty: C&ocirc;ng ty TNHH kỹ thuật số T&acirc;m Đạt</strong></p>

<p><strong>Thương hiệu cần l&agrave;m logo</strong>: In T&Acirc;M ĐẠT</p>

<p><strong>Website</strong>: intamdat.com (web đang trong qu&aacute; tr&igrave;nh x&acirc;y dựng)</p>

<p><strong>Ng&agrave;nh nghề</strong>: in ấn (in tem nh&atilde;n, In decal, in sticker, tờ rơi, tờ gấp, card visit, catalogue .v.v...)</p>

<p><strong>Kiểu d&aacute;ng</strong>: Đơn giản, hiện đại, s&aacute;ng tạo.</p>

<p><strong>M&agrave;u sắc nhận diện</strong>: Theo hệ m&agrave;u CMYK hoặc c&aacute;c bạn tự chọn m&agrave;u kh&aacute;c thể hiện được t&iacute;nh hiện đại, s&aacute;ng tạo, năng động, chuy&ecirc;n nghiệp, lấy kh&aacute;ch h&agrave;ng l&agrave;m trọng t&acirc;m.</p>

<p><strong>Slogan</strong>: N&acirc;ng Tầm Nh&atilde;n Hiệu Việt</p>

<p><strong>Độ tuổi kh&aacute;ch h&agrave;ng</strong>: 24 - 45 tuổi</p>

<p><strong>Y&ecirc;u cầu kh&aacute;c</strong>: Thiết kế logo đơn giản, hiện đại, s&aacute;ng tạo, dễ nhận diện thương hiệu, ấn tượng. Đội ngũ l&agrave;m việc t&acirc;m huyết, lấy kh&aacute;ch h&agrave;ng l&agrave;m trọng t&acirc;m, mang lại trải nghiệm dịch vụ/ sản phẩm tốt nhất cho kh&aacute;ch h&agrave;ng.</p>
', 20, CAST(N'2022-08-01' AS Date), 4, 1, N'GD   ', CAST(N'2022-07-31T12:59:00.033' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (53, N'Biên tập nội dung cho kênh thông tin', 3000000, N'<p>- <strong>H&igrave;nh thức</strong>: l&agrave;m việc online</p>

<p>- <strong>KPI</strong>: tối thiểu 2 b&agrave;i/ng&agrave;y (Với c&aacute;c b&agrave;i 1000 chữ)</p>

<p>- Viết content website cho k&ecirc;nh truyền th&ocirc;ng về lĩnh vực tin tức, văn h&oacute;a, gi&aacute;o dục.</p>
', 14, CAST(N'2022-08-04' AS Date), 2, 1, N'MC   ', CAST(N'2022-07-31T13:12:19.707' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (54, N'Làm plugin Dokan, Woocommerce', 1000000, N'<p>Website đ&atilde; c&agrave;i đặt Woocommerce, plugin Dokan cho ph&eacute;p nhiều người b&aacute;n h&agrave;ng.</p>

<p>- Cho ph&eacute;p nhiều seller b&aacute;n c&ugrave;ng một sản phẩm</p>

<p>- Với sản phẩm c&oacute; sẵn, người b&aacute;n chỉ cần nhập gi&aacute; m&agrave; m&igrave;nh muốn b&aacute;n, kh&ocirc;ng cần th&ecirc;m sản phẩm mới.</p>

<p>- Người mua khi mua h&agrave;ng thấy được danh s&aacute;ch người b&aacute;n sản phẩm đ&oacute;, c&oacute; thể chọn nh&agrave; b&aacute;n m&agrave; m&igrave;nh muốn</p>
', 10, CAST(N'2022-08-01' AS Date), 2, 1, N'SE   ', CAST(N'2022-07-31T13:21:29.097' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (55, N'Khai phá dữ liệu', 800000, N'<p>ch&agrave;o c&aacute;c bạn,</p>

<p>m&igrave;nh c&oacute; dataset cho sẵn (https://www.kaggle.com/datasets/benroshan/factors-affecting-campus-placement), cần người l&agrave;m c&aacute;c lệnh khai ph&aacute; dữ liệu cơ bản, lưu dưới form Jupyter notebook</p>

<p>đề b&agrave;i c&oacute; 1 số y&ecirc;u cầu đặc biệt sau:</p>

<p>sử dụng tree based learning, c&aacute;c thuật to&aacute;n supervised learning v&agrave; unsupervised learning, đặc biệt c&oacute; sử dụng thư viện pycaret (c&aacute;i n&agrave;y rất dễ th&ocirc;i, chỉ cần 1 youtube video l&agrave; b sẽ hiểu)</p>
', 4, CAST(N'2022-08-01' AS Date), 4, 1, N'AI   ', CAST(N'2022-07-31T13:22:53.077' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (56, N'Thiết kế web trung tâm ngoại ngữ', 3000000, N'<p><strong>Cần 1 bạn c&oacute; kinh nghiệm thiết kế website trung t&acirc;m ngoại ngữ tiếng H&agrave;n!</strong></p>

<p><strong>Ưu ti&ecirc;n l&agrave;m web chuẩn seo, th&acirc;n thiện gg, tối ưu giao diện mobi</strong></p>
', 13, CAST(N'2022-08-04' AS Date), 2, 1, N'SE   ', CAST(N'2022-07-31T13:25:20.880' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (57, N'Tìm Freelancer Diễn hoạt 2D ', 3000000, N'<p>T&Igrave;M FREELANCER DIỄN HOẠT 2D (VIỆC NHIỀU ĐỀU ĐẶN)</p>

<p>Với mục đ&iacute;ch mở rộng quy m&ocirc;, b&ecirc;n m&igrave;nh cần T&igrave;m Freelancer Diễn hoạt hoạt h&igrave;nh 2D cho trẻ em</p>

<p>- 1 tập từ 2 ph&uacute;t đến 2 ph&uacute;t 30 gi&acirc;y</p>

<p>- Kịch bản v&agrave; Storyboard c&oacute; sẵn</p>

<p>- Nguy&ecirc;n liệu c&oacute; sẵn : Nh&acirc;n vật (đ&atilde; Rig xương sẵn), background, item,...</p>

<p>Ti&ecirc;u chuẩn diễn hoạt mong muốn như Video sau : https://bit.ly/sanphammongmuon</p>

<p>C&ocirc;ng việc nhiều, đều đặn, thanh to&aacute;n đ&uacute;ng hạn</p>

<p>Gửi 1 số sản phẩm diễn hoạt 2D bạn đ&atilde; từng l&agrave;m, k&egrave;m b&aacute;o gi&aacute; (nếu c&oacute;) tới</p>

<p>---</p>

<p>GIỚI THIỆU C&Ocirc;NG TY CH&Uacute;NG T&Ocirc;I - MCBOOKS:</p>

<p>14 năm xuất bản c&aacute;c sản phẩm gi&aacute;o dục cho trẻ em</p>

<p>Video giới thiệu c&ocirc;ng ty : https://bit.ly/video-gioi-thieu-mcb</p>
', 23, CAST(N'2022-08-01' AS Date), 2, 9, N'GD   ', CAST(N'2022-07-31T14:12:29.667' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (58, N'Quay và edit video sản phẩm', 2000000, N'<p>Hiện tại b&ecirc;n c&ocirc;ng ty m&igrave;nh cần tuyển 1 bạn quay video dựa tr&ecirc;n kịch bản c&oacute; sản của b&ecirc;n m&igrave;nh để tạo c&aacute;c video tiktok</p>

<p>- Nội dung quay đơn giản</p>

<p>- Kịch bản đơn giản v&agrave; c&oacute; sẳn</p>

<p>- Hợp t&aacute;c l&acirc;u d&agrave;i v&agrave; gần như quay 1 - 2 buổi h&agrave;ng tuần v&agrave; quay li&ecirc;n tục</p>

<p>- Sản phẩm về quần &aacute;o thể thao, tập gym nam</p>

<p>- Quy&ecirc;n lợi:</p>

<p>+ Trả lương ngay sau khi ho&agrave;n th&agrave;nh video</p>

<p>+ Trả tiền tr&ecirc;n mỗi video v&agrave; nh&acirc;n với số tiền tr&ecirc;n mỗi video</p>

<p>+ Mỗi buổi quay th&igrave; quay nhiều video</p>

<p>Đ&acirc;y l&agrave; c&ocirc;ng việc l&acirc;u d&agrave;i n&ecirc;n sẽ hợp t&aacute;c với c&aacute;c bạn l&acirc;u d&agrave;i khi hợp t&aacute;c</p>
', 21, CAST(N'2022-08-07' AS Date), 2, 9, N'IB   ', CAST(N'2022-07-31T14:13:30.850' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (60, N'Thiết kế video giới thiệu cá nhân ', 3000000, N'<p>Dịch vụ cần thu&ecirc;: Chỉnh sửa &amp; dựng video</p>

<p>M&igrave;nh cần thiết kế video dựa tr&ecirc;n video cũ, đ&atilde; c&oacute; dữ liệu của c&ocirc;ng ty.</p>

<p>Y&ecirc;u cầu sử dụng th&agrave;nh thạo c&aacute;c phần mềm chỉnh sửa ảnh v&agrave; video.</p>

<p>Địa chỉ ở Hồ Ch&iacute; Minh để b&ecirc;n m&igrave;nh trao đổi c&ocirc;ng việc cụ thể.</p>
', 20, CAST(N'2022-08-01' AS Date), 4, 6, N'MK   ', CAST(N'2022-07-31T14:31:36.747' AS DateTime), 1)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (61, N'Chăm sóc khách hàng công ty', 3000000, N'<p>Chăm s&oacute;c kh&aacute;ch h&agrave;ng c&ocirc;ng ty online qua CRM. M&igrave;nh c&oacute; kh&aacute;ch h&agrave;ng sử dụng website Moma v&agrave; nh&acirc;n sự Tiva</p>

<p>M&igrave;nh 2 cần 3 bạn chăm s&oacute;c đối tượng như sau</p>

<p>1. Chủ doanh nghiệp</p>

<p>2. Ứng vi&ecirc;n</p>

<p>Nhiệm vụ n&oacute;i chuyện hướng dẫn sử dụng</p>

<p>l&agrave;m việc online t&iacute;nh tr&ecirc;n cơ hội chăm s&oacute;c v&agrave; doanh số b&aacute;n được</p>
', 12, CAST(N'2022-08-01' AS Date), 2, 4, N'MK   ', CAST(N'2022-07-31T15:07:21.430' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (62, N'Cần Tuyển headhunt cho nền tảng tiva ', 1000000, N'<p>Xin ch&agrave;o m&igrave;nh c&oacute; nền tảng tuyển dụng miễn ph&iacute; cho doanh nghiệp Tiva hiện nay c&oacute; rất nhiều người nhờ dịch vụ headhunt nhưng kh&ocirc;ng đủ nh&acirc;n lực, bạn n&agrave;o l&agrave;m được online c&oacute; thể đăng k&yacute; m&igrave;nh</p>
', 20, CAST(N'2022-08-01' AS Date), 2, 4, N'JP   ', CAST(N'2022-07-31T15:08:49.357' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (63, N'Viết Bài Cho Blog Bằng Tiếng Anh.', 300000, N'<p>Bạn c&oacute; thể cung cấp dịch vụ n&agrave;y?&nbsp;<a href="https://www.vlance.vn/a/1143877/edit#service-can-provide">Th&ecirc;m v&agrave;o hồ sơ l&agrave;m việc</a>.</p>

<p>Xin ch&agrave;o c&aacute;c bạn,</p>

<p>M&igrave;nh đang muốn t&igrave;m đồng đội để c&ugrave;ng ph&aacute;t triển nội dung cho website c&ocirc;ng ty m&igrave;nh về lĩnh vực sports. M&igrave;nh c&oacute; một số th&ocirc;ng tin về c&ocirc;ng việc như sau:</p>

<p>Y&ecirc;u cầu cụ thể về năng lực:</p>

<p>- Ưu cầu c&aacute;c bạn c&oacute; kinh nghiệm viết b&agrave;i 6 th&aacute;ng trở l&ecirc;n</p>

<p>- Văn phong mạch lạc, c&oacute; tư duy logic trong tr&igrave;nh b&agrave;y &yacute; tưởng của b&agrave;i viết</p>

<p>- C&oacute; khả năng research nghi&ecirc;n cứu th&ocirc;ng tin</p>

<p>- Đ&uacute;ng ngữ ph&aacute;p, kh&ocirc;ng bị tr&ugrave;ng lặp nội dung, kh&ocirc;ng copy từ c&aacute;c website kh&aacute;c tr&ecirc;n internet, kh&ocirc;ng spin nội dung, kh&ocirc;ng PARAPHRASE</p>

<p>- Chủ đề kh&aacute; dễ viết</p>

<p>- Chỉ ti&ecirc;u &iacute;t nhất 1 tuần viết được 2 b&agrave;i (1000 - 2000 từ)</p>

<p>=&gt; Trong qu&aacute; tr&igrave;nh l&agrave;m việc được hướng dẫn v&agrave; đ&agrave;o tạo tận t&igrave;nh, kỹ lưỡng để đảm bảo follow được ti&ecirc;u chuẩn của c&ocirc;ng ty với một mục ti&ecirc;u duy nhất:</p>

<p>&quot;C&aacute;c bạn tiến bộ mỗi ng&agrave;y, kết quả c&ocirc;ng việc đạt ti&ecirc;u chuẩn cao, c&ocirc;ng ty ph&aacute;t triển c&ugrave;ng với sự ph&aacute;t triển của c&aacute;c bạn.&quot;</p>

<p>Th&ugrave; Lao v&agrave; Thanh To&aacute;n:</p>

<p>- Mức rate ch&uacute;ng ta sẽ deal với nhau l&uacute;c viết b&agrave;i test, t&ugrave;y theo năng lực của c&aacute;c bạn. V&agrave; sẽ nằm trong khung 170k-210k/1000 từ</p>

<p>- 1 Tuần m&igrave;nh sẽ thanh to&aacute;n 1 lần v&agrave;o thứ 2 hằng tuần</p>

<p>C&aacute;ch L&agrave;m Việc</p>

<p>- L&agrave;m việc online tại nh&agrave;, kh&ocirc;ng cần đến C&ocirc;ng Ty.</p>

<p>Hy vọng ch&uacute;ng ta sẽ c&oacute; cơ hội để hợp t&aacute;c, l&agrave;m việc v&agrave; c&ugrave;ng nhau tiến bộ.</p>

<p>Cảm ơn c&aacute;c bạn đ&atilde; đọc, ch&uacute;c c&aacute;c bạn một ng&agrave;y tuyệt vời nh&eacute;!</p>
', 3, CAST(N'2022-08-04' AS Date), 2, 4, N'EN   ', CAST(N'2022-07-31T15:10:19.007' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (64, N'Cần viết bài PR, 200k/bài', 400000, N'<p>&nbsp;Nội dung: Giới thiệu con xe chuẩn bị ra mắt tại Việt Nam (d&ograve;ng Mercedes-Maybach S-Class)</p>

<p>- Độ d&agrave;i: Khoảng 2-3 trang A4</p>

<p>- 1 b&agrave;i Th&ocirc;ng c&aacute;o b&aacute;o ch&iacute;</p>
', 7, CAST(N'2022-07-31' AS Date), 2, 6, N'MK   ', CAST(N'2022-07-31T17:54:25.770' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (65, N'Viết pr, quảng cáo cho các trang', 400000, N'<p>hi you</p>

<p>B&ecirc;n m&igrave;nh c&oacute; tuyển c&aacute;c bạn ứng vi&ecirc;n viết pr cho c&aacute;c trang website, c&aacute;c b&agrave;i viết chỉ cần 200-500 từ. dự &aacute;n c&oacute; thể l&agrave;m l&acirc;u d&agrave;i nh&eacute;</p>
', 12, CAST(N'2022-08-03' AS Date), 2, 6, N'IA   ', CAST(N'2022-07-31T17:55:34.333' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (66, N'We''re looking for experienced HR ', 2000000, N'<p>Hi freelancer,</p>

<p>We&#39;re looking for a recruiter to help us recruit people.</p>

<p>Budget: 200usd - 300 usd per day</p>

<p>Please make bids and contact to get more information.</p>

<p>Thanks.</p>
', 10, CAST(N'2022-07-31' AS Date), 2, 6, N'JP   ', CAST(N'2022-07-31T18:02:53.503' AS DateTime), NULL)
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major], [create_date], [payment_status]) VALUES (67, N'Job Title: Chụp ảnh, quay clip cho Brand thời trang nữ', 1000000, N'<p>Y&ecirc;u cầu:</p>

<p>- Đ&atilde; c&oacute; kinh nghiệm chụp / quay thời trang nữ + flatlay sản phẩm;</p>

<p>- Chỉnh ảnh cơ bản + edit video cơ bản;</p>

<p>- Chủ động, vui vẻ, l&agrave;m việc tr&aacute;ch nhiệm.</p>

<p>Li&ecirc;n hệ m&igrave;nh + gửi ảnh / video đ&atilde; từng thực hiện nh&eacute;</p>
', 10, CAST(N'2022-08-02' AS Date), 2, 1, N'MC   ', CAST(N'2022-08-01T09:57:50.717' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblJob] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobApplication] ON 

INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (32, 9, 34, 1, CAST(N'2022-06-17T20:21:39.660' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (33, 9, 33, 0, CAST(N'2022-06-17T20:21:46.107' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (40, 6, 36, 0, CAST(N'2022-06-18T10:10:22.760' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (41, 6, 38, 0, CAST(N'2022-06-18T10:10:42.743' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (42, 6, 37, 1, CAST(N'2022-06-22T09:36:33.183' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (47, 4, 41, 1, CAST(N'2022-06-23T15:13:13.710' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (48, 4, 37, 0, CAST(N'2022-06-27T20:10:46.537' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (49, 4, 36, 0, CAST(N'2022-06-27T20:10:54.917' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (50, 1, 33, 1, CAST(N'2022-06-27T21:44:20.427' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (51, 1, 38, 1, CAST(N'2022-06-27T21:44:30.840' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (52, 1, 36, 1, CAST(N'2022-06-27T21:44:42.327' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (55, 4, 33, 0, CAST(N'2022-06-28T14:47:46.287' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (57, 6, 43, 1, CAST(N'2022-07-03T01:01:15.650' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (61, 6, 42, 1, CAST(N'2022-07-12T19:48:40.490' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (62, 4, 43, 0, CAST(N'2022-07-16T16:56:32.317' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (63, 6, 50, 1, CAST(N'2022-07-16T17:01:48.680' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (64, 6, 44, 1, CAST(N'2022-07-19T10:03:42.770' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (65, 4, 51, 1, CAST(N'2022-07-31T12:11:38.253' AS DateTime), N'toi muon lam viec')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (66, 6, 56, NULL, CAST(N'2022-07-31T13:30:43.527' AS DateTime), N'Phần này tôi làm nhanh được')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (67, 6, 52, 1, CAST(N'2022-07-31T13:31:11.280' AS DateTime), N'Tôi có thể làm được')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (68, 6, 55, 1, CAST(N'2022-07-31T14:03:42.900' AS DateTime), N'Tôi muốn apply')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (69, 9, 56, NULL, CAST(N'2022-07-31T14:05:01.373' AS DateTime), N'Phần này tôi rành , có thể làm nhanh hơn so với deadline')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (70, 9, 55, 0, CAST(N'2022-07-31T14:06:47.700' AS DateTime), N'Tôi làm được tốt và nhanh deadline hơn')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (71, 9, 54, NULL, CAST(N'2022-07-31T14:07:05.230' AS DateTime), N'Tôi làm được tốt và nhanh deadline hơn')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (72, 9, 53, NULL, CAST(N'2022-07-31T14:09:21.740' AS DateTime), N'Tôi muốn tham gia')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (73, 6, 58, NULL, CAST(N'2022-07-31T14:23:49.340' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (74, 6, 53, NULL, CAST(N'2022-07-31T14:24:05.573' AS DateTime), N'tôi muốn được làm việc này , vì nó là sở trường của tôi')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (75, 4, 60, 1, CAST(N'2022-07-31T14:33:52.673' AS DateTime), N'tôi trả project này 2,900,000 vnd')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (76, 4, 58, NULL, CAST(N'2022-07-31T14:35:09.737' AS DateTime), N'Tôi muốn tham gia project này với giá 1,700,000')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (77, 4, 57, NULL, CAST(N'2022-07-31T14:49:09.090' AS DateTime), N'I am freelancer no 1')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (78, 4, 53, NULL, CAST(N'2022-07-31T15:02:07.357' AS DateTime), N'Tôi làm được nhanh ')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (79, 6, 63, NULL, CAST(N'2022-07-31T18:03:14.493' AS DateTime), N'me')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (80, 6, 54, NULL, CAST(N'2022-07-31T18:03:37.340' AS DateTime), N'Tôi sẽ làm tốt')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (81, 1, 66, NULL, CAST(N'2022-07-31T21:08:12.443' AS DateTime), N'tôi làm được tốt')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (82, 1, 57, NULL, CAST(N'2022-07-31T21:08:30.870' AS DateTime), N'tôi muốn apply
')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (83, 1, 64, NULL, CAST(N'2022-07-31T21:08:56.880' AS DateTime), N'tôi muốn tham dự với kinh nghiệm 20 năm')
INSERT [dbo].[tblJobApplication] ([id_application], [id_freelancer], [id_job], [status], [create_date], [note]) VALUES (84, 6, 57, NULL, CAST(N'2022-08-01T09:56:25.170' AS DateTime), N'tôi có thể làm tốt ')
SET IDENTITY_INSERT [dbo].[tblJobApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobReport] ON 

INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (2, N'Job xàm', 37, 6, CAST(N'2022-06-22T09:36:27.187' AS DateTime), N'Vẽ logo brand freelance job')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (9, N'vui bịp cái gì cũng dễ
', 33, 4, CAST(N'2022-06-28T14:48:04.410' AS DateTime), N'Data Analyst Dashboard')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (11, N'Spam', 56, 6, CAST(N'2022-07-31T13:30:52.063' AS DateTime), N'Thiết kế web trung tâm ngoại ngữ')
INSERT [dbo].[tblJobReport] ([id], [content_report], [id_job], [id_user_report], [create_date], [job_title]) VALUES (12, N'post xàm', 58, 4, CAST(N'2022-07-31T14:36:55.390' AS DateTime), N'Quay và edit video sản phẩm')
SET IDENTITY_INSERT [dbo].[tblJobReport] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobSkill] ON 

INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (160, 1, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (161, 2, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (162, 3, 33)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (166, 15, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (167, 16, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (168, 17, 36)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (169, 4, 37)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (170, 5, 37)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (255, 19, 52)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (256, 20, 52)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (257, 11, 43)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (258, 12, 43)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (259, 13, 43)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (260, 23, 53)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (261, 25, 53)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (262, 29, 53)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (263, 23, 44)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (264, 25, 44)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (267, 1, 54)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (268, 2, 54)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (269, 3, 54)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (270, 7, 55)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (271, 8, 55)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (272, 9, 55)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (273, 11, 56)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (274, 12, 56)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (275, 13, 56)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (276, 14, 56)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (277, 15, 56)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (278, 1, 51)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (279, 2, 51)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (280, 3, 51)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (281, 4, 51)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (282, 2, 34)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (283, 3, 34)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (284, 4, 34)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (285, 1, 41)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (286, 3, 41)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (287, 4, 41)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (288, 19, 57)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (289, 20, 57)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (290, 22, 57)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (291, 1, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (292, 2, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (293, 3, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (294, 4, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (295, 5, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (296, 6, 58)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (303, 1, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (304, 2, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (305, 3, 38)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (306, 1, 42)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (307, 2, 42)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (308, 3, 42)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (309, 1, 50)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (310, 2, 50)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (311, 3, 50)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (312, 1, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (313, 2, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (314, 3, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (315, 4, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (316, 5, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (317, 6, 61)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (318, 1, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (319, 3, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (320, 4, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (321, 5, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (322, 10, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (323, 11, 62)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (324, 9, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (325, 10, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (326, 11, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (327, 12, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (328, 13, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (329, 14, 63)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (330, 14, 60)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (331, 15, 60)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (332, 16, 60)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (333, 2, 64)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (334, 3, 64)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (335, 4, 64)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (342, 1, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (343, 2, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (344, 3, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (345, 4, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (346, 5, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (347, 6, 66)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (348, 21, 67)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (349, 26, 67)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (350, 27, 67)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (351, 28, 67)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (352, 1, 65)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (353, 2, 65)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (354, 3, 65)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (355, 4, 65)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (356, 5, 65)
INSERT [dbo].[tblJobSkill] ([id], [id_skill], [id_job]) VALUES (357, 6, 65)
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
SET IDENTITY_INSERT [dbo].[tblMilestone] ON 

INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (14, N'làm thinh', CAST(N'2022-07-16' AS Date), CAST(N'2022-07-17' AS Date), 0, 42)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (15, N'làm thinh', CAST(N'2022-07-16' AS Date), CAST(N'2022-07-17' AS Date), 0, 42)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (16, N'làm module 1', CAST(N'2022-07-19' AS Date), CAST(N'2022-07-20' AS Date), 0, 38)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (17, N'làm module 2', CAST(N'2022-07-21' AS Date), CAST(N'2022-07-22' AS Date), 0, 38)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (18, N'ok', CAST(N'2022-07-17' AS Date), CAST(N'2022-07-18' AS Date), 0, 42)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (19, N'uk', CAST(N'2022-07-18' AS Date), CAST(N'2022-07-19' AS Date), 0, 42)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (20, N'ok', CAST(N'2022-07-03' AS Date), CAST(N'2022-07-03' AS Date), 0, 43)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (21, N'Làm bài', CAST(N'2022-08-02' AS Date), CAST(N'2022-08-01' AS Date), 0, 60)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (22, N'Demo idea', CAST(N'2022-08-01' AS Date), CAST(N'2022-08-03' AS Date), 1, 52)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (23, N'Demo logo', CAST(N'2022-08-03' AS Date), CAST(N'2022-08-04' AS Date), 1, 52)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (24, N'demo idea', CAST(N'2022-08-01' AS Date), CAST(N'2022-08-02' AS Date), 1, 55)
INSERT [dbo].[tblMilestone] ([id_milestone], [tittle], [start_date], [end_date], [status], [id_job]) VALUES (25, N'demo sản phẩm', CAST(N'2022-08-02' AS Date), CAST(N'2022-08-03' AS Date), 1, 55)
SET IDENTITY_INSERT [dbo].[tblMilestone] OFF
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
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (23, 4, N'approved a job Viết document môn swr', 2, 6, CAST(N'2022-06-23T10:49:28.570' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (24, 9, N'approved a job Thiết kế trang web bằng Wordpress', 3, 6, CAST(N'2022-06-23T11:12:17.127' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (25, 9, N'approved a job Làm coursera môn swe', 3, 6, CAST(N'2022-06-23T11:18:45.970' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (26, 9, N'approved a job Vẽ môn typo 2 ', 3, 6, CAST(N'2022-06-23T11:21:08.940' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (27, 4, N'rejected a job Vẽ môn typo 2 ', 2, 6, CAST(N'2022-06-23T11:21:08.977' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (28, 6, N'applied a the job Job làm project ', 2, 4, CAST(N'2022-06-23T15:13:13.780' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (29, 8, N'Làm topic môn swt appiu was updated by Doan Vu Quang Huy', 1, NULL, CAST(N'2022-06-24T22:11:16.540' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (30, 8, N'Job Đi học nha poaiiii was updated by Ngo Xuan Thiep', 3, 4, CAST(N'2022-06-26T01:12:16.057' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (31, 4, N' was recovered your job Đi học nha poaiiii', 2, 8, CAST(N'2022-06-26T01:13:50.180' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (32, 4, N'approved a job Job làm project ', 2, 6, CAST(N'2022-06-26T01:21:46.643' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (33, 9, N'applied a the job Vẽ logo brand freelance job', 3, 4, CAST(N'2022-06-27T20:10:46.623' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (34, 9, N'applied a the job Dịch bài viết tiếng nhật', 3, 4, CAST(N'2022-06-27T20:10:55.000' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (35, 6, N'applied a the job Data Analyst Dashboard', 3, 1, CAST(N'2022-06-27T21:44:20.513' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (36, 4, N'applied a the job Chụp ảnh concept ca sỹ', 3, 1, CAST(N'2022-06-27T21:44:30.923' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (37, 9, N'applied a the job Dịch bài viết tiếng nhật', 3, 1, CAST(N'2022-06-27T21:44:42.457' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (38, 1, N'approved a job Chụp ảnh concept ca sỹ', 3, 4, CAST(N'2022-06-27T22:18:03.570' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (39, 6, N'rejected a job Chụp ảnh concept ca sỹ', 3, 4, CAST(N'2022-06-27T22:18:03.600' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (40, 6, N' was recovered your job Làm topic môn swt appiu', 3, 8, CAST(N'2022-06-28T09:34:56.460' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (41, 4, N'applied a the job Giải cứu sỹ SWP', 3, 9, CAST(N'2022-06-28T09:36:24.360' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (42, 4, N'applied a the job Giải cứu sỹ SWP', 3, 6, CAST(N'2022-06-28T13:57:58.360' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (43, 6, N'applied a the job Data Analyst Dashboard', 2, 4, CAST(N'2022-06-28T14:47:46.350' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (44, 1, N'applied a the job Cần người làm slide môn SWT', 2, 6, CAST(N'2022-06-28T15:08:32.870' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (45, 1, N'applied a the job hỗ trợ truyền thông event', 2, 6, CAST(N'2022-07-03T01:01:15.740' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (46, 4, N'approved a job Làm topic môn swt appiu', 2, 6, CAST(N'2022-07-04T12:52:03.753' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (47, 9, N'rejected a job Làm topic môn swt appiu', 3, 6, CAST(N'2022-07-04T12:52:03.887' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (48, 1, N'approved a job Data Analyst Dashboard', 3, 6, CAST(N'2022-07-04T12:54:17.263' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (49, 9, N'rejected a job Data Analyst Dashboard', 3, 6, CAST(N'2022-07-04T12:54:17.293' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (50, 4, N'rejected a job Data Analyst Dashboard', 2, 6, CAST(N'2022-07-04T12:54:17.367' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (51, 6, N'applied a the job ok', 3, 4, CAST(N'2022-07-04T13:48:48.417' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (52, 6, N'applied a the job Dịch thuật bài viets bằng tiếng anh', 2, 4, CAST(N'2022-07-08T13:18:31.370' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (53, 6, N'approved a job Giải cứu sỹ SWP', 3, 4, CAST(N'2022-07-08T13:20:40.777' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (54, 9, N'rejected a job Giải cứu sỹ SWP', 3, 4, CAST(N'2022-07-08T13:20:40.870' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (55, 4, N'approved a job ok', 1, 6, CAST(N'2022-07-08T13:27:21.530' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (56, 4, N'approved a job Dịch thuật bài viets bằng tiếng anh', 2, 6, CAST(N'2022-07-08T13:27:28.693' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (57, 6, N'applied a the job Cần người render video', 3, 4, CAST(N'2022-07-10T23:36:19.903' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (58, 4, N'approved a job Cần người render video', 2, 6, CAST(N'2022-07-10T23:36:58.277' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (59, 4, N'notify you that a job Giải cứu sỹ SWPhas been completed', 1, 4, CAST(N'2022-07-12T13:40:07.300' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (60, 4, N' has been added 5,000,000 in your balance', 2, 4, CAST(N'2022-07-12T13:40:07.337' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (61, 6, N'notify you that a job Job làm project  has been completed', 3, 4, CAST(N'2022-07-12T13:53:20.367' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (62, 6, N' has been added 1,000,000 in your balance', 3, 4, CAST(N'2022-07-12T13:53:20.400' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (63, 4, N'notify you that a job Dịch thuật bài viets bằng tiếng anh has been completed', 2, 6, CAST(N'2022-07-12T13:56:32.377' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (64, 4, N' has been added 100,000 in your balance', 2, 6, CAST(N'2022-07-12T13:56:32.407' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (65, 4, N'applied a the job Cần làm luận văn SE', 3, 6, CAST(N'2022-07-12T19:48:40.570' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (66, 4, N'notify you that a job Làm topic môn swt appiu has been completed', 1, 6, CAST(N'2022-07-14T14:00:44.760' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (67, 4, N' has been added 1,000,000 in your balance', 1, 6, CAST(N'2022-07-14T14:00:44.773' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (68, 6, N'approved a job Cần làm luận văn SE', 3, 4, CAST(N'2022-07-16T14:23:00.853' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (69, 1, N'applied a the job hỗ trợ truyền thông event', 2, 4, CAST(N'2022-07-16T16:56:32.423' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (70, 4, N'applied a the job test', 3, 6, CAST(N'2022-07-16T17:01:48.777' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (71, 6, N'approved a job test', 2, 4, CAST(N'2022-07-16T17:06:11.210' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (72, 1, N'applied a the job Test job 12', 2, 6, CAST(N'2022-07-19T10:03:42.867' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (73, 1, N' was recovered your job Cần người làm slide môn SWT', 2, 8, CAST(N'2022-07-21T15:50:20.917' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (74, 6, N'notify you that a job test has been completed', 2, 4, CAST(N'2022-07-29T20:55:00.700' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (75, 6, N' has been added 1,000,000 in your balance', 2, 4, CAST(N'2022-07-29T20:55:00.720' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (76, 6, N'notify you that a job Cần làm luận văn SE has been completed', 2, 4, CAST(N'2022-07-30T12:40:14.263' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (77, 6, N' has been added 1,000,000 in your balance', 2, 4, CAST(N'2022-07-30T12:40:14.283' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (78, 1, N'notify you that a job Chụp ảnh concept ca sỹ has been completed', 3, 4, CAST(N'2022-07-30T13:17:19.040' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (79, 1, N' has been added 1,000,000 in your balance', 3, 4, CAST(N'2022-07-30T13:17:19.053' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (80, 6, N'approved a job hỗ trợ truyền thông event', 3, 1, CAST(N'2022-07-31T10:10:50.567' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (81, 4, N'rejected a job hỗ trợ truyền thông event', 1, 1, CAST(N'2022-07-31T10:10:50.670' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (82, 8, N'<strong>Test job 12</strong> was updated by Nguyen Thanh Tung', 3, 1, CAST(N'2022-07-31T11:29:11.083' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (83, 8, N'<strong>Test job 12</strong> was updated by Nguyen Thanh Tung', 3, 1, CAST(N'2022-07-31T11:30:38.750' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (84, 8, N'<strong>Test job 12</strong> was updated by Nguyen Thanh Tung', 3, 1, CAST(N'2022-07-31T11:36:16.257' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (85, 6, N'applied a the job test 1', 3, 4, CAST(N'2022-07-31T12:11:38.343' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (86, 4, N'approved a job test 1', 1, 6, CAST(N'2022-07-31T12:17:43.263' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (87, 4, N'notify you that a job test 1 has been completed', 1, 6, CAST(N'2022-07-31T12:18:11.067' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (88, 4, N' has been added 1,000,000 in your balance', 1, 6, CAST(N'2022-07-31T12:18:11.080' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (89, 8, N'<strong>Biên tập video và lên content </strong> was updated by Nguyen Thanh Tung', 3, 1, CAST(N'2022-07-31T13:16:30.480' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (90, 1, N'applied a the job Thiết kế web trung tâm ngoại ngữ', 2, 6, CAST(N'2022-07-31T13:30:43.620' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (91, 1, N'applied a the job Thiết kế logo IN ẤN', 2, 6, CAST(N'2022-07-31T13:31:11.370' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (92, 1, N'applied a the job Khai phá dữ liệu', 2, 6, CAST(N'2022-07-31T14:03:42.990' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (93, 1, N'applied a the job Thiết kế web trung tâm ngoại ngữ', 2, 9, CAST(N'2022-07-31T14:05:01.467' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (94, 1, N'applied a the job Khai phá dữ liệu', 2, 9, CAST(N'2022-07-31T14:06:47.787' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (95, 1, N'applied a the job Làm plugin Dokan, Woocommerce', 2, 9, CAST(N'2022-07-31T14:07:05.310' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (96, 6, N'approved a job Vẽ logo brand freelance job', 3, 9, CAST(N'2022-07-31T14:07:33.010' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (97, 4, N'rejected a job Vẽ logo brand freelance job', 1, 9, CAST(N'2022-07-31T14:07:33.040' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (98, 1, N'approved a job Dịch bài viết tiếng nhật', 3, 9, CAST(N'2022-07-31T14:07:44.530' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (99, 6, N'rejected a job Dịch bài viết tiếng nhật', 3, 9, CAST(N'2022-07-31T14:07:44.560' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (100, 4, N'rejected a job Dịch bài viết tiếng nhật', 2, 9, CAST(N'2022-07-31T14:07:44.577' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (101, 1, N'applied a the job Biên tập nội dung cho kênh thông tin', 2, 9, CAST(N'2022-07-31T14:09:21.837' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (102, 9, N'applied a the job Quay và edit video sản phẩm', 3, 6, CAST(N'2022-07-31T14:23:49.423' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (103, 1, N'applied a the job Biên tập nội dung cho kênh thông tin', 2, 6, CAST(N'2022-07-31T14:24:05.650' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (104, 6, N'applied a the job Thiết kế video giới thiệu cá nhân và tổ chức MỚI', 3, 4, CAST(N'2022-07-31T14:33:52.757' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (105, 9, N'applied a the job Quay và edit video sản phẩm', 3, 4, CAST(N'2022-07-31T14:35:09.830' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (106, 9, N'applied a the job Tìm Freelancer Diễn hoạt 2D ', 3, 4, CAST(N'2022-07-31T14:49:09.183' AS DateTime), 2)
GO
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (107, 1, N'applied a the job Biên tập nội dung cho kênh thông tin', 2, 4, CAST(N'2022-07-31T15:02:07.447' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (108, 1, N' was recovered your job Viết bài tiếng anh cho website du lịch', 2, 8, CAST(N'2022-07-31T15:58:05.923' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (109, 4, N'applied a the job Viết Bài Cho Blog Bằng Tiếng Anh.', 3, 6, CAST(N'2022-07-31T18:03:14.570' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (110, 1, N'applied a the job Làm plugin Dokan, Woocommerce', 2, 6, CAST(N'2022-07-31T18:03:37.410' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (111, 4, N'approved a job Thiết kế video giới thiệu cá nhân ', 3, 6, CAST(N'2022-07-31T18:04:47.650' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (112, 6, N'applied a the job We''re looking for experienced HR ', 3, 1, CAST(N'2022-07-31T21:08:12.533' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (113, 9, N'applied a the job Tìm Freelancer Diễn hoạt 2D ', 3, 1, CAST(N'2022-07-31T21:08:30.960' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (114, 6, N'applied a the job Cần viết bài PR, 200k/bài', 3, 1, CAST(N'2022-07-31T21:08:56.970' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (115, 6, N'approved a job Thiết kế logo IN ẤN', 3, 1, CAST(N'2022-07-31T21:15:16.830' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (116, 6, N'approved a job Khai phá dữ liệu', 3, 1, CAST(N'2022-07-31T21:15:25.930' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (117, 9, N'rejected a job Khai phá dữ liệu', 3, 1, CAST(N'2022-07-31T21:15:26.027' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (118, 6, N'notify you that a job Hỗ trợ truyền thông event has been completed', 3, 1, CAST(N'2022-07-31T21:18:29.440' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (119, 6, N' has been added 300,000 in your balance', 3, 1, CAST(N'2022-07-31T21:18:29.457' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (120, 9, N'applied a the job Tìm Freelancer Diễn hoạt 2D ', 3, 6, CAST(N'2022-08-01T09:56:25.270' AS DateTime), 2)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (121, 6, N'approved a job Viết bài tiếng anh cho website du lịch', 3, 1, CAST(N'2022-08-01T10:00:09.777' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (122, 6, N'notify you that a job Thiết kế logo IN ẤN has been completed', 3, 1, CAST(N'2022-08-01T10:08:36.290' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (123, 6, N' has been added 3,000,000 in your balance', 3, 1, CAST(N'2022-08-01T10:08:36.303' AS DateTime), 1)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (124, 8, N'<strong>Viết pr, quảng cáo cho các trang</strong> was updated by Doan Vu Quang Huy', 3, 6, CAST(N'2022-08-01T10:11:17.420' AS DateTime), NULL)
INSERT [dbo].[tblNotification] ([id_noti], [id_user], [content], [id_status], [id_sender], [create_date], [id_mode]) VALUES (125, 6, N' was recovered your job Viết pr, quảng cáo cho các trang', 3, 8, CAST(N'2022-08-01T10:11:52.570' AS DateTime), 2)
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
SET IDENTITY_INSERT [dbo].[tblStorage] ON 

INSERT [dbo].[tblStorage] ([id_file], [urlS3], [id_job]) VALUES (40, N'https://fptfreelancejob-2022.s3.us-west-1.amazonaws.com/carousel_2.jpg', 60)
SET IDENTITY_INSERT [dbo].[tblStorage] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status], [balance]) VALUES (1, N'Nguyen Thanh Tung', N'tungntse151167@fpt.edu.vn', CAST(N'2001-09-16' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0868649875          ', N'https://lh3.googleusercontent.com/a-/AOh14Gg1FepAR0a7QPecGiCjewAkPlvViFlewVyhWbUJxQ=s96-c?fbclid=IwAR036LzOxBs-SpmPnBMZZ_iDemNUlOKhkiHqveIoSD1KCN_QW0mNpC-sfmU', 1, 1000000)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status], [balance]) VALUES (4, N'Ngo Xuan Thiep', N'thiepnxse151074@fpt.edu.vn', CAST(N'2001-01-01' AS Date), N'FPT University HCMC', N'Happy code - Happy money - Happy life', N'0987654322          ', N'https://lh3.googleusercontent.com/a-/AOh14Gh0g7NnfVO8L3hUL8EvzgRM1Oxy_hBKx77HKrc4=s96-c', 1, 3200000)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status], [balance]) VALUES (6, N'Doan Vu Quang Huy', N'huydvqse151224@fpt.edu.vn', CAST(N'2001-10-06' AS Date), N'11/29 Tan Thoi Nhat 12', N'Happy code - Happy money - Happy life', N'0909563183          ', N'https://lh3.googleusercontent.com/a-/AOh14GjA10ilxjaK-ex8IUmwOVHzNmx7yhwDjoZ22GND3Q=s96-c', 1, 11300000)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status], [balance]) VALUES (8, N'Nguyen Trong Nguyen Vũ', N'vuntnse151234@fpt.edu.vn', NULL, N'FPT University HCMC', N'Happy code - Happy money - Happy life', NULL, N'https://lh3.googleusercontent.com/a-/AOh14GhAIUdYRS2050BOcaNbCpCozTLnqpxKlqT1DWm1=s96-c', 1, 0)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status], [balance]) VALUES (9, N'Nguyen Quoc Sy (K15 HCM)', N'synqse151029@fpt.edu.vn', CAST(N'2022-06-16' AS Date), N'FPT University Address', N'Happy Code - Happy Money - Happy Life', N'0909563111          ', N'https://lh3.googleusercontent.com/a-/AOh14GjXYEr6kKhobEJZPMKBxGjgLTQsUKsdbbuPxb19=s96-c', 1, 1000000)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__AB6E6164EAACBA9D]    Script Date: 8/4/2022 9:37:58 AM ******/
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
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ((0)) FOR [balance]
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
ALTER TABLE [dbo].[tblMilestone]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
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
ALTER TABLE [dbo].[tblStorage]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD CHECK  (([rating]>=(0) OR [rating]<=(5)))
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD CHECK  (([salary]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[Check_Milestone_Status]    Script Date: 8/4/2022 9:37:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Check_Milestone_Status] @ID_MILESTONE INT 
AS
BEGIN
    IF (SELECT DATEDIFF(DAY, GETDATE(), end_date)
        FROM tblMilestone
        WHERE id_milestone = @ID_MILESTONE) <= 0
        BEGIN
        UPDATE tblMilestone
        SET status = 0
        WHERE id_milestone = @ID_MILESTONE 
        END
END
GO
USE [master]
GO
ALTER DATABASE [FPTFreelanceJob] SET  READ_WRITE 
GO
