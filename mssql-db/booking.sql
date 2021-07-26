USE [master]
GO
/****** Object:  Database [Booking]    Script Date: 7/26/2021 11:50:54 AM ******/
CREATE DATABASE [Booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Booking', FILENAME = N'/var/opt/mssql/data/Booking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Booking_log', FILENAME = N'/var/opt/mssql/data/Booking_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Booking] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Booking] SET  MULTI_USER 
GO
ALTER DATABASE [Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Booking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Booking] SET QUERY_STORE = OFF
GO
USE [Booking]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/26/2021 11:50:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[BookingOwnerID] [int] NULL,
	[ServiceID] [int] NULL,
	[PatientID] [int] NULL,
	[ClinicID] [int] NOT NULL,
	[CodeBooking] [nvarchar](50) NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[ChiefCompain] [ntext] NULL,
	[SystemicConditions] [nvarchar](500) NULL,
	[BookingType] [int] NOT NULL,
	[Note] [ntext] NULL,
	[GlobalDrApiKey] [nvarchar](100) NULL,
	[IsWalkIn] [bit] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingAdditionalStat]    Script Date: 7/26/2021 11:50:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingAdditionalStat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[TargetStatID] [int] NOT NULL,
	[TargetStatType] [int] NOT NULL,
 CONSTRAINT [PK_BookingAdditionalStat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingOwner]    Script Date: 7/26/2021 11:50:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingOwner](
	[BookingOwnerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Advisory] [nvarchar](150) NULL,
	[IdCard] [int] NULL,
	[Address] [nvarchar](500) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[District] [nvarchar](150) NOT NULL,
	[Ward] [nvarchar](150) NOT NULL,
	[Symptom] [nvarchar](500) NULL,
	[Token] [nvarchar](150) NULL,
 CONSTRAINT [PK_BookingOwner] PRIMARY KEY CLUSTERED 
(
	[BookingOwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_BookingType]  DEFAULT ((0)) FOR [BookingType]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [IsWalkIn]
GO
ALTER TABLE [dbo].[BookingAdditionalStat] ADD  CONSTRAINT [DF_BookingAdditionalStat_TargetStatType]  DEFAULT ((1)) FOR [TargetStatType]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_BookingOwner] FOREIGN KEY([BookingOwnerID])
REFERENCES [dbo].[BookingOwner] ([BookingOwnerID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_BookingOwner]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Alergy, 2 = Personal Behavior, 3 = Past History, 4 = Family history' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookingAdditionalStat', @level2type=N'COLUMN',@level2name=N'TargetStatType'
GO
USE [master]
GO
ALTER DATABASE [Booking] SET  READ_WRITE 
GO
