USE [master]
GO
/****** Object:  Database [ASSPRJ]    Script Date: 2/25/2025 4:01:58 PM ******/
CREATE DATABASE [ASSPRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASSPRJ', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASSPRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASSPRJ_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASSPRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASSPRJ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASSPRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASSPRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASSPRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASSPRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASSPRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASSPRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASSPRJ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ASSPRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASSPRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASSPRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASSPRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASSPRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASSPRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASSPRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASSPRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASSPRJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASSPRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASSPRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASSPRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASSPRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASSPRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASSPRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASSPRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASSPRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASSPRJ] SET  MULTI_USER 
GO
ALTER DATABASE [ASSPRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASSPRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASSPRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASSPRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASSPRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASSPRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASSPRJ] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASSPRJ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASSPRJ]
GO
/****** Object:  Table [dbo].[HouseholdMembers]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdMembers](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdID] [int] NULL,
	[UserID] [int] NULL,
	[Relationship] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Households](
	[HouseholdID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdCode] [nvarchar](15) NOT NULL,
	[HeadOfHouseholdID] [int] NULL,
	[ProvinceID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[WardID] [int] NOT NULL,
	[AddressDetail] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HouseholdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[HouseholdCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Action] [nvarchar](100) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Message] [nvarchar](max) NOT NULL,
	[SentDate] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationCode] [nvarchar](15) NOT NULL,
	[UserID] [int] NULL,
	[RegistrationType] [nvarchar](50) NOT NULL,
	[HouseholdID] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[ApprovedBy] [int] NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RegistrationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/25/2025 4:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[CCCD] [nvarchar](14) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](12) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[ProvinceID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[WardID] [int] NOT NULL,
	[AddressDetail] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Households] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [SentDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([HouseholdID])
REFERENCES [dbo].[Households] ([HouseholdID])
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([HeadOfHouseholdID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([HouseholdID])
REFERENCES [dbo].[Households] ([HouseholdID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([RegistrationType]='TemporaryStay' OR [RegistrationType]='Temporary' OR [RegistrationType]='Permanent'))
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([Status]='Rejected' OR [Status]='Approved' OR [Status]='Pending'))
GO
USE [master]
GO
ALTER DATABASE [ASSPRJ] SET  READ_WRITE 
GO
