USE [master]
GO
/****** Object:  Database [EMR v2]    Script Date: 7/26/2021 11:51:28 AM ******/
CREATE DATABASE [EMR v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMR', FILENAME = N'/var/opt/mssql/data/EMRv2.mdf' , SIZE = 10944KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'EMR_log', FILENAME = N'/var/opt/mssql/data/EMRv2_log.ldf' , SIZE = 2816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EMR v2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMR v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMR v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMR v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMR v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMR v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMR v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMR v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMR v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMR v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMR v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMR v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMR v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMR v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMR v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMR v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMR v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMR v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMR v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMR v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMR v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMR v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMR v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMR v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMR v2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMR v2] SET  MULTI_USER 
GO
ALTER DATABASE [EMR v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMR v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMR v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMR v2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EMR v2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMR v2] SET QUERY_STORE = OFF
GO
USE [EMR v2]
GO
/****** Object:  Table [dbo].[AdjustmentPrice]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdjustmentPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Amount] [money] NOT NULL,
	[IsPercentage] [bit] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[PatientType] [int] NOT NULL,
 CONSTRAINT [PK_AdjustmentPrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdmissionTypeService]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionTypeService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[AdmissionTypeID] [int] NOT NULL,
 CONSTRAINT [PK_AdmissionTypeService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis](
	[AnalysisID] [uniqueidentifier] NOT NULL,
	[AnalysisName] [nvarchar](150) NOT NULL,
	[TaskID] [uniqueidentifier] NULL,
	[StatusID] [int] NOT NULL,
	[JsonResults] [nvarchar](max) NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[EpisodeID] [int] NULL,
	[EpisodeRecordID] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditChange]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditChange](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[RecordID] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditChange] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditEvent]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[RecordID] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Old] [int] NULL,
	[New] [int] NULL,
	[OldStaffOrder] [int] NULL,
	[NewStaffOrder] [int] NULL,
	[ChangeStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_AuditEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Availability]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availability](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AxPx]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AxPx](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ICDCode] [varchar](15) NOT NULL,
	[ICDID] [int] NOT NULL,
	[FormID] [int] NOT NULL,
	[MOHCode] [varchar](12) NOT NULL,
	[MOHID] [int] NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Procedure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AxPxPermission]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AxPxPermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AxPxID] [int] NOT NULL,
	[UserTypeID] [int] NOT NULL,
 CONSTRAINT [PK_AxPxPermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AxPxRoom]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AxPxRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
 CONSTRAINT [PK_ProcedureRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AxPxService]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AxPxService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
 CONSTRAINT [PK_AxService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeStatus]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [smallint] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ChangeStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClinicalNote]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalNote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisodeRecordID] [int] NULL,
	[Description] [ntext] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
 CONSTRAINT [PK_ClinicalNote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletionStatus]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletionStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompletionCode] [smallint] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CompletionStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conclusion]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conclusion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisopdeRecordID] [int] NOT NULL,
	[ConclusionType] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Conclusion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConclusionSuggestion]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConclusionSuggestion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeDescription] [nvarchar](250) NULL,
	[ConclusionCodePosition] [int] NOT NULL,
	[ConclusionID] [int] NOT NULL,
 CONSTRAINT [PK_ConclusionSuggestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataPoint]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataPoint](
	[DataPointID] [uniqueidentifier] NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[PatientID] [int] NULL,
	[ArchetypeID] [varchar](500) NOT NULL,
	[Path] [varchar](1500) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_DataPoint] PRIMARY KEY CLUSTERED 
(
	[DataPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClinicID] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeptServAxPx]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeptServAxPx](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_DeptServAxPx] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[ICDDxID] [int] NOT NULL,
	[DiagnosisCode] [varchar](15) NOT NULL,
	[DiagnosisCodePosition] [int] NOT NULL,
	[Description] [ntext] NULL,
	[StaffID] [int] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[AdmissionTypeID] [int] NOT NULL,
	[AdjustmentPriceID] [int] NULL,
	[FinalPrice] [money] NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EpisodeRecord]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EpisodeRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisodeID] [int] NOT NULL,
	[RecordID] [nvarchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[ClinicID] [int] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[MedicationNote] [ntext] NULL,
 CONSTRAINT [PK_EpisodeRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flow]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flow](
	[FlowID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [ntext] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Blocks] [nvarchar](max) NOT NULL,
	[Scene] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Flow] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Components] [ntext] NOT NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ICD]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_ICD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ICDDx]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICDDx](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_ICDDx] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[MedicationID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineID] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[UserPrescribeID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[MedicineRoute] [int] NULL,
	[AmountPerDose] [int] NOT NULL,
	[UnitType] [int] NOT NULL,
	[DosePerDay] [int] NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[DaysCount] [int] NOT NULL,
	[TotalUnitsCount] [int] NULL,
	[TotalBuyingNumber] [int] NULL,
	[BuyingUnit] [int] NULL,
	[Instruction] [ntext] NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [ntext] NOT NULL,
	[DefaultMedRoute] [int] NULL,
	[DefaultUsageNum] [int] NULL,
	[UnitType] [int] NOT NULL,
	[DefaultDosePerDay] [int] NULL,
	[DefaultAmountPerDose] [int] NULL,
	[DefaultBuyingNumber] [int] NULL,
	[DefaultBuyingUnit] [int] NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOH]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](12) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_MOH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
	[ServiceID] [int] NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[PromotionID] [int] NULL,
	[CompletionID] [smallint] NOT NULL,
	[RoomID] [int] NULL,
	[StaffOrderID] [int] NOT NULL,
	[StaffPerformID] [int] NULL,
	[Price] [money] NULL,
	[TimeStarted] [datetime] NULL,
	[TimeCompleted] [datetime] NULL,
	[TimeOrdered] [datetime] NOT NULL,
	[IsFree] [bit] NOT NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_ProcedureOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[TargetID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[PromotionCode] [varchar](50) NOT NULL,
	[Amount] [money] NOT NULL,
	[IsPercentage] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[DateEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_PriceEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[ICDID] [int] NOT NULL,
	[TreatmentCode] [varchar](50) NOT NULL,
	[TreatmentCodePosition] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/26/2021 11:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdjustmentPrice] ON 

INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (5, N'BS giảm phí 100.000', N'BS giảm phí 100.000', -100000.0000, 0, 5, 1)
INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (6, N'BS giảm phí 150.000', N'BS giảm phí 150.000', -150000.0000, 0, 5, 1)
INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (7, N'BS giảm phí 200.000', N'BS giảm phí 200.000', -200000.0000, 0, 5, 1)
INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (8, N'BS giảm phí 50.000', N'BS giảm phí 50.000', -50000.0000, 0, 5, 1)
INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (9, N'BS giảm phí khúc xạ 130.000', N'BS giảm phí khúc xạ 130.000', -130000.0000, 0, 5, 1)
INSERT [dbo].[AdjustmentPrice] ([ID], [Name], [Description], [Amount], [IsPercentage], [ClinicID], [PatientType]) VALUES (2226, N'Phụ phí dịch vụ 200K', N'Phụ phí dịch vụ 200K', 200000.0000, 0, 5, 1)
SET IDENTITY_INSERT [dbo].[AdjustmentPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Availability] ON 

INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (1, 3, 1, 1, 250000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (2, 1, 7, 1, 220000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (3, 3, 2, 1, 500000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (4, 1, 8, 1, 100000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (5, 1, 9, 1, 200000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (6, 1, 10, 1, 400000.0000, 1)
INSERT [dbo].[Availability] ([ID], [TypeID], [TargetID], [ClinicID], [Price], [StatusID]) VALUES (7, 1, 11, 1, 100000.0000, 1)
SET IDENTITY_INSERT [dbo].[Availability] OFF
GO
SET IDENTITY_INSERT [dbo].[AxPx] ON 

INSERT [dbo].[AxPx] ([ID], [TypeID], [Description], [ICDCode], [ICDID], [FormID], [MOHCode], [MOHID], [StatusID]) VALUES (7, 1, N'General Checkup', N'NA', 1, 1, N'None', 1, 1)
INSERT [dbo].[AxPx] ([ID], [TypeID], [Description], [ICDCode], [ICDID], [FormID], [MOHCode], [MOHID], [StatusID]) VALUES (8, 1, N'Doctor Consultancy', N'NA', 1, 3, N'None', 1, 1)
INSERT [dbo].[AxPx] ([ID], [TypeID], [Description], [ICDCode], [ICDID], [FormID], [MOHCode], [MOHID], [StatusID]) VALUES (9, 1, N'Visual Acuity', N'None', 2, 2, N'None', 1, 1)
INSERT [dbo].[AxPx] ([ID], [TypeID], [Description], [ICDCode], [ICDID], [FormID], [MOHCode], [MOHID], [StatusID]) VALUES (10, 1, N'Objective Refraction', N'NA', 1, 4, N'None', 1, 1)
INSERT [dbo].[AxPx] ([ID], [TypeID], [Description], [ICDCode], [ICDID], [FormID], [MOHCode], [MOHID], [StatusID]) VALUES (11, 1, N'Cover Test', N'NA', 1, 5, N'None', 1, 1)
SET IDENTITY_INSERT [dbo].[AxPx] OFF
GO
SET IDENTITY_INSERT [dbo].[AxPxRoom] ON 

INSERT [dbo].[AxPxRoom] ([ID], [TypeID], [TargetID], [RoomID]) VALUES (1, 1, 7, 1)
INSERT [dbo].[AxPxRoom] ([ID], [TypeID], [TargetID], [RoomID]) VALUES (2, 1, 8, 2)
INSERT [dbo].[AxPxRoom] ([ID], [TypeID], [TargetID], [RoomID]) VALUES (4, 1, 9, 3)
INSERT [dbo].[AxPxRoom] ([ID], [TypeID], [TargetID], [RoomID]) VALUES (5, 1, 10, 3)
INSERT [dbo].[AxPxRoom] ([ID], [TypeID], [TargetID], [RoomID]) VALUES (6, 1, 11, 3)
SET IDENTITY_INSERT [dbo].[AxPxRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[AxPxService] ON 

INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (1, 1, 1, 7)
INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (2, 1, 1, 8)
INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (6, 2, 1, 9)
INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (7, 2, 1, 10)
INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (8, 2, 1, 11)
INSERT [dbo].[AxPxService] ([ID], [ServiceID], [TypeID], [TargetID]) VALUES (9, 2, 1, 8)
SET IDENTITY_INSERT [dbo].[AxPxService] OFF
GO
SET IDENTITY_INSERT [dbo].[CompletionStatus] ON 

INSERT [dbo].[CompletionStatus] ([ID], [CompletionCode], [Description]) VALUES (1, 1, N'Ordered')
INSERT [dbo].[CompletionStatus] ([ID], [CompletionCode], [Description]) VALUES (2, 2, N'In Progress')
INSERT [dbo].[CompletionStatus] ([ID], [CompletionCode], [Description]) VALUES (3, 3, N'Completed')
INSERT [dbo].[CompletionStatus] ([ID], [CompletionCode], [Description]) VALUES (4, 4, N'Canceled')
SET IDENTITY_INSERT [dbo].[CompletionStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [ClinicID], [DepartmentName], [Description]) VALUES (12, 5, N'Phòng khám', N'Phòng khám')
INSERT [dbo].[Department] ([ID], [ClinicID], [DepartmentName], [Description]) VALUES (13, 5, N'Phòng LASIK ', N'Phòng LASIK ')
INSERT [dbo].[Department] ([ID], [ClinicID], [DepartmentName], [Description]) VALUES (14, 5, N'Phòng Đáy Mắt', N'Phòng Đáy Mắt')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[DeptServAxPx] ON 

INSERT [dbo].[DeptServAxPx] ([ID], [TypeID], [TargetID], [DepartmentID]) VALUES (2, 3, 1, 12)
INSERT [dbo].[DeptServAxPx] ([ID], [TypeID], [TargetID], [DepartmentID]) VALUES (3, 1, 9, 13)
INSERT [dbo].[DeptServAxPx] ([ID], [TypeID], [TargetID], [DepartmentID]) VALUES (4, 1, 10, 13)
INSERT [dbo].[DeptServAxPx] ([ID], [TypeID], [TargetID], [DepartmentID]) VALUES (5, 1, 11, 14)
SET IDENTITY_INSERT [dbo].[DeptServAxPx] OFF
GO
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([ID], [Code], [Description], [Components]) VALUES (1, N'General Checkup', N'General Checkup', N'GeneralExamComponent')
INSERT [dbo].[Form] ([ID], [Code], [Description], [Components]) VALUES (2, N'Visual Acuity', N'Visual Acuity', N'VSAComponent')
INSERT [dbo].[Form] ([ID], [Code], [Description], [Components]) VALUES (3, N'Doctor Note', N'Doctor Note', N'CLSONComponent')
INSERT [dbo].[Form] ([ID], [Code], [Description], [Components]) VALUES (4, N'Refraction Exam', N'Refraction Exam', N'OJRComponent,OMComponent')
INSERT [dbo].[Form] ([ID], [Code], [Description], [Components]) VALUES (5, N'Cover Test for Current glass', N'Cover Test for Current glass', N'COVTComponent,CGComponent')
SET IDENTITY_INSERT [dbo].[Form] OFF
GO
SET IDENTITY_INSERT [dbo].[ICD] ON 

INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (1, N'NA', N'Not yet mapped', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (2, N'None', N'ICD không tồn tại', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (3, N'42503-00[160]', N'Bác sĩ kiểm tra tổng quát + đo nhãn áp', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (4, N'11219-00[2016]', N'Chụp cắt lớp võng mạc - OCT', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (5, N'11219-00[2016]', N'Chụp cắt lớp võng mạc (OCT) + Lớp sợi thần kinh và hoàng điểm', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (6, N'92016-00[1835]', N'Đo nhãn áp', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (7, N'42503-00[160]', N'Soi đáy mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (8, N'96205-04[1922]', N'Nhỏ liệt điều tiết bằng Cyclo', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (9, N'96205-04[1922]', N'Nhuộm fluorescein giác mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (10, N'42503-00[160]', N'Soi góc tiền phòng', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (11, N'96043-00[1833]', N'Đo khúc xạ', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (14, N'96038-00[1831]', N'Đo thị lực', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (15, N'42692-01[169]', N'Xét nghiệm giải phẫu bệnh lý giác mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (16, N'30071-02[232]', N'Xét nghiệm giải phẫu bệnh lý mí mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (17, N'96232-00[215]', N'Xét nghiệm giải phẫu bệnh lý cơ vòng mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (18, N'42676-00[254]', N'Xét nghiệm giải phẫu bệnh lý kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (19, N'96041-00[1832]', N'Đo thị trường kế (humphrey)', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (20, N'55030-00 [1940]', N'Siêu âm mắt (siêu âm thường qui)', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (21, N'92018-00[1831]', N'Test màu', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (22, N'90084-00[231]', N'Nặn bờ mi 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (23, N'90084-00[231]', N'Nặn bờ mi 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (24, N'96246-00[238]', N'Nhổ lông xiêu 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (25, N'96246-00[238]', N'Nhổ lông xiêu 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (26, N'42614-01[241]', N'Bơm rửa lệ đạo 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (27, N'42615-01[241]', N'Bơm rửa lệ đạo 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (28, N'42614-01[241]', N'Bơm rửa lệ đạo trẻ em 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (29, N'42615-01[241]', N'Bơm rửa lệ đạo trẻ em 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (30, N'42668-00[166]', N'Cắt chỉ khâu giác mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (31, N'90089-00[256]', N'Cắt chỉ khâu kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (32, N'42740-00[204]', N'Chọc dịch tiền phòng', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (33, N'42599-00[249]', N'Đặt nút điểm lệ', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (34, N'42602-00[249]', N'Đặt nút điểm lệ', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (35, N'42806-00[188]', N'Laser mống mắt 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (36, N'42806-00[188]', N'Laser mống mắt 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (37, N'42809-00[211]', N'Laser quang đông VM (PRP)', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (38, N'99999-99[999]', N'ICD không khả dụng', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (39, N'42809-01[212]', N'Laser quanh lỗ rách võng mạc / 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (40, N'42809-01[212]', N'Laser quanh lỗ rách võng mạc / 2 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (41, N'30061-02[166]', N'Lấy dị vật giác mạc nông 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (42, N'30061-04[251]', N'Lấy dị vật kết mạc 1 mắt', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (43, N'42686-00[172]', N'Mổ mộng kép', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (44, N'42686-00[172]', N'Mổ mộng NNN', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (45, N'42686-00[172]', N'Mổ mộng thịt - Ghép kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (46, N'42641-01[255]', N'Ghép kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (47, N'42686-00[172]', N'Mổ mộng thịt - Ghép kết mạc (Áp MC)', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (48, N'42641-01[255]', N'Ghép kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (49, N'96248-02[239]', N'Mổ quặm 1 mi dưới', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (50, N'96248-02[239]', N'Mổ quặm 1 mi trên', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (51, N'45620-00[1662]', N'Mổ thẩm mỹ 2 mi dưới NNN', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (52, N'45617-00[1662]', N'Mổ thẩm mỹ 2 mi trên NNN', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (53, N'45617-00[1662]', N'Mổ thẩm mỹ hai mi trên', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (54, N'42824-01[251]', N'Tiêm thuốc cạnh cầu dưới kết mạc', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (55, N'96205-04[1922]', N'Nhỏ liệt điều tiết bằng Atropine', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (58, N'96205-04[1922]', N'Nhỏ giãn', 1)
INSERT [dbo].[ICD] ([ID], [Code], [Description], [StatusID]) VALUES (59, N'42809-00[211]', N'Laser quang đông VM (PRP) bổ sung', 1)
SET IDENTITY_INSERT [dbo].[ICD] OFF
GO
SET IDENTITY_INSERT [dbo].[ICDDx] ON 

INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1, N'H00', N'Lẹo và chắp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (2, N'H00.0', N'Lẹo và viêm sâu khác của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (3, N'H00.1', N'Chắp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (4, N'H01', N'Viêm khác của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (5, N'H01.0', N'Viêm bờ mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (6, N'H01.1', N'Bệnh da mí không nhiễm trùng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (7, N'H01.8', N'Viêm mí mắt xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (8, N'H01.9', N'Viêm mí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (9, N'H02', N'Bệnh khác của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (10, N'H02.0', N'Quặm và lông xiêu của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (11, N'H02.1', N'Lật mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (12, N'H02.2', N'Hở mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (13, N'H02.3', N'Sa da mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (14, N'H02.4', N'Sụp mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (15, N'H02.5', N'Bệnh khác ảnh hưởng đến chức năng của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (16, N'H02.6', N'U vàng ở mi mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (17, N'H02.7', N'Bệnh thoái hóa khác của mí mắt và vùng quanh mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (18, N'H02.8', N'Bệnh xác định khác của mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (19, N'H02.9', N'Bệnh mí mắt không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (20, N'H03', N'Bệnh mí mắt trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (21, N'H03.0', N'Nhiễm ký sinh trùng ở mí mắt trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (22, N'H03.1', N'Liên quan đến mí mắt trong các bệnh khác phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (23, N'H03.8', N'Liên quan đến mí mắt trong các bệnh khác phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (24, N'H04', N'Bệnh của lệ bộ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (25, N'H04.0', N'Viêm tuyến lệ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (26, N'H04.1', N'Bệnh khác của tuyến lệ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (27, N'H04.2', N'Chảy nước mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (28, N'H04.3', N'Viêm lệ đạo cấp tính và không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (29, N'H04.4', N'Viêm lệ đạo mạn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (30, N'H04.5', N'Hẹp và suy giảm chức năng của lệ đạo', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (31, N'H04.6', N'Biến đổi khác trong lệ đạo', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (32, N'H04.8', N'Bệnh khác của lệ bộ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (33, N'H04.9', N'Bệnh của lệ bộ, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (34, N'H05', N'Bệnh của hốc mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (35, N'H05.0', N'Viêm hốc mắt cấp tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (36, N'H05.1', N'Viêm hốc mắt mạn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (37, N'H05.2', N'Các bệnh gây lồi mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (38, N'H05.3', N'Biến dạng của hốc mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (39, N'H05.4', N'Lõm mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (40, N'H05.5', N'Dị vật còn lưu sau vết thương xuyên của hốc mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (41, N'H05.8', N'Bệnh khác của hốc mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (42, N'H05.9', N'Bệnh của hốc mắt, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (43, N'H06', N'Bệnh của lệ bộ và hốc mắt trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (44, N'H06.0', N'Bệnh của lệ bộ trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (45, N'H06.1', N'Nhiễm ký sinh trùng của hốc mắt trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (46, N'H06.2', N'Lồi mắt do rối loạn chức năng tuyến giáp (E05.†)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (47, N'H06.3', N'Bệnh khác của hốc mắt trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (48, N'H10', N'Viêm kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (49, N'H10.0', N'Viêm kết mạc nhầy mủ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (50, N'H10.1', N'Viêm kết mạc dị ứng cấp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (51, N'H10.2', N'Viêm kết mạc cấp khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (52, N'H10.3', N'Viêm kết mạc cấp, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (53, N'H10.4', N'Viêm kết mạc mạn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (54, N'H10.5', N'Viêm kết mí mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (55, N'H10.8', N'Viêm kết mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (56, N'H10.9', N'Viêm kết mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (57, N'H11', N'Bệnh khác của kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (58, N'H11.0', N'Mộng thịt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (59, N'H11.1', N'Cặn lắng và thoái hóa kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (60, N'H11.2', N'Sẹo kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (61, N'H11.3', N'Xuất huyết kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (62, N'H11.4', N'Nang các bệnh mạch máu kết mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (63, N'H11.8', N'Bệnh xác định khác của kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (64, N'H11.9', N'Bệnh của kết mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (65, N'H13', N'Bệnh của kết mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (66, N'H13.0', N'Nhiễm giun chỉ kết mạc (B74.-+)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (67, N'H13.1', N'Viêm kết mạc trong các bệnh nhiễm trùng và ký sinh trùng phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (68, N'H13.2', N'Viêm kết mạc trong bệnh khác, phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (69, N'H13.3', N'Dạng pempigus ở mắt (L12.-†)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (70, N'H13.8', N'Bệnh khác của kết mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (71, N'H15', N'Bệnh của củng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (72, N'H15.0', N'Viêm củng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (73, N'H15.1', N'Viêm thượng củng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (74, N'H15.8', N'Bệnh khác của củng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (75, N'H15.9', N'Bệnh củng mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (76, N'H16', N'Viêm giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (77, N'H16.0', N'Loét giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (78, N'H16.1', N'Viêm giác mạc nông khác không viêm kết mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (79, N'H16.2', N'Viêm kết giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (80, N'H16.3', N'Viêm giác mạc sâu và viêm giác mạc kẽ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (81, N'H16.4', N'Tân tạo mạch giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (82, N'H16.8', N'Viêm giác mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (83, N'H16.9', N'Viêm giác mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (84, N'H17', N'Sẹo và đục giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (85, N'H17.0', N'Sẹo dính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (86, N'H17.1', N'Đục giác mạc trung tâm khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (87, N'H17.8', N'Sẹo và đục giác mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (88, N'H17.9', N'Sẹo và đục giác mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (89, N'H18', N'Bệnh khác của giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (90, N'H18.0', N'Nhiễm sắc tố và lắng đọng ở giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (91, N'H18.1', N'Bệnh giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (92, N'H18.2', N'Phù giác mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (93, N'H18.3', N'Biến đổi ở các lớp giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (94, N'H18.4', N'Thoái hóa giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (95, N'H18.5', N'Loạn dưỡng giác mạc di truyền', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (96, N'H18.6', N'Giác mạc hình chóp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (97, N'H18.7', N'Biến dạng giác mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (98, N'H18.8', N'Bệnh giác mạc xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (99, N'H18.9', N'Bệnh giác mạc không xác định', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (100, N'H19', N'Bệnh củng mạc và giác mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (101, N'H19.0', N'Viêm củng mạc và thượng củng mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (102, N'H19.1', N'Viêm giác mạc và viêm kết mạc do virus Herpes (B00.5†)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (103, N'H19.2', N'Viêm giác mạc và viêm kết giác mạc trong bệnh nhiễm trùng và nhiễm ký sinh khác phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (104, N'H19.3', N'Viêm giác mạc và viêm kết giác mạc trong bệnh khác, phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (105, N'H19.8', N'Bệnh khác của củng mạc và giác mạc trong bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (106, N'H20', N'Viêm mống thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (107, N'H20.0', N'Viêm mống mắt thể mi cấp và bán cấp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (108, N'H20.1', N'Viêm mống mắt thể mi mạn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (109, N'H20.2', N'Viêm mống mắt thể mi do thể thủy tinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (110, N'H20.8', N'Viêm mống mắt thể mi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (111, N'H20.9', N'Viêm mống mắt thể mi, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (112, N'H21', N'Bệnh khác của mống mắt và thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (113, N'H21.0', N'Xuất huyết tiền phòng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (114, N'H21.1', N'Bệnh mạch máu khác của mống mắt và thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (115, N'H21.2', N'Thoái hóa mống mắt và thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (116, N'H21.3', N'Nang mống mắt, thể mi và tiền phòng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (117, N'H21.4', N'Màng đồng tử', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (118, N'H21.5', N'Dính và đứt khác của mống mắt và thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (119, N'H21.8', N'Bệnh xác định khác của mống mắt và thể mi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (120, N'H21.9', N'Bệnh của mống mắt và thể mi, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (121, N'H22', N'Bệnh của mống mắt và thể mi trong bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (122, N'H22.0', N'Viêm mống mắt thể mi trong các bệnh nhiễm trùng và ký sinh trùng phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (123, N'H22.1', N'Viêm mống mắt thể mi trong các bệnh khác, phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (124, N'H22.8', N'Bệnh khác của mống mắt và thể mi trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (125, N'H25', N'Đục thủy tinh thể người già', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (126, N'H25.0', N'Đục thủy tinh thể bắt đầu ở người già', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (127, N'H25.1', N'Đục thủy tinh thể vùng nhân ở người già', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (128, N'H25.2', N'Đục thủy tinh thể hình thái Morgagni', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (129, N'H25.8', N'Đục thủy tinh thể người già khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (130, N'H25.9', N'Đục thủy tinh thể người già, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (131, N'H26', N'Đục thủy tinh thể khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (132, N'H26.0', N'Đục thủy tinh thể trẻ em, người trẻ và trước tuổi già', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (133, N'H26.1', N'Đục thủy tinh thể do chấn thương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (134, N'H26.2', N'Đục thủy tinh thể biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (135, N'H26.3', N'Đục thủy tinh thể do thuốc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (136, N'H26.4', N'Đục bao sau mổ đục thủy tinh thể ngoài bao', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (137, N'H26.8', N'Đục thủy tinh thể xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (138, N'H26.9', N'Đục thủy tinh thể, không xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (139, N'H27', N'Các bệnh khác của thủy tinh thể', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (140, N'H27.0', N'Không có thủy tinh thể', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (141, N'H27.1', N'Lệch thủy tinh thể', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (142, N'H27.8', N'Bệnh thủy tinh thể xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (143, N'H27.9', N'Bệnh thủy tinh thể, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (144, N'H28', N'Đục thủy tinh thể và bệnh của thủy tinh thể khác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (145, N'H28.0', N'Đục thủy tinh thể do đái tháo đường (El0-E14†) với ký tự thứ tư chung .3)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (146, N'H28.1', N'Đục thủy tinh thể trong các bệnh nội tiết, dinh dưỡngvà chuyển hóa khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (147, N'H28.2', N'Đục thủy tinh thể trong bệnh khác phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (148, N'H28.8', N'Bệnh khác của thủy tinh thể trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (149, N'H30', N'Viêm hắc võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (150, N'H30.0', N'Viêm hắc võng mạc khu trú', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (151, N'H30.1', N'Viêm màng võng mạc lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (152, N'H30.2', N'Viêm thể mi sau', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (153, N'H30.8', N'Bệnh viêm hắc võng mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (154, N'H30.9', N'Viêm hắc võng mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (155, N'H31', N'Bệnh khác của hắc mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (156, N'H31.0', N'Sẹo hắc võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (157, N'H31.1', N'Thoái hóa hắc mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (158, N'H31.2', N'Loạn dưỡng hắc mạc di truyền', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (159, N'H31.3', N'Xuất huyết và rách hắc mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (160, N'H31.4', N'Bong hắc mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (161, N'H31.8', N'Bệnh xác định khác của hắc mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (162, N'H31.9', N'Bệnh hắc mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (163, N'H32', N'Bệnh hắc võng mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (164, N'H32.0', N'Viêm hắc võng mạc trong bệnh nhiễm trùng và ký sinh trùng phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (165, N'H32.8', N'Bệnh hắc võng mạc khác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (166, N'H33', N'Bong và rách võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (167, N'H33.0', N'Bong võng mạc có vết rách', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (168, N'H33.1', N'Tách lớp võng mạc và nang võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (169, N'H33.2', N'Bong võng mạc thanh dịch', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (170, N'H33.3', N'Vết rách võng mạc không có bong', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (171, N'H33.4', N'Bong võng mạc do kéo', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (172, N'H33.5', N'Bong võng mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (173, N'H34', N'Tắc động mạch võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (174, N'H34.0', N'Tắc động mạch võng mạc thoáng qua', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (175, N'H34.1', N'Tắc động mạch trung tâm võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (176, N'H34.2', N'Tắc động mạch võng mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (177, N'H34.8', N'Các tắc mạch võng mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (178, N'H34.9', N'Tắc mạch võng mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (179, N'H35', N'Các bệnh võng mạc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (180, N'H35.0', N'Bệnh lý võng mạc sơ phát và biến đổi mạch máu võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (181, N'H35.1', N'Bệnh lý võng mạc của trẻ đẻ non', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (182, N'H35.2', N'Bệnh lý võng mạc tăng sinh khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (183, N'H35.3', N'Thoái hóa hoàng điểm và cực sau', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (184, N'H35.4', N'Thoái hóa võng mạc ngoại biên', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (185, N'H35.5', N'Loạn dưỡng võng mạc di truyền', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (186, N'H35.6', N'Xuất huyết võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (187, N'H35.7', N'Tách lớp võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (188, N'H35.8', N'Bệnh võng mạc xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (189, N'H35.9', N'Bệnh võng mạc, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (190, N'H36', N'Bệnh võng mạc trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (191, N'H36.0', N'Bệnh lý võng mạc do đái tháo đường (E10-E14† với ký tự thứ tự chung là .3)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (192, N'H36.8', N'Bệnh võng mạc khác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (193, N'H40', N'Glôcôm', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (194, N'H40.0', N'Nghi ngờ tăng glôcôm', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (195, N'H40.1', N'Glôcôm góc mở nguyên phát', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (196, N'H40.2', N'Glôcôm góc đóng nguyên phát', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (197, N'H40.3', N'Glôcôm thứ phát do chấn thương mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (198, N'H40.4', N'Glôcôm thứ phát do viêm mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (199, N'H40.5', N'Glôcôm thứ phát do bệnh mắt khác', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (200, N'H40.6', N'Glôcôm thứ phát do thuốc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (201, N'H40.8', N'Glôcôm dạng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (202, N'H40.9', N'Glôcôm, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (203, N'H42', N'Glôcôm trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (204, N'H42.0', N'Glôcôm trong bệnh nội tiết, dinh dưỡng và chuyển hóa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (205, N'H42.8', N'Glôcôm trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (206, N'H43', N'Bệnh của dịch kính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (207, N'H43.0', N'Phòi dịch kính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (208, N'H43.1', N'Xuất huyết dịch kính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (209, N'H43.2', N'Cặn lắng thủy tinh thể trong dịch kính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (210, N'H43.3', N'Vẩn đục dịch kính khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (211, N'H43.8', N'Bệnh khác của dịch kính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (212, N'H43.9', N'Bệnh dịch kính, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (213, N'H44', N'Bệnh của nhãn cầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (214, N'H44.0', N'Viêm mủ nội nhãn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (215, N'H44.1', N'Viêm nội nhãn khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (216, N'H44.2', N'Cận thị thoái hóa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (217, N'H44.3', N'Bệnh thoái hóa khác của nhãn cầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (218, N'H44.4', N'Hạ nhãn áp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (219, N'H44.5', N'Các bệnh thoái hóa của nhãn cầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (220, N'H44.6', N'Tồn tại dị vật nội nhãn, có từ tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (221, N'H44.7', N'Tồn tại dị vật nội nhãn, không có từ tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (222, N'H44.8', N'Các bệnh khác của nhãn cầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (223, N'H44.9', N'Bệnh nhãn cầu, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (224, N'H45', N'Bệnh của dịch kính và nhãn cầu trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (225, N'H45.0', N'Xuất huyết dịch kính trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (226, N'H45.1', N'Viêm nội nhãn trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (227, N'H45.8', N'Các bệnh khác của dịch kính và nhãn cầu trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (228, N'H46', N'Viêm thần kinh thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (229, N'H47', N'Các bệnh khác của thần kinh thị (dây thần kinh II) và đường thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (230, N'H47.0', N'Bệnh thần kinh thị, không phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (231, N'H47.1', N'Phù gai, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (232, N'H47.2', N'Teo thần kinh thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (233, N'H47.3', N'Bệnh khác của đĩa thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (234, N'H47.4', N'Bệnh giao thoa thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (235, N'H47.5', N'Bệnh đường thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (236, N'H47.6', N'Bệnh vỏ não thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (237, N'H47.7', N'Bệnh đường thị giác không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (238, N'H48', N'Bệnh thần kinh thị và đường dãn thị giác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (239, N'H48.0', N'Teo thần kinh thị trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (240, N'H48.1', N'Tiêm thần kinh hậu cầu trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (241, N'H48.8', N'Bệnh khác của thần kinh thị và đường dẫn truyền thị giác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (242, N'H49', N'Lác liệt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (243, N'H49.0', N'Liệt dây [vận nhãn] III', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (244, N'H49.1', N'Liệt dây [ròng rọc] IV', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (245, N'H49.2', N'Liệt dây VI', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (246, N'H49.3', N'Liệt vận nhãn (ngoài) toàn bộ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (247, N'H49.4', N'Liệt vận nhãn ngoài tiến triển', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (248, N'H49.8', N'Các liệt khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (249, N'H49.9', N'Các liệt, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (250, N'H50', N'Lác khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (251, N'H50.0', N'Lác hội tụ đông hành', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (252, N'H50.1', N'Lác phân kỳ đồng hành', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (253, N'H50.2', N'Lác đứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (254, N'H50.3', N'Lác từng hồi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (255, N'H50.4', N'Lác khác và lác không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (256, N'H50.5', N'Lác ẩn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (257, N'H50.6', N'Lác cơ học', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (258, N'H50.8', N'Lác xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (259, N'H50.9', N'Lác, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (260, N'H51', N'Các rối loạn vận nhãn hai mắt khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (261, N'H51.0', N'Liệt phối hợp hướng nhìn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (262, N'H51.1', N'Thiểu năng hay gia tăng quy tụ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (263, N'H51.2', N'Liệt vẫn nhãn gian', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (264, N'H51.8', N'Các rối loạn vận nhãn hai mắt xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (265, N'H51.9', N'Rối loạn vẫn nhãn hai mắt, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (266, N'H52', N'Bệnh khúc xạ và điều tiết', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (267, N'H52.0', N'Viễn thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (268, N'H52.1', N'Cận thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (269, N'H52.2', N'Loạn thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (270, N'H52.3', N'Khúc xạ hai mắt không đều và hình võng mạc hai mắt không đều', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (271, N'H52.4', N'Lão thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (272, N'H52.5', N'Rối loạn điều tiết', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (273, N'H52.6', N'Rối loạn khúc xạ khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (274, N'H52.7', N'Rối loạn khúc xạ, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (275, N'H53', N'Rối loạn thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (276, N'H53.0', N'Nhược thị do không nhìn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (277, N'H53.1', N'Rối loạn thị giác chủ quan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (278, N'H53.2', N'Song thị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (279, N'H53.3', N'Rối loạn thị giác hai mắt khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (280, N'H53.4', N'Tổn hại thị trường', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (281, N'H53.5', N'Tổn hại sắc giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (282, N'H53.6', N'Quáng gà', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (283, N'H53.8', N'Rối loạn thị giác khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (284, N'H53.9', N'Rối loạn thị giác, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (285, N'H54', N'Giảm thị lực bao gồm mù lòa (hai mắt hoặc một mắt)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (286, N'H54.0', N'Mù, hai mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (287, N'H54.1', N'Giảm thị lực mức độ nặng, hai mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (288, N'H54.2', N'Giảm thị lực mức độ trung bình, hai mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (289, N'H54.3', N'Giảm thị lực mức độ nhẹ hoặc không giảm, hai mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (290, N'H54.4', N'Mù, một mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (291, N'H54.5', N'Mù, một mắt ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (292, N'H54.6', N'Giảm thị lực mức độ trung bình, một mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (293, N'H54.9', N'Giảm thị lực không xác định (hai mắt)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (294, N'H55', N'Rung giật nhãn cầu và rối loạn vận nhãn cầu khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (295, N'H57', N'Các bệnh khác của mắt và phần phụ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (296, N'H57.0', N'Bất thường chức năng đồng tử', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (297, N'H57.1', N'Nhức mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (298, N'H57.8', N'Các bệnh xác định khác của mắt và phần phụ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (299, N'H57.9', N'Các bệnh của mắt và phần phụ, không xác định', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (300, N'H58', N'Bệnh khác của mắt và phần phụ trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (301, N'H58.0', N'Bất thường chức năng đồng tử trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (302, N'H58.1', N'Rối loạn thị giác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (303, N'H58.8', N'Bệnh của mắt và phần phụ xác định khác trong các bệnh phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (304, N'H59', N'Bệnh mắt và phần phụ sau phẫu thuật không phân loại nơi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (305, N'H59.0', N'Hội chứng dịch kính sau phẫu thuật thủy tinh thể', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (306, N'H59.8', N'Bệnh khác của mắt và phần phụ sau phẫu thuật', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (307, N'H59.9', N'Bệnh mắt và phần phụ sau phẫu thuật, không xác định ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (308, N'BT', N'Normal', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (309, N'Z96', N'Sự có mặt của thấu kính nội nhãn
', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (310, N'Z96.1', N'Sự có mặt của thấu kính nội nhãn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (360, N'A18.4', N'Lao da và mô dưới da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (362, N'A18.5', N'Lao ở mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (364, N'A30.0', N'Bệnh phong bất định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (366, N'A30.1', N'Bệnh phong thể củ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (368, N'A30.2', N'Bệnh phong thể củ ranh giới', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (370, N'A30.3', N'Bệnh phong thể ranh giới', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (372, N'A30.4', N'Bệnh phong thể u ranh giới', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (374, N'A30.5', N'Bệnh phong thể u ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (376, N'A30.8', N'Thể khác của bệnh phong', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (377, N'A30.9', N'Bệnh phong, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (378, N'A36.8', N'Bệnh bạch hầu khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (380, N'A39.8', N'Nhiễm não mô cầu khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (382, N'A50.0', N'Giang mai bẩm sinh sớm, có triệu chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (384, N'A50.3', N'Bệnh lý nhãn cầu do giang mai bẩm sinh muộn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (386, N'A51.4', N'Giang mai thứ phát khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (388, N'A52.1', N'Giang mai thần kinh có triệu chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (390, N'A52.7', N'Giang mai muộn khác, có triệu chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (392, N'A54.3', N'Bệnh lậu cầu ở mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (394, N'A66.0', N'Tổn thương ban đầu của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (396, N'A66.1', N'Đau nhú mềm và ghẻ cóc dạng u', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (398, N'A66.2', N'Tổn thương da sớm khác của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (400, N'A66.3', N'Tăng sừng hóa của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (402, N'A66.4', N'Gôm và loét của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (404, N'A66.5', N'Bệnh Gangosa (bệnh loét quanh mũi)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (406, N'A66.6', N'Tổn thương xương và khớp của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (408, N'A66.7', N'Biểu hiện khác của ghẻ cóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (410, N'A66.8', N'Ghẻ cóc tiềm ẩn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (412, N'A66.9', N'Ghẻ cóc, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (413, N'B00.0', N'Chàm do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (415, N'B00.1', N'Viêm da rộp nước do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (417, N'B00.2', N'Viêm miệng - lợi và viêm amidan - hầu do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (419, N'B00.3', N'Viêm màng não do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (420, N'B00.4', N'Viêm não do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (422, N'B00.5', N'Bệnh mắt do virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (424, N'B00.7', N'Bệnh virus Herpes lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (426, N'B00.8', N'Dạng khác của nhiễm virus Herpes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (428, N'B00.9', N'Nhiễm Virus Herpes, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (430, N'B01.0', N'Viêm màng não do thủy đậu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (432, N'B01.1', N'Viêm não do thủy đậu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (434, N'B01.2', N'Viêm phổi do thủy đậu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (435, N'B01.8', N'Thủy đậu với biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (436, N'B01.9', N'Thủy đậu không biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (438, N'B02.0', N'Viêm não do Zoster', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (440, N'B02.1', N'Viêm màng não do Zoster', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (441, N'B02.2', N'Tổn thương hệ thần kinh khác do zoster', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (443, N'B02.3', N'Bệnh mắt do Zoster', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (445, N'B05.8', N'Sởi và biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (447, N'B06.0', N'Bệnh rubella với biến chứng thần kinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (449, N'B06.8', N'Bệnh rubella với biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (451, N'B06.9', N'Bệnh rubella không có biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (453, N'B07', N'Bệnh mụn cóc do virus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (455, N'B08.0', N'Nhiễm orthopoxvirus khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (457, N'B08.1', N'U mềm lây', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (458, N'B08.2', N'Phát ban đột ngột [bệnh thứ sáu]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (459, N'B08.3', N'Ban đỏ truyền nhiễm [bệnh thứ năm]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (460, N'B08.8', N'Nhiễm virus xác định khác có biểu hiện tổn thương tại da và niêm mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (462, N'B09', N'Nhiễm virus không xác định, có biểu hiện tổn thương tại da và niêm mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (464, N'B15.0', N'Viêm gan A có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (465, N'B15.9', N'Viêm gan A không có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (467, N'B16.0', N'Viêm gan B cấp có đồng nhiễm virus viêm gan D, có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (468, N'B16.1', N'Viêm gan B cấp có đồng nhiễm virus viêm gan D, không có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (469, N'B16.2', N'Viêm gan B cấp, không có tác nhân delta, có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (470, N'B16.9', N'Viêm gan B cấp, không có đồng nhiễm virus viêm gan D, và không có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (472, N'B17.0', N'Viêm gan D cấp tính bội nhiễm trên người mang viêm gan B', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (473, N'B17.1', N'Viêm gan C cấp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (474, N'B17.2', N'Viêm gan E cấp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (475, N'B17.8', N'Viêm gan virus cấp xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (477, N'B17.9', N'Viên gan virus cấp, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (479, N'B18.0', N'Viêm gan virus B mạn, có đồng nhiễm viêm gan virus D', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (480, N'B18.1', N'Viêm gan virus B mạn, không có đồng nhiễm viêm gan virus D', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (482, N'B18.2', N'Viêm gan virut C mạn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (483, N'B18.8', N'Viêm gan virus mạn khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (484, N'B18.9', N'Viêm gan virus mạn, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (485, N'B19.0', N'Viêm gan virus không đặc hiệu, có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (486, N'B19.9', N'Viêm gan virus không đặc hiệu, không có hôn mê gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (488, N'B20', N'Bệnh HIV dẫn đến bệnh nhiễm trùng và ký sinh trùng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (489, N'B21', N'Bệnh HIV gây u ác tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (490, N'B22', N'Bệnh HIV dẫn đến các bệnh xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (491, N'B23.0', N'Hội chứng nhiễm HIV cấp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (492, N'B23.8', N'Bệnh HIV dẫn đến các tình trạng xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (494, N'B24', N'Bệnh do HIV không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (496, N'B25.0', N'Viêm phổi do cytomegalovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (497, N'B25.1', N'Viêm gan do cytomegalovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (498, N'B25.2', N'Viêm tụy do cytomegalovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (499, N'B25.8', N'Bệnh khác do cytomegalovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (500, N'B25.9', N'Bệnh do cytomegalovirus, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (501, N'B26.0', N'Viêm tinh hoàn do quai bị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (502, N'B26.1', N'Viêm màng não do quai bị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (503, N'B26.2', N'Viêm não do quai bị', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (504, N'B26.3', N'Viêm tụy do quai bị', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (505, N'B26.8', N'Bệnh quai bị với biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (507, N'B26.9', N'Bệnh quai bị không biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (509, N'B27.0', N'Bệnh tăng bạch cầu đơn nhân do virus Herpes gamma', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (511, N'B27.1', N'Bệnh tăng bạch cầu đơn nhân do virus đại bào', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (512, N'B27.8', N'Bệnh tăng bạch cầu đơn nhân nhiễm trùng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (513, N'B27.9', N'Bệnh tăng bạch cầu đơn nhân nhiễm trùng, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (514, N'B30.0', N'Viêm kết - giác mạc do adenovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (516, N'B30.1', N'Viêm kết mạc do adenovirus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (518, N'B30.2', N'Viêm hầu - kết mạc do virus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (519, N'B30.3', N'Viêm kết mạc gây dịch xuất huyết cấp (do virus đường ruột)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (521, N'B30.8', N'Viêm kết mạc do virus khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (523, N'B30.9', N'Viêm kết mạc do virus, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (524, N'B33.0', N'Bệnh đau cơ gây dịch', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (526, N'B33.1', N'Bệnh Ross River', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (528, N'B33.2', N'Viêm tim do virus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (529, N'B33.3', N'Nhiễm Retrovirus, chưa được phân loại', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (531, N'B33.4', N'Hội chứng tim- phổi do Hanta virus [HPS] [HCPS]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (533, N'B33.8', N'Bệnh do virus xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (534, N'B34.0', N'Nhiễm adenovirus, vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (535, N'B34.1', N'Nhiễm virus đường ruột, vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (537, N'B34.2', N'Nhiễm coronavirus, vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (538, N'B34.3', N'Nhiễm Parvovirus, vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (539, N'B34.4', N'Nhiễm Papovavirus, vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (540, N'B34.8', N'Nhiễm virus khác ở vị trí không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (541, N'B34.9', N'Nhiễm virus, không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (543, N'B35.0', N'Bệnh nấm ở cằm và nấm da đầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (545, N'B35.1', N'Nấm móng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (547, N'B35.2', N'Bệnh nấm da bàn tay', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (549, N'B35.3', N'Bệnh nấm da chân', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (551, N'B35.4', N'Bệnh nấm da thân', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (553, N'B35.5', N'Bệnh nấm da vảy xếp lớp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (555, N'B35.6', N'Bệnh nấm da đùi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (557, N'B35.8', N'Bệnh nấm da khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (559, N'B35.9', N'Other dermatophytoses', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (561, N'B36.0', N'Bệnh lang ben', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (563, N'B36.1', N'Bệnh nấm da có thương tổn màu đen', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (565, N'B36.2', N'Bệnh nấm do Trichosporum cuteneum (râu, lông)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (567, N'B36.3', N'Bệnh nấm trứng đen (tóc)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (568, N'B36.8', N'Bệnh nấm nông xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (569, N'B36.9', N'Bệnh nấm nông, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (570, N'B37.0', N'Viêm miệng do candida', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (572, N'B37.1', N'Nhiễm candida phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (573, N'B37.2', N'Nhiễm candida da và móng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (575, N'B37.3', N'Nhiễm candida âm hộ và âm đạo', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (577, N'B37.4', N'Nhiễm candida ở vị trí giữa tiết niệu âm đạo khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (579, N'B37.5', N'Viêm màng não do candida', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (580, N'B37.6', N'Viêm nội tâm mạc do candida', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (581, N'B37.7', N'Nhiễm trùng huyết do candida', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (582, N'B37.81', N'NA', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (583, N'B37.88', N'Nhiễm candida ở vị trí khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (584, N'B37.9', N'Nhiễm candida không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (586, N'B38.0', N'Nhiễm nấm coccidioides ở phổi cấp tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (587, N'B38.1', N'Nhiễm nấm coccidioides ở phổi mãn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (588, N'B38.2', N'Nhiễm nấm coccidioides ở phổi, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (589, N'B38.3', N'Nhiễm nấm coccidioides ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (590, N'B38.4', N'Viêm màng não do nấm coccidioides', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (591, N'B38.7', N'Nhiễm nấm coccidioides lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (593, N'B38.8', N'Dạng khác của nhiễm nấm coccidioides', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (594, N'B38.9', N'Nhiễm nấm coccidioides, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (595, N'B39.0', N'Nhiễm histoplasma capsulatum ở phổi cấp tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (596, N'B39.1', N'Nhiễm histoplasma capsulatum ở phổi mãn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (597, N'B39.2', N'Nhiễm histoplasma capsulatum ở phổi, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (598, N'B39.3', N'Nhiễm histoplasma capsulatum lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (600, N'B39.4', N'Nhiễm histoplasma capsulatum, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (602, N'B39.5', N'Nhiễm histoplasma duboisii', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (604, N'B39.9', N'Nhiễm histoplasma, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (605, N'B40.0', N'Nhiễm nấm blastomyces ở phổi cấp tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (606, N'B40.1', N'Nhiễm nấm blastomyces ở phổi mãn tính', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (607, N'B40.2', N'Nhiễm nấm blastomyces ở phổi, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (608, N'B40.3', N'Nhiễm nấm blastomyces ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (609, N'B40.7', N'Nhiễm nấm blastomyces lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (611, N'B40.8', N'Dạng khác của nhiễm nấm blastomyces', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (612, N'B40.9', N'Nhiễm nấm blastomyces, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (613, N'B41.0', N'Nhiễm nấm paracoccidioides ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (614, N'B41.7', N'Nhiễm nấm paracoccidioides lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (616, N'B41.8', N'Dạng khác của nhiễm nấm paracoccidioides', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (617, N'B41.9', N'Nhiễm nấm paracoccidioides, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (618, N'B42.0', N'Nhiễm sporotrichum ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (619, N'B42.1', N'Nhiễm sporotrichum da - bạch huyết', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (620, N'B42.7', N'Nhiễm sporotrichum lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (622, N'B42.8', N'Dạng khác của nhiễm sporotrichum', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (623, N'B42.9', N'Nhiễm sporotrichum, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (624, N'B43.0', N'Nhiễm nấm chromoblastomycosa ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (626, N'B43.1', N'Áp xe não do phaeomyces', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (628, N'B43.2', N'Nang và áp xe dưới da do phaeomyces', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (629, N'B43.8', N'Dạng khác của nhiễm nấm chromoblastomycosa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (630, N'B43.9', N'Nhiễm nấm chromoblastomycosa, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (631, N'B44.0', N'Nhiễm aspergillus ở phổi xâm lấn', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (632, N'B44.1', N'Nhiễm aspergillus ở phổi khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (633, N'B44.2', N'Nhiễm aspergillus ở hạnh nhân', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (634, N'B44.7', N'Nhiễm aspergillus lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (636, N'B44.8', N'Dạng khác của nhiễm aspergillus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (637, N'B44.9', N'Nhiễm aspergillus không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (638, N'B45.0', N'Nhiễm cryptococcus ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (639, N'B45.1', N'Nhiễm cryptococcus ở não', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (641, N'B45.2', N'Nhiễm cryptococcus ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (642, N'B45.3', N'Nhiễm cryptococcus ở xương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (643, N'B45.7', N'Nhiễm cryptococcus lan tỏa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (645, N'B45.8', N'Dạng khác của nhiễm cryptococcus', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (646, N'B45.9', N'Nhiễm cryptococcus, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (647, N'B46.0', N'Nhiễm mucor ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (648, N'B46.1', N'Nhiễm mucor ở mũi - não', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (649, N'B46.2', N'Nhiễm mucor ở đường tiêu hóa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (650, N'B46.3', N'Nhiễm mucor ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (652, N'B46.4', N'Nhiễm mucor lan toả', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (654, N'B46.5', N'Nhiễm mucor, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (655, N'B46.8', N'Nhiễm zygomycetes khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (657, N'B46.9', N'Nhiễm zygomycetes, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (659, N'B47.0', N'U do eumycetes', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (661, N'B47.1', N'U do actinomyces', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (662, N'B47.9', N'U nấm, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (664, N'B48.0', N'Nhiễm nấm lobo', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (666, N'B48.1', N'Nhiễm rhinosporidium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (667, N'B48.2', N'Nhiễm allesscheria', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (669, N'B48.3', N'Nhiễm geotrichum', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (671, N'B48.4', N'Nhiễm penicillium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (672, N'B48.5', N'NA', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (674, N'B48.7', N'Nhiễm nấm cơ hội', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (676, N'B48.8', N'Nhiễm nấm xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (678, N'B49', N'Nhiễm nấm không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (680, N'B50.0', N'Sốt rét Plasmodium falciparum với biến chứng não', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (682, N'B50.8', N'Sốt rét Plasmodium falciparum thể nặng và biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (684, N'B50.9', N'Sốt rét Plasmodium falciparum, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (685, N'B51.0', N'Sốt rét Plasmodium vivax với vỡ lách', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (686, N'B51.8', N'Sốt rét Plasmodium vivax với biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (687, N'B51.9', N'Sốt rét Plasmodium vivax không biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (689, N'B52.0', N'Sốt rét Plasmodium malariae với bệnh lý thận', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (690, N'B52.8', N'Sốt rét Plasmodium malariae với biến chứng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (691, N'B52.9', N'Sốt rét Plasmodium malariae không biến chứng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (693, N'B53.0', N'Sốt rét Plasmodium ovale', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (694, N'B53.8', N'Sốt rét do plasmodia ở khỉ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (695, N'B53.9', N'Sốt rét khác xác nhận bằng ký sinh trùng học, chưa được phân loại', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (697, N'B54', N'Sốt rét không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (699, N'B55.0', N'Bệnh do leishmania nội tạng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (701, N'B55.1', N'Bệnh do leishmania da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (702, N'B55.2', N'Bệnh do leishmania da niêm mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (703, N'B55.9', N'Bệnh do leishmania, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (704, N'B56.0', N'Bệnh do Trypanosoma gambiense', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (706, N'B56.1', N'Bệnh do Trypanosoma rhodesiense', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (708, N'B56.9', N'Bệnh do trypanosoma châu Phi, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (710, N'B57.0', N'Bệnh Chagas cấp ảnh hưởng đến tim', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (712, N'B57.1', N'Bệnh Chagas cấp không ảnh hưởng đến tim', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (714, N'B57.2', N'Bệnh Chagas (mãn tính) ảnh hưởng đến tim', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (716, N'B57.3', N'Bệnh Chagas (mãn tính) ảnh hưởng đến hệ tiêu hóa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (717, N'B57.4', N'Bệnh Chagas (mãn tính) ảnh hưởng đến hệ thần kinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (718, N'B57.5', N'Bệnh Chagas (mãn tính) ảnh hưởng đến cơ quan khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (719, N'B58.0', N'Bệnh lý mắt do toxoplasma', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (721, N'B58.1', N'Viêm gan do toxoplasma', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (722, N'B58.2', N'Viêm não màng não do toxoplasma', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (723, N'B58.3', N'Bệnh do toxoplasma ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (724, N'B58.8', N'Bệnh do toxoplasma có ảnh hưởng đến cơ quan khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (726, N'B58.9', N'Bệnh do toxoplasma, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (727, N'B60.0', N'Bệnh do babesia', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (729, N'B60.1', N'Bệnh do acanthamoeba', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (731, N'B60.2', N'Bệnh do naegleria', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (733, N'B60.8', N'Bệnh do ký sinh trùng đơn bào, xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (734, N'B64', N'Bệnh do ký sinh trùng đơn bào không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (735, N'B65.0', N'Bệnh sán máng do Schistosoma haematobium [bệnh sán máng đường tiết niệu]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (736, N'B65.1', N'Bệnh sán máng do Schistosoma mansoni [bệnh sán máng đường ruột]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (737, N'B65.2', N'Bệnh sán máng do Schistosoma japonicum', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (739, N'B65.3', N'Viêm da do ấu trùng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (741, N'B65.8', N'Bệnh sán máng khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (743, N'B65.9', N'Bệnh sán máng, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (744, N'B66.0', N'Bệnh sán lá gan Opisthorchis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (746, N'B66.1', N'Bệnh sán lá gan nhỏ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (748, N'B66.2', N'Bệnh sán Dicrocoelium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (750, N'B66.3', N'Bệnh Fasciola', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (752, N'B66.4', N'Bệnh sán Paragonimus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (754, N'B66.5', N'Bệnh do Fasciolopsis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (756, N'B66.8', N'Nhiễm sán lá xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (758, N'B66.9', N'Bệnh sán lá, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (759, N'B67.0', N'Nhiễm Echinococcus granulosus ở gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (760, N'B67.1', N'Nhiễm Echinococcus granulosus ở phổi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (761, N'B67.2', N'Nhiễm Echinococcus granulosus ở xương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (762, N'B67.3', N'Nhiễm Echinococcus granulosus, vị trí khác và nhiều vị trí', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (763, N'B67.4', N'Nhiễm Echinococcus granulosus, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (764, N'B67.5', N'Nhiễm Echinococcus multilocularis ở  gan', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (765, N'B67.6', N'Nhiễm Echinococcus multilocularis vị trí khác và nhiều vị trí', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (766, N'B67.7', N'Nhiễm Echinococcus multilocularis không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (767, N'B67.8', N'Bệnh do sán echinococcus ở gan, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (768, N'B67.9', N'Nhiễm ấu trùng sán echinococcus, khác và không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (770, N'B68.0', N'Bệnh sán Taenia solium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (772, N'B68.1', N'Bệnh sán Taenia saginata', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (774, N'B68.9', N'Bệnh sán Taenia, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (775, N'B69.0', N'Bệnh ấu trùng sán lợn ở hệ thần kinh trung ương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (776, N'B69.1', N'Bệnh ấu trùng sán lợn ở mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (777, N'B69.8', N'Bệnh ấu trùng sán lợn ở vị trí khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (778, N'B69.9', N'Bệnh ấu trùng sán lợn, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (779, N'B70.0', N'Bệnh sán diphyllobothrium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (781, N'B70.1', N'Bệnh sán spargamum', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (783, N'B71.0', N'Bệnh sán dây nhỏ hymenolepis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (785, N'B71.1', N'Bệnh sán dipylium', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (786, N'B71.8', N'Nhiễm sán dây xác định khác ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (788, N'B71.9', N'Nhiễm sán dây không đặc hiệu ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (789, N'B72', N'Bệnh giun Dracunculus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (791, N'B73', N'Bệnh giun chỉ ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (793, N'B74.0', N'Bệnh giun chỉ do Wuchereria bancrofti', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (795, N'B74.1', N'Bệnh giun chỉ do Brugia malayi', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (796, N'B74.2', N'Bệnh giun chỉ do Brugia malayi', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (797, N'B74.3', N'Bệnh giun chỉ Loa loa', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (799, N'B74.4', N'Bệnh giun chỉ Mansonella', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (801, N'B74.8', N'Bệnh giun chỉ khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (803, N'B74.9', N'Bệnh giun chỉ, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (804, N'B75', N'Bệnh giun xoắn Trichinella', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (806, N'B76.0', N'Bệnh giun ancylostoma', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (808, N'B76.1', N'Bệnh giun necator ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (810, N'B76.8', N'Bệnh giun móc khác ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (811, N'B76.9', N'Bệnh giun móc, không đặc hiệu ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (813, N'B77.0', N'Bệnh giun đũa với biến chứng đường ruột ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (814, N'B77.8', N'Bệnh giun đũa với biến chứng khác ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (815, N'B77.9', N'Bệnh giun đũa, không đặc hiệu ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (816, N'B78.0', N'Bệnh giun lươn đường ruột ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (817, N'B78.1', N'Bệnh giun lươn ở da ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (818, N'B78.7', N'Bệnh giun lan toả ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (819, N'B78.9', N'Bệnh giun lươn, không đặc hiệu ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (820, N'B79', N'Bệnh giun tóc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (822, N'B80', N'Bệnh giun kim', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (824, N'B81.0', N'Bệnh giun anisakis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (826, N'B81.1', N'Bệnh giun capillaria đường ruột', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (828, N'B81.2', N'Bệnh giun trichostrongylus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (829, N'B81.3', N'Bệnh giun angiostrongylus đường ruột', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (831, N'B81.4', N'Bệnh angiostrongylus do Parastrongylus costaricensis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (833, N'B81.8', N'Bệnh giun sán đường ruột xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (835, N'B82.0', N'Bệnh giun sán đường ruột không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (836, N'B82.9', N'Nhiễm ký sinh trùng đường ruột không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (837, N'B83.0', N'Ấu trùng di chuyển nội tạng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (839, N'B83.1', N'Nhiễm giun đầu gai (Gnathostoma)', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (841, N'B83.2', N'Bệnh giun angiostrongylus do Parastrongylus cantonensis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (843, N'B83.3', N'Nhiễm giun syngamia', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (845, N'B83.4', N'Bệnh đỉa nội tạng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (846, N'B83.8', N'Bệnh giun sán đặc hiệu khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (848, N'B83.9', N'Bệnh giun sán không đặc hiệu ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (850, N'B85.0', N'Bệnh chấy rận do Pediculus humanus capitis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (852, N'B85.1', N'Bệnh chấy rận do Pediculus humanus corporis', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (854, N'B85.2', N'Bệnh chấy rận, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (855, N'B85.3', N'Bệnh chấy rận', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (857, N'B85.4', N'Bệnh chấy rận phối hợp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (859, N'B86', N'Bệnh ghẻ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (861, N'B87.0', N'Bệnh giòi ở da', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (863, N'B87.1', N'Bệnh giòi trên vết thương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (865, N'B87.2', N'Bệnh giòi ở mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (866, N'B87.3', N'Bệnh giòi ở mũi họng', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (868, N'B87.4', N'Bệnh giòi ở tai', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (869, N'B87.8', N'Bệnh giòi ở vị trí khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (871, N'B87.9', N'Bệnh giòi không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (872, N'B88.0', N'Các bệnh do ve khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (874, N'B88.1', N'Nhiễm do bọ tunga [nhiễm do bọ chét cái]', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (875, N'B88.2', N'Nhiễm ký sinh trùng do tiết túc khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (877, N'B88.3', N'Bệnh do đỉa ngoại ký sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (879, N'B88.8', N'Nhiễm ký sinh trùng xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (881, N'B88.9', N'Nhiễm ký sinh trùng, không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (883, N'B89', N'Bệnh do ký sinh trùng không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (884, N'B90.0', N'Di chứng do lao hệ thần kinh trung ương', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (885, N'B90.1', N'Di chứng do lao tiết niệu - sinh dục', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (886, N'B90.2', N'Di chứng do lao xương và khớp', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (887, N'B90.8', N'Di chứng do lao cơ quan khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (888, N'B90.9', N'Di chứng do lao hô hấp và bệnh lao không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (890, N'B91', N'Di chứng do bại liệt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (891, N'B92', N'Di chứng do phong', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (892, N'B94.0', N'Di chứng bệnh mắt hột', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (893, N'B94.1', N'Di chứng viêm não do virus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (894, N'B94.2', N'Di chứng viêm gan virus', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (895, N'B94.8', N'Di chứng của bệnh nhiễm trùng và ký sinh trùng xác định khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (896, N'B94.9', N'Di chứng của bệnh nhiễm trùng và ký sinh trùng không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (897, N'B95.0', N'Liên cầu, nhóm A, là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (898, N'B95.1', N'Liên cầu, nhóm B, là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (899, N'B95.2', N'Liên cầu, nhóm D, là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (900, N'B95.3', N'Phế cầu là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (901, N'B95.41', N'Liên cầu, nhóm C, là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (902, N'B95.42', N'Liên cầu, nhóm G, là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (903, N'B95.48', N'Liên cầu khác là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (904, N'B95.5', N'Liên cầu không xác định là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (905, N'B95.6', N'Tụ cầu vàng là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (906, N'B95.7', N'Tụ cầu khác là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (907, N'B95.8', N'Tụ cầu không xác định là nguyên nhân gây các bệnh phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (908, N'B96.0', N'Mycoplasma pneumoniae [M. pneumoniae] gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (910, N'B96.1', N'Klebsiella pneumoniae [K. pneumoniae] gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (911, N'B96.2', N'Escherichia coli [E. coli] gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (912, N'B96.31', N'Haemophilus influenzae [H. influenzae] nhóm B gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (913, N'B96.38', N'Haemophilus influenzae [H. influenzae], nhóm khác, gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (914, N'B96.39', N'Haemophilus influenzae [H. influenzae], không rõ chủng nhóm, gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (915, N'B96.4', N'Proteus (mirabilis)(morganii) gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (916, N'B96.5', N'Pseudomonas (aeruginosa) gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (917, N'B96.6', N'Bacillus fragilis [B. fragilis] gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (918, N'B96.7', N'Clostridium perfringens [C. Perfringens] gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (919, N'B96.81', N'NA', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (921, N'B96.82', N'NA', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (922, N'B96.88', N'NA', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (924, N'B97.0', N'Adenovirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (925, N'B97.1', N'Enterovirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (927, N'B97.2', N'Coronavirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (928, N'B97.3', N'Retrovirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (930, N'B97.4', N'Virus hợp bào đường hô hấp gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (931, N'B97.5', N'Reovirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (932, N'B97.6', N'Parvovirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (933, N'B97.7', N'Papillomavirus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (935, N'B97.8', N'Các virus gây các bệnh đã được phân loại ở chương khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (937, N'B99', N'Các bệnh nhiễm trùng khác và không xác định', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (938, N'E10.31', N'Type 1 diabetes mellitus with background retinopathy ', 1)
GO
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (940, N'E10.32', N'Type 1 diabetes mellitus with preproliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (942, N'E10.33', N'Type 1 diabetes mellitus with proliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (944, N'E10.34', N'Type 1 diabetes mellitus with other retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (946, N'E10.35', N'Type 1 diabetes mellitus with advanced ophthalmic diseases', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (948, N'E10.36', N'Type 1 diabetes mellitus with diabetic cataract', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (949, N'E10.39', N'Type 1 diabetes mellitus with other specific opthalmic complication', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (951, N'E11.31', N'Type 2 diabetes mellitus with background retinopathy ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (953, N'E11.32', N'Type 2 diabetes mellitus with preproliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (955, N'E11.33', N'Type 2 diabetes mellitus with proliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (957, N'E11.34', N'Type 2 diabetes mellitus with other retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (959, N'E11.35', N'Type 2 diabetes mellitus with advanced ophthalmic diseases', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (961, N'E11.36', N'Type 2 diabetes mellitus with diabetic cataract', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (962, N'E11.39', N'Type 2 diabetes mellitus with other specific opthalmic complication', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (964, N'E13.31', N'Other specified diabetes mellitus with background retinopathy ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (966, N'E13.32', N'Other specified diabetes mellitus with preproliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (968, N'E13.33', N'Other specified diabetes mellitus with proliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (970, N'E13.34', N'Other specified diabetes mellitus with other retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (972, N'E13.35', N'Other specified diabetes mellitus with advanced ophthalmic diseases', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (974, N'E13.36', N'Other specified diabetes mellitus with diabetic cataract', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (975, N'E13.39', N'Other specified diabetes mellitus with other specific opthalmic compliation', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (977, N'E14.31', N'Unspecified diabetes mellitus with background retinopathy ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (979, N'E14.32', N'Unspecified diabetes mellitus with preproliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (981, N'E14.33', N'Unspecified diabetes mellitus with proliferative retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (983, N'E14.34', N'Unspecified diabetes mellitus with other retinopathy', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (985, N'E14.35', N'Unspecified diabetes mellitus with advanced ophthalmic diseases', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (987, N'E14.36', N'Unspecified diabetes mellitus with diabetic cataract', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (988, N'E14.39', N'Unspecified diabetes mellitus with other specific opthalmic complication', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (990, N'Q10.0', N'Sụp mí bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (991, N'Q10.1', N'Lộn mí bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (992, N'Q10.2', N'Quặm bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (993, N'Q10.3', N'Cách dị tật mí mắt bẩm sinh khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (995, N'Q10.4', N'Không có hoặc vô sản bộ phận liên quan đến nước mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (997, N'Q10.5', N'Hẹp hoặc chít hẹp bẩm sinh ống dẫn lệ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (998, N'Q10.6', N'Các dị tật bẩm sinh khác của ống dẫn lệ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1000, N'Q10.7', N'Dị tật bẩm sinh hố mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1001, N'Q11.0', N'Cystic eyeball', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1002, N'Q11.1', N'Các tật không có mắt khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1004, N'Q11.2', N'Dị tật mắt bé', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1006, N'Q11.3', N'Dị tật mắt to', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1007, N'Q12.0', N'Đục thủy tinh thể bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1008, N'Q12.1', N'Lệch thủy tinh thể bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1009, N'Q12.2', N'khuyết thủy tinh thể ', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1010, N'Q12.3', N'Thiếu thủy tinh thể bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1011, N'Q12.4', N'Thủy tinh thể hình cầu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1012, N'Q12.8', N'Các dị tật bẩm sinh khác của thủy tinh thể', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1013, N'Q12.9', N'Các dị tật thủy tinh thể bẩm sinh không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1014, N'Q13.0', N'Tật khuyết mống mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1016, N'Q13.1', N'Tật không có mống mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1018, N'Q13.2', N'Các dị tật bẩm sinh khác của mống mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1020, N'Q13.3', N'Đục giác mạc bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1022, N'Q13.40', N'Dị tật bẩm sinh của giác mạc KXĐK', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1023, N'Q13.41', N'Giác mạc bé
Dị tật Peter', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1025, N'Q13.49', N'Các dị tật bẩm sinh khác của giác mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1027, N'Q13.5', N'Củng mạc xanh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1028, N'Q13.8', N'Các dị tật bẩm sinh khác ở phần trước của mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1030, N'Q13.9', N'Dị tật bẩm sinh phần trước không đặc hiệu', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1031, N'Q14.0', N'Dị tật bẩm sinh thủy tinh dịch', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1033, N'Q14.1', N'Dị tật bẩm sinh võng mạc', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1035, N'Q14.2', N'Dị tật bẩm sinh đĩa thị giác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1037, N'Q14.3', N'Dị tật bẩm sinh màng mạch', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1038, N'Q14.8', N'Các dị tật bẩm sinh khác ở phần sau của mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1040, N'Q14.9', N'Dị tật bẩm sinh không đặc hiệu ở phần sau của mắt', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1041, N'Q15.0', N'Glocom (tăng nhãn áp) bẩm sinh', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1043, N'Q15.8', N'Các dị tật bẩm sinh mắt đặc hiệu khác', 1)
INSERT [dbo].[ICDDx] ([ID], [Code], [Description], [StatusID]) VALUES (1045, N'Q15.9', N'Dị tật bẩm sinh mắt không đặc hiệu', 1)
SET IDENTITY_INSERT [dbo].[ICDDx] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (2009, N'Penisilin 10mg', N'Penisilin 10mg', 3, 1, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (2010, N'Penisilin 300mg', N'Penisilin 400mg', 4, 1, 6, 1, 1, 1, 5, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (2011, N'Fluoritant 200mg', N'Viên Fluoritant 200mg', 3, 1, 1, 3, 10, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (2012, N'Viên Glutomin 200mg', N'Viên Glutomin 200mg', 3, 12, 1, 32, 1, 12, 1, -1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3012, N'Eporon 5ml', N'Fluorometholone 1mg/ml', 2, 1, 2, 4, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3013, N'Eporon 45ml', N'Eporon 45ml', 2, 1, 2, 2, 2, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3014, N'EyeDrops', N'EyeDrops', 2, 1, 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3015, N'Lacrifresh 0.1% 4ml ', N'Thuốc', 2, 1, 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3016, N'SuperKan F 80mg', N'thuốc viên', 1, 3, 8, 3, 1, 3, 7, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3017, N'Diquas 3% 5ml', N'thuốc nhỏ', 2, 1, 2, 3, 1, 1, 4, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3018, N'Alaxan', N'Thuốc uống', 1, 3, 8, 2, 1, 1, 3, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3019, N'Test thuoc', N'test', 5, 1, 5, 1, 1, 1, 3, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3020, N'Panadol', N'Trị đau nhức êyyy', 1, 1, 8, 1, 1, 1, 7, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (3021, N'Flurotomin', N'Flurotomin 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4020, N'3Bsg', N'3Bs', 1, 1, 1, 1, 1, 1, 1, -1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4021, N'Acemol 325mg', N'Acemol 325mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4022, N'Acetazolamid 250mg', N'Acetazolamid 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4023, N'Acid folic 5mg', N'Acid folic 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4024, N'Acizin 250mg', N'Acizin 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4025, N'Acular 5ml', N'Acular 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4026, N'Acuvail 0,4ml', N'Acuvail 0,4ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4027, N'Acyclovir 200mg', N'Acyclovir 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4028, N'Acyclovir 400mg', N'Acyclovir 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4029, N'Acyclovir 5% Pde', N'Acyclovir 5% Pde', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4030, N'Acyclovir 800mg', N'Acyclovir 800mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4031, N'Adrenalin 1mg/ml', N'Adrenalin 1mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4032, N'Alaxan', N'Alaxan', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4033, N'Albendazole 400mg', N'Albendazole 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4034, N'Alegysal 0,1% 5ml', N'Alegysal 0,1% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4035, N'Alegysal 0,1% 5ml', N'Alegysal 0,1% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4036, N'Alegysal 0,1% 5ml', N'Alegysal 0,1% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4037, N'Alomide 0.1%', N'Alomide 0.1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4038, N'Alphachymotrypsine Choay 21µK', N'Alphachymotrypsine Choay 21µK', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4039, N'Alphagan 0.15% 5ml', N'Alphagan 0.15% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4040, N'Alphagan 0.2% 5ml', N'Alphagan 0.2% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4041, N'Alphagan P 0,15% 5ml', N'Alphagan P 0,15% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4042, N'Alphagan-P 0.15%', N'Alphagan-P 0.15%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4043, N'Alphatrypa - DT 4,2 mg', N'Alphatrypa - DT 4,2 mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4044, N'Amoxiciline 500mg', N'Amoxiciline 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4045, N'Amoxiciline 250mg', N'Amoxiciline 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4046, N'Aquamax Bio 6ml', N'Aquamax Bio 6ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4047, N'Arginine 400mg', N'Arginine 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4048, N'Aspirin 81mg', N'Aspirin 81mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4049, N'Aspirin pH8 500mg', N'Aspirin pH8 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4050, N'Atropine 0,5%', N'Atropine 0,5%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4051, N'Atropine 1%', N'Atropine 1%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4052, N'Atussin Syrup', N'Atussin Syrup', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4053, N'Augmentine gói 250mg', N'Augmentine gói 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4054, N'Augmentine gói 500mg', N'Augmentine gói 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4055, N'Augmentine viên 1mg', N'Augmentine viên 1mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4056, N'Augmenine viên 625mg', N'Augmenine viên 625mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4057, N'Aumnata 5% 5ml', N'Aumnata 5% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4058, N'Avastin 1.25mg/0.05ml', N'Avastin 1.25mg/0.05ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4059, N'Axaeye', N'Axaeye', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4060, N'Azarga 5ml', N'Azarga 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4061, N'Azathioprine 50mg', N'Azathioprine 50mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4062, N'Azicine 250mg', N'Azicine 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4063, N'Azimax 500mg', N'Azimax 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4064, N'Azithromycin 250mg', N'Azithromycin 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4065, N'Azithromycin 500mg', N'Azithromycin 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4066, N'Azopt 1%', N'Azopt 1%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4067, N'B - complex C', N'B - complex C', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4068, N'B complex C', N'B complex C', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4069, N'Bactrim', N'Bactrim', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4070, N'Bactrim 400/80mg', N'Bactrim 400/80mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4071, N'Beefloxacin 5ml', N'Beefloxacin 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4072, N'Besivance 5ml', N'Besivance 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4073, N'Betoptic-S 0.25%', N'Betoptic-S 0.25%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4074, N'Blefari TTO Gel', N'Blefari TTO Gel', 3, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4075, N'Blefari TTO Shampoo', N'Blefari TTO Shampoo', 13, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4076, N'Blefari TTO Swab', N'Blefari TTO Swab', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4077, N'Boganic', N'Boganic', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4078, N'Bromhexine 8mg', N'Bromhexine 8mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4079, N'Bromtab', N'Bromtab', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4080, N'Bronuck 0,1% 5ml', N'Bronuck 0,1% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4081, N'Brotilase', N'Brotilase', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4082, N'Butidec 5ml', N'Butidec 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4083, N'Calci D', N'Calci D', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4084, N'Calci sandoz 0.5g', N'Calci sandoz 0.5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4085, N'Calci sandoz 1g', N'Calci sandoz 1g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4086, N'Cataflam 25mg', N'Cataflam 25mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4087, N'Cationorm', N'Cationorm', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4088, N'Ceclin 100mg/5ml', N'Ceclin 100mg/5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4089, N'Ceclor 250mg', N'Ceclor 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4090, N'Ceeline', N'Ceeline', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4091, N'Cefaclor 250mg', N'Cefaclor 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4092, N'Cefalexin 0,5g', N'Cefalexin 0,5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4093, N'Cefixim 200mg', N'Cefixim 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4094, N'Cefixime 100mg', N'Cefixime 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4095, N'Cefuroxim 250mg', N'Cefuroxim 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4096, N'Cefuroxim 500mg', N'Cefuroxim 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4097, N'Cefuxin', N'Cefuxin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4098, N'Celecoxib 100mg', N'Celecoxib 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4099, N'Celestamin', N'Celestamin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4100, N'Cellcept 500mg', N'Cellcept 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4101, N'Cephalexin 250mg', N'Cephalexin 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4102, N'Cephalexin 500mg', N'Cephalexin 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4103, N'Cetirizine 10mg', N'Cetirizine 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4104, N'Cezil 10mg', N'Cezil 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4105, N'Cezil 5mg', N'Cezil 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4106, N'Chloramphenicol 0.4%', N'Chloramphenicol 0.4%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4107, N'Chlorpheniramin 4mg', N'Chlorpheniramin 4mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4108, N'Ciloxan 0.3%', N'Ciloxan 0.3%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4109, N'Cipro 500mg', N'Cipro 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4110, N'Cipro bay 500mg', N'Cipro bay 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4111, N'Ciprofloxacin 500mg', N'Ciprofloxacin 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4112, N'Circumax 120mg', N'Circumax 120mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4113, N'CL - NAC 5mg/ml', N'CL - NAC 5mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4114, N'Cladine 10mg', N'Cladine 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4115, N'Clamoxyl 250mg', N'Clamoxyl 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4116, N'Clavurem 625mg', N'Clavurem 625mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4117, N'Cloraxin 0.4%', N'Cloraxin 0.4%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4118, N'Combigan 5ml', N'Combigan 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4119, N'Corneregel 50mg', N'Corneregel 50mg', 3, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4120, N'Cotrimfort 960mg', N'Cotrimfort 960mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4121, N'Cravit 0,5%', N'Cravit 0,5%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4122, N'Cravit 0.5%', N'Cravit 0.5%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4123, N'Cravit 1,5%', N'Cravit 1,5%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4124, N'Cromal 2% 5ml', N'Cromal 2% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4125, N'Curam 1g', N'Curam 1g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4126, N'Curam 625mg', N'Curam 625mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4127, N'Cyclogyl 1%', N'Cyclogyl 1%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4128, N'Cyclophosphamide 50mg', N'Cyclophosphamide 50mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4129, N'Cyclosphosphamide 50mg', N'Cyclosphosphamide 50mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4130, N'Cyclosporin A 25mg', N'Cyclosporin A 25mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4131, N'Cyclosporin A 50mg', N'Cyclosporin A 50mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4132, N'Daigaku', N'Daigaku', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4133, N'Decontractyl 250mg', N'Decontractyl 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4134, N'Dematrix', N'Dematrix', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4135, N'Depo- Medrol 40mg/ml', N'Depo- Medrol 40mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4136, N'Dermatrix Ultra', N'Dermatrix Ultra', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4137, N'Destor 5mg', N'Destor 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4138, N'Dewoton', N'Dewoton', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4139, N'Dexamethasone 4mg/ml', N'Dexamethasone 4mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4140, N'Dextrose 5%', N'Dextrose 5%', 10, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4141, N'Diamox 250mg', N'Diamox 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4142, N'Diantalvic', N'Diantalvic', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4143, N'Diazepam 5mg', N'Diazepam 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4144, N'Diclofenac 75ng', N'Diclofenac 75ng', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4145, N'Difrarel E', N'Difrarel E', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4146, N'Disquas 3% 5ml', N'Disquas 3% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4147, N'Doxycycline 100mg', N'Doxycycline 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4148, N'Duotrav', N'Duotrav', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4149, N'Efferalgan - Codein', N'Efferalgan - Codein', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4150, N'Efferalgan 150mg', N'Efferalgan 150mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4151, N'Efferalgan 250mg', N'Efferalgan 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4152, N'Efferalgan 500mg', N'Efferalgan 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4153, N'Efticol 0,9%', N'Efticol 0,9%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4154, N'Enat 400UI', N'Enat 400UI', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4155, N'Endura 10mg', N'Endura 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4156, N'Enervon C', N'Enervon C', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4157, N'Enterogermina', N'Enterogermina', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4158, N'Eporon 5ml', N'Eporon 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4159, N'Erythromycin 250mg', N'Erythromycin 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4160, N'Erythromycin gói 125mg', N'Erythromycin gói 125mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4161, N'Erythromycin gói 250mg', N'Erythromycin gói 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4162, N'Exomuc 0.2g', N'Exomuc 0.2g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4163, N'Eyal-Q 10ml', N'Eyal-Q 10ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4164, N'Eyal-Q 5ml', N'Eyal-Q 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4165, N'Eyaren', N'Eyaren', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4166, N'Eye Cool', N'Eye Cool', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4167, N'Eye miru', N'Eye miru', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4168, N'EyeBi', N'EyeBi', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4169, N'EyeGiene Refill', N'EyeGiene Refill', 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4170, N'Eyegiene System', N'Eyegiene System', 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4171, N'Eyemiru Wash', N'Eyemiru Wash', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4172, N'Eyflox 0.3%', N'Eyflox 0.3%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4173, N'Eylea 40mg/mL', N'Eylea 40mg/mL', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4174, N'Eylevox 5mg/ml', N'Eylevox 5mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4175, N'Eyracin 3mg/ml', N'Eyracin 3mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4176, N'Eytanac 1mg/ml', N'Eytanac 1mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4177, N'Fexostad 180mg', N'Fexostad 180mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4178, N'Fexostad 60mg', N'Fexostad 60mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4179, N'Flagyl 500mg', N'Flagyl 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4180, N'Flumetholon 0.02%', N'Flumetholon 0.02%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4181, N'Flumetholon 0.02% 5ml', N'Flumetholon 0.02% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4182, N'Flumetholon 0.1%', N'Flumetholon 0.1%', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4183, N'Flumetholon 0.1% collyre', N'Flumetholon 0.1% collyre', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4184, N'FML Liquifilm 0,1% 5ml', N'FML Liquifilm 0,1% 5ml', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4185, N'Frakidex Pom Opht T/5G', N'Frakidex Pom Opht T/5G', 3, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4186, N'Franilax', N'Franilax', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4187, N'Fugacar 500mg', N'Fugacar 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4188, N'Fysoline', N'Fysoline', 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4189, N'Galepo', N'Galepo', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4190, N'Ganciclovir 2%', N'Ganciclovir 2%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4191, N'Ganciclovir 500mg', N'Ganciclovir 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4192, N'Ganfort 3ml', N'Ganfort 3ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4193, N'Gentamicine 0.3%', N'Gentamicine 0.3%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4194, N'Gentamycine 80mg/2ml', N'Gentamycine 80mg/2ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4195, N'Geotonik', N'Geotonik', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4196, N'Gilan Comfort', N'Gilan Comfort', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4197, N'Giloba 40mg', N'Giloba 40mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4198, N'Glucose 5%', N'Glucose 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4199, N'Govarom 5ml', N'Govarom 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4200, N'Grabos', N'Grabos', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4201, N'Herpacy opthalmic ointment', N'Herpacy opthalmic ointment', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4202, N'Hiruscar', N'Hiruscar', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4203, N'Hydrelo Eye Drops', N'Hydrelo Eye Drops', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4204, N'Hylene 5ml', N'Hylene 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4205, N'Ibuprofen 400mg', N'Ibuprofen 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4206, N'ICOOL', N'ICOOL', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4207, N'ILux', N'ILux', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4208, N'Indocollyre 0,1%', N'Indocollyre 0,1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4209, N'Indomethacine 25mg', N'Indomethacine 25mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4210, N'Iodum eye drops 3m/ml', N'Iodum eye drops 3m/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4211, N'Isopto Carpine 1%', N'Isopto Carpine 1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4212, N'Isopto Carpine 2%', N'Isopto Carpine 2%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4213, N'Itraconazole 100mg', N'Itraconazole 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4214, N'Itraconazole 100mg', N'Itraconazole 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4215, N'Ivermectine 6mg', N'Ivermectine 6mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4216, N'Ixantin', N'Ixantin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4217, N'K-cort 80mg/2ml', N'K-cort 80mg/2ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4218, N'Kaleorid LP 600mg', N'Kaleorid LP 600mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4219, N'Kary Uni 5ml', N'Kary Uni 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4220, N'Klamentin 250mg', N'Klamentin 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4221, N'Lacrifresh 0.1% 4ml', N'Lacrifresh 0.1% 4ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4222, N'Lacrifresh 15ml', N'Lacrifresh 15ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4223, N'Lacrinorm 0.2%', N'Lacrinorm 0.2%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4224, N'Lactated Ringer''s 500ml', N'Lactated Ringer''s 500ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4225, N'Lertazin 5mg', N'Lertazin 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4226, N'Lexomil 1.5mg', N'Lexomil 1.5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4227, N'Liposic 10g', N'Liposic 10g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4228, N'Logpatat', N'Logpatat', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4229, N'Loratadin 10mg', N'Loratadin 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4230, N'Lotemax 5ml', N'Lotemax 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4231, N'Lucentis 2.3mg/0.23ml', N'Lucentis 2.3mg/0.23ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4232, N'Luethin', N'Luethin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4233, N'Lumigan 0.01%', N'Lumigan 0.01%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4234, N'Lumigan 0.01% 3ml', N'Lumigan 0.01% 3ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4235, N'Lumigan 0.03%', N'Lumigan 0.03%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4236, N'Maalox', N'Maalox', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4237, N'Madecassol', N'Madecassol', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4238, N'Magie B6 corbiere', N'Magie B6 corbiere', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4239, N'Magie corbiere', N'Magie corbiere', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4240, N'Magné B6', N'Magné B6', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4241, N'Manitol 20%', N'Manitol 20%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4242, N'Maxgo Lutein', N'Maxgo Lutein', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4243, N'Maxitrol 5ml', N'Maxitrol 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4244, N'Maxitrol PD 3.5g', N'Maxitrol PD 3.5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4245, N'Mediclovir 3% 5g', N'Mediclovir 3% 5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4246, N'Medrol 16mg', N'Medrol 16mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4247, N'Medrol 4mg', N'Medrol 4mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4248, N'Meloxicam 7,5mg', N'Meloxicam 7,5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4249, N'Mestinon 60mg', N'Mestinon 60mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4250, N'Methotrexate 2.5 mg', N'Methotrexate 2.5 mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4251, N'Methylprednisolone 125mg', N'Methylprednisolone 125mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4252, N'Mg B6', N'Mg B6', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4253, N'Moisture', N'Moisture', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4254, N'Motilium-M', N'Motilium-M', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4255, N'Multivitamin', N'Multivitamin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4256, N'Mydocalm 150mg', N'Mydocalm 150mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4257, N'Mydriacyl 1%', N'Mydriacyl 1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4258, N'Mydrin-P 5ml', N'Mydrin-P 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4259, N'MYO Drops 0.01%', N'MYO Drops 0.01%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4260, N'Mytropine 0.01%', N'Mytropine 0.01%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4261, N'NaCl 3%', N'NaCl 3%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4262, N'NaCl 5%', N'NaCl 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4263, N'Natacyn 5%', N'Natacyn 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4264, N'Natadrop 5%', N'Natadrop 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4265, N'Natri Chloride 3%', N'Natri Chloride 3%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4266, N'Natri Chloride 5%', N'Natri Chloride 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4267, N'Natri Clorid 0.9% 10ml', N'Natri Clorid 0.9% 10ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4268, N'Nautamine 90mg', N'Nautamine 90mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4269, N'Neo-Codion', N'Neo-Codion', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4270, N'Neocin 5ml', N'Neocin 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4271, N'Neodex', N'Neodex', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4272, N'Neurobion', N'Neurobion', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4273, N'Nevanac 5ml', N'Nevanac 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4274, N'Nevramin', N'Nevramin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4275, N'Nifedipine 10mg', N'Nifedipine 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4276, N'Nizoral 200mg', N'Nizoral 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4277, N'Nootropil 800mg', N'Nootropil 800mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4278, N'Oculotect', N'Oculotect', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4279, N'OcuSoft Lid Scrub Plus', N'OcuSoft Lid Scrub Plus', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4280, N'Ocuvite', N'Ocuvite', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4281, N'Oflocet 200mg', N'Oflocet 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4282, N'Oflovid 0.3% 3.5g', N'Oflovid 0.3% 3.5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4283, N'Oflovid 0.3% 5ml', N'Oflovid 0.3% 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4284, N'Ofloxacin 200mg', N'Ofloxacin 200mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4285, N'Oftan Timolol 0.5% 5ml', N'Oftan Timolol 0.5% 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4286, N'Omega 3', N'Omega 3', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4287, N'Omega 3-6-9', N'Omega 3-6-9', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4288, N'Omeprazol 20mg', N'Omeprazol 20mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4289, N'Opcon A', N'Opcon A', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4290, N'Opticcome', N'Opticcome', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4291, N'Optive 15ml', N'Optive 15ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4292, N'Optive UD', N'Optive UD', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4293, N'Ospamox 250mg', N'Ospamox 250mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4294, N'Ospamox 500mg', N'Ospamox 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4295, N'Pamyltin 10mg', N'Pamyltin 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4296, N'Panadol 0.5g', N'Panadol 0.5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4297, N'Panadol viên sủi', N'Panadol viên sủi', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4298, N'Paracetamol 500mg', N'Paracetamol 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4299, N'Pataday 0.2%', N'Pataday 0.2%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4300, N'Patanol 0.1%', N'Patanol 0.1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4301, N'Peflacine 400mg', N'Peflacine 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4302, N'Philatonic', N'Philatonic', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4303, N'Phileo 5ml', N'Phileo 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4304, N'Philodex 5ml', N'Philodex 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4305, N'Phosphalugel', N'Phosphalugel', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4306, N'Physiodose 5ml', N'Physiodose 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4307, N'Pilocarpin 2%', N'Pilocarpin 2%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4308, N'Polaramine 2mg', N'Polaramine 2mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4309, N'Polaramine 6mg', N'Polaramine 6mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4310, N'Posicycline 1%', N'Posicycline 1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4311, N'Posod 10ml', N'Posod 10ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4312, N'Povidin 10%', N'Povidin 10%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4313, N'Povidin 5%', N'Povidin 5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4314, N'Pred Forte 1%', N'Pred Forte 1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4315, N'Prednisolon 5mg', N'Prednisolon 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4316, N'Prednisolone 5 mg', N'Prednisolone 5 mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4317, N'Prednisolone 5mg', N'Prednisolone 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4318, N'Primperan', N'Primperan', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4319, N'Ranitidine 150mg', N'Ranitidine 150mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4320, N'Refresh Plus', N'Refresh Plus', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4321, N'Refresh Tears', N'Refresh Tears', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4322, N'Relestat Opht 0.5mg/ml', N'Relestat Opht 0.5mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4323, N'Restasis 0.05%', N'Restasis 0.05%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4324, N'Rituximab 1mg/0.1ml', N'Rituximab 1mg/0.1ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4325, N'Rodogyl', N'Rodogyl', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4326, N'Rotifom 5mg/mL', N'Rotifom 5mg/mL', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4327, N'Rotundin 30mg', N'Rotundin 30mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4328, N'Roxithromycin 150mg', N'Roxithromycin 150mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4329, N'Rupafin 10mg', N'Rupafin 10mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4330, N'Rutine-C', N'Rutine-C', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4331, N'Salbutamol 2mg', N'Salbutamol 2mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4332, N'Samilflurone 0,1%', N'Samilflurone 0,1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4333, N'Sancoba 0,02%', N'Sancoba 0,02%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4334, N'Sanflin', N'Sanflin', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4335, N'Sanlein 0,1%', N'Sanlein 0,1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4336, N'Sanlein 0,3%', N'Sanlein 0,3%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4337, N'Sanlein mini', N'Sanlein mini', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4338, N'Sante Lutax 15mg', N'Sante Lutax 15mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4339, N'Sante Lutax 20mg', N'Sante Lutax 20mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4340, N'Scanax 500', N'Scanax 500', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4341, N'Scannax 500 mg', N'Scannax 500 mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4342, N'Seduxen 5mg', N'Seduxen 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4343, N'Simbrinza 5ml', N'Simbrinza 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4344, N'Skiacol Collyre F1/0.5ml', N'Skiacol Collyre F1/0.5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4345, N'Slagyll 500mg', N'Slagyll 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4346, N'Solu-Medro 500mg', N'Solu-Medro 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4347, N'Solupred 20mg', N'Solupred 20mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4348, N'Solupred 5mg', N'Solupred 5mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4349, N'Spironolactone 50mg', N'Spironolactone 50mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4350, N'Sporal 100mg', N'Sporal 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4351, N'Steroid tiêm cạnh cầu', N'Steroid tiêm cạnh cầu', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4352, N'Stugeron 25mg', N'Stugeron 25mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4353, N'SuperKan F 80mg', N'SuperKan F 80mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4354, N'SuperKan S 80mg', N'SuperKan S 80mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4355, N'Systane 15ml', N'Systane 15ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4356, N'Systane Ultra', N'Systane Ultra', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4357, N'Systane ultra UD', N'Systane ultra UD', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4358, N'Taflotan 2.5ml', N'Taflotan 2.5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4359, N'Taflotan -S', N'Taflotan -S', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4360, N'Tam Thất', N'Tam Thất', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4361, N'Tanakan 40mg', N'Tanakan 40mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4362, N'Tanganil 500mg', N'Tanganil 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4363, N'Taniki-fort 80mg', N'Taniki-fort 80mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4364, N'Taptiqom Vials 0.3ml', N'Taptiqom Vials 0.3ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4365, N'Tatanol 500mg', N'Tatanol 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4366, N'Taurifam', N'Taurifam', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4367, N'Taurine Solopharm 4%', N'Taurine Solopharm 4%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4368, N'Tear Natural II', N'Tear Natural II', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4369, N'Tearbalance 5ml', N'Tearbalance 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4370, N'Telfast 180mg', N'Telfast 180mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4371, N'Telfast 60mg', N'Telfast 60mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4372, N'Telodrop 15mL', N'Telodrop 15mL', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4373, N'Terpin Codein', N'Terpin Codein', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4374, N'Tetracyline 500mg', N'Tetracyline 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4375, N'Tetracyline Pde', N'Tetracyline Pde', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4376, N'Timolol 0,5%', N'Timolol 0,5%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4377, N'Timolol 0.25%', N'Timolol 0.25%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4378, N'Tobeta 5ml', N'Tobeta 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4379, N'Tobicom', N'Tobicom', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4380, N'Tobradex 3,5g', N'Tobradex 3,5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4381, N'Tobradex 5ml', N'Tobradex 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4382, N'Tobrex 3mg/ml', N'Tobrex 3mg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4383, N'Tobrex Pde', N'Tobrex Pde', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4384, N'Tobrex Pde', N'Tobrex Pde', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4385, N'Toeyecin 5ml', N'Toeyecin 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4386, N'Transamin 500mg', N'Transamin 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4387, N'Travatan 0.004%', N'Travatan 0.004%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4388, N'Trusopt 2% 5ml', N'Trusopt 2% 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4389, N'Tylenol', N'Tylenol', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4390, N'Uneal', N'Uneal', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4391, N'UPSA-C 1g', N'UPSA-C 1g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4392, N'Valacyclovir 500mg', N'Valacyclovir 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4393, N'Valcyte 450mg', N'Valcyte 450mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4394, N'Valtrex 500mg', N'Valtrex 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4395, N'Vastarel 20mg', N'Vastarel 20mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4396, N'Vastarel M.R. 35mg', N'Vastarel M.R. 35mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4397, N'Viên sáng mắt', N'Viên sáng mắt', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4398, N'Vigadexa 5ml', N'Vigadexa 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4399, N'Vigamox 5ml', N'Vigamox 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4400, N'Virgan 0.15% Gel Opht 5g', N'Virgan 0.15% Gel Opht 5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4401, N'Virupos 4.5g', N'Virupos 4.5g', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4402, N'Viscohyal 5ml', N'Viscohyal 5ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4403, N'Vismed 0.18% 0,3ml', N'Vismed 0.18% 0,3ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4404, N'Visplus', N'Visplus', 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4405, N'Vit A 5000 UI', N'Vit A 5000 UI', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4406, N'Vit B1 B6 B12', N'Vit B1 B6 B12', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4407, N'Vitamin A 5000UI', N'Vitamin A 5000UI', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4408, N'Vitamin A 5000UI', N'Vitamin A 5000UI', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4409, N'Vitamin AD', N'Vitamin AD', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4410, N'Vitamin C 500mg', N'Vitamin C 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4411, N'Vitamin E 400 UI', N'Vitamin E 400 UI', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4412, N'Vitamin PP 500mg', N'Vitamin PP 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4413, N'Vitamine A Dulcis 2,5MU Pom Opht', N'Vitamine A Dulcis 2,5MU Pom Opht', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4414, N'Voltaren 75mg', N'Voltaren 75mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4415, N'Voltaren Opht 0,1%', N'Voltaren Opht 0,1%', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4416, N'Xalatan 50mcg/ml', N'Xalatan 50mcg/ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4417, N'Xanh methelene', N'Xanh methelene', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4418, N'Zentel 100mg', N'Zentel 100mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4419, N'Zinnat 125mg gói', N'Zinnat 125mg gói', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4420, N'Zinnat 500mg', N'Zinnat 500mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (4421, N'Antazoline ', N'Antazoline ', 2, 1, 2, 3, 1, 1, 4, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (5421, N'Viên Glutomin 400mg', N'Viên Glutomin 400mg', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (6421, N'Eporon 105ml', N'Eporon 105ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (6422, N'Eporon 1205ml', N'Eporon 1205ml', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Medicine] ([MedicineID], [Name], [Description], [DefaultMedRoute], [DefaultUsageNum], [UnitType], [DefaultDosePerDay], [DefaultAmountPerDose], [DefaultBuyingNumber], [DefaultBuyingUnit], [StatusID]) VALUES (6423, N'Lacrifresh 0.12% 4ml', N'Lacrifresh 0.12% 4ml', 1, 1, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[MOH] ON 

INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1, N'None', N'None', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (2, N'1402050759', N'Nhổ lông xiêu 2 mắt', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1002, N'14.0005.0815', N'Mổ Phaco kính Acrysoft Toric', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1003, N'14.0005.0816', N'Mổ Phaco kính Adapt AO/enVista', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1004, N'14.0005.0817', N'Mổ Phaco kính Amor Sensar', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1005, N'14.0005.0818', N'Mổ Phaco kính ARTISAN', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1006, N'14.0005.0819', N'Mổ Phaco kính AS-Y / TekLen', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1007, N'14.0005.0820', N'Mổ Phaco kính Asphina', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1008, N'14.0005.0821', N'Mổ Phaco kính AT LISA 809M', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1009, N'14.0005.0822', N'Mổ Phaco kính AT LISA 839 MP +3', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1010, N'14.0005.0823', N'Mổ Phaco kính AT LISA TORIC 909M', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1011, N'14.0005.0824', N'Mổ Phaco kính AT LISA TORIC 939 MP', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1012, N'14.0005.0825', N'Mổ Phaco kính AT TORBI 709M', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1013, N'14.0005.0826', N'Mổ Phaco kính Fine Version', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1014, N'14.0005.0827', N'Mổ Phaco kính IQ (T6) SN60WF', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1015, N'14.0005.0828', N'Mổ Phaco kính LUCIA', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1016, N'14.0005.0829', N'Mổ Phaco kính LUCIDIS 108M / 124M', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1017, N'14.0005.0830', N'Mổ Phaco kính MCS524 CLAW IOL', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1018, N'14.0005.0831', N'Mổ Phaco kính MINI 4 READY S7560CZ', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1019, N'14.0005.0832', N'Mổ Phaco kính MINI 4 READY S7560CZ -NNN', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1020, N'14.0005.0833', N'Mổ Phaco kính MINI WELL READY', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1021, N'14.0005.0834', N'Mổ Phaco kính Oculentis', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1022, N'14.0005.0835', N'Mổ Phaco kính Optima cứng (T6)', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1023, N'14.0005.0836', N'Mổ Phaco kính Optima mềm - CT BS Diệp', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1024, N'14.0005.0837', N'Mổ Phaco kính Optima mềm (T6)', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1025, N'14.0005.0838', N'Mổ Phaco kính PanOptix', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1026, N'14.0005.0839', N'Mổ Phaco kính PanOptix Toric', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1027, N'14.0005.0840', N'Mổ Phaco kính RAYNER', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1028, N'14.0005.0841', N'Mổ Phaco kính RESTOR + 3', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1029, N'14.0005.0842', N'Mổ Phaco kính RESTOR + 3 TORIC', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1030, N'14.0005.0843', N'Mổ Phaco kính SZ-1 NIDEK', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1031, N'14.0005.0844', N'Mổ Phaco kính Tecnis 1 (ZCB00)', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1032, N'14.0005.0845', N'Mổ Phaco kính Tecnis Toric (ZCT150)', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1033, N'14.0005.0847', N'Phẫu thuật thủy tinh thể bằng phương pháp Phaco', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1034, N'14.0065.0824', N'Mổ mộng thịt - Ghép kết mạc', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1035, N'14.0065.0824', N'Mổ mộng thịt - Ghép kết mạc (Áp MC)', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1036, N'14.0187.0791', N'Mổ quặm 1 mi dưới', 1)
INSERT [dbo].[MOH] ([ID], [Code], [Description], [StatusID]) VALUES (1037, N'14.0187.0792', N'Mổ quặm 1 mi trên', 1)
SET IDENTITY_INSERT [dbo].[MOH] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([ID], [TypeID], [TargetID], [ClinicID], [Name], [Description], [PromotionCode], [Amount], [IsPercentage], [DateCreated], [DateStart], [DateEnd]) VALUES (1, 3, 1, 1, N'Flash sale GE', N'-50% for General Exam', N'GE.FL-2021', 50.0000, 1, CAST(N'2021-07-26T04:42:21.630' AS DateTime), CAST(N'2021-07-26T00:00:00.000' AS DateTime), CAST(N'2021-09-30T23:59:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Description], [StatusID]) VALUES (1, N'General Exam', 1)
INSERT [dbo].[Service] ([ID], [Description], [StatusID]) VALUES (2, N'Refraction Exam', 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([ID], [Name]) VALUES (1, N'Ax')
INSERT [dbo].[Type] ([ID], [Name]) VALUES (2, N'Procedure')
INSERT [dbo].[Type] ([ID], [Name]) VALUES (3, N'Service')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_AnalysisID]  DEFAULT (newid()) FOR [AnalysisID]
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_JsonResults]  DEFAULT ('{}') FOR [JsonResults]
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[AuditChange] ADD  CONSTRAINT [DF_AuditChange_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[AuditEvent] ADD  CONSTRAINT [DF_AuditEvent_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Availability] ADD  CONSTRAINT [DF_Availability_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[AxPx] ADD  CONSTRAINT [DF_Procedure_FormID]  DEFAULT ((1)) FOR [FormID]
GO
ALTER TABLE [dbo].[AxPx] ADD  CONSTRAINT [DF_Procedure_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[DataPoint] ADD  CONSTRAINT [DF_DataPoint_DataPointID]  DEFAULT (newid()) FOR [DataPointID]
GO
ALTER TABLE [dbo].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_TimeCreated]  DEFAULT (getdate()) FOR [TimeCreated]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[EpisodeRecord] ADD  CONSTRAINT [DF_EpisodeRecord_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[EpisodeRecord] ADD  CONSTRAINT [DF_EpisodeRecord_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Flow_FlowID]  DEFAULT (newid()) FOR [FlowID]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Flow_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Flow_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Flow_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Table_1_JsonSettings]  DEFAULT ('[]') FOR [Blocks]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF_Flow_Scene]  DEFAULT ('{}') FOR [Scene]
GO
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [DF_Form_Components]  DEFAULT (N'*') FOR [Components]
GO
ALTER TABLE [dbo].[ICD] ADD  CONSTRAINT [DF_ICD_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[ICDDx] ADD  CONSTRAINT [DF_ICDDx_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_MedicineRoute]  DEFAULT ((1)) FOR [MedicineRoute]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_AmountPerDose]  DEFAULT ((1)) FOR [AmountPerDose]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_UnitType]  DEFAULT ((1)) FOR [UnitType]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DosePerDay]  DEFAULT ((1)) FOR [DosePerDay]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF__Medicatio__DaysC__40257DE4]  DEFAULT ((1)) FOR [DaysCount]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF__Medicatio__Total__4119A21D]  DEFAULT ((1)) FOR [TotalUnitsCount]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_TotalBuyingNumber]  DEFAULT ((1)) FOR [TotalBuyingNumber]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_BuyingUnit]  DEFAULT ((1)) FOR [BuyingUnit]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultMedRoute]  DEFAULT ((1)) FOR [DefaultMedRoute]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultUsageNum]  DEFAULT ((1)) FOR [DefaultUsageNum]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultDosePerDay]  DEFAULT ((1)) FOR [DefaultDosePerDay]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultAmountPerDose]  DEFAULT ((1)) FOR [DefaultAmountPerDose]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultBuyingNumber]  DEFAULT ((1)) FOR [DefaultBuyingNumber]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultBuyingUnit]  DEFAULT ((1)) FOR [DefaultBuyingUnit]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[MOH] ADD  CONSTRAINT [DF_MOH_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_ProcedureOrder_CompletionID]  DEFAULT ((1)) FOR [CompletionID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_ProcedureOrder_TimeOrdered]  DEFAULT (getdate()) FOR [TimeOrdered]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__IsFree__24B26D99]  DEFAULT ((0)) FOR [IsFree]
GO
ALTER TABLE [dbo].[Promotion] ADD  CONSTRAINT [DF_Promotion_Percentage]  DEFAULT ((0)) FOR [IsPercentage]
GO
ALTER TABLE [dbo].[Promotion] ADD  CONSTRAINT [DF_PriceEvent_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Treatment] ADD  CONSTRAINT [DF_Treatment_TimeCreated]  DEFAULT (getdate()) FOR [TimeCreated]
GO
ALTER TABLE [dbo].[AdmissionTypeService]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionTypeService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[AdmissionTypeService] CHECK CONSTRAINT [FK_AdmissionTypeService_Service]
GO
ALTER TABLE [dbo].[AuditChange]  WITH CHECK ADD  CONSTRAINT [FK_AuditChange_EpisodeRecord1] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[AuditChange] CHECK CONSTRAINT [FK_AuditChange_EpisodeRecord1]
GO
ALTER TABLE [dbo].[AuditEvent]  WITH CHECK ADD  CONSTRAINT [FK_AuditEvent_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[AuditEvent] CHECK CONSTRAINT [FK_AuditEvent_EpisodeRecord]
GO
ALTER TABLE [dbo].[AxPx]  WITH CHECK ADD  CONSTRAINT [FK_AxPx_Form] FOREIGN KEY([FormID])
REFERENCES [dbo].[Form] ([ID])
GO
ALTER TABLE [dbo].[AxPx] CHECK CONSTRAINT [FK_AxPx_Form]
GO
ALTER TABLE [dbo].[AxPx]  WITH CHECK ADD  CONSTRAINT [FK_AxPx_ICD] FOREIGN KEY([ICDID])
REFERENCES [dbo].[ICD] ([ID])
GO
ALTER TABLE [dbo].[AxPx] CHECK CONSTRAINT [FK_AxPx_ICD]
GO
ALTER TABLE [dbo].[AxPx]  WITH CHECK ADD  CONSTRAINT [FK_AxPx_MOH] FOREIGN KEY([MOHID])
REFERENCES [dbo].[MOH] ([ID])
GO
ALTER TABLE [dbo].[AxPx] CHECK CONSTRAINT [FK_AxPx_MOH]
GO
ALTER TABLE [dbo].[AxPxPermission]  WITH CHECK ADD  CONSTRAINT [FK_AxPxPermission_AxPx] FOREIGN KEY([AxPxID])
REFERENCES [dbo].[AxPx] ([ID])
GO
ALTER TABLE [dbo].[AxPxPermission] CHECK CONSTRAINT [FK_AxPxPermission_AxPx]
GO
ALTER TABLE [dbo].[AxPxService]  WITH CHECK ADD  CONSTRAINT [FK_AxPxService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[AxPxService] CHECK CONSTRAINT [FK_AxPxService_Service]
GO
ALTER TABLE [dbo].[ClinicalNote]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalNote_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[ClinicalNote] CHECK CONSTRAINT [FK_ClinicalNote_EpisodeRecord]
GO
ALTER TABLE [dbo].[ConclusionSuggestion]  WITH CHECK ADD  CONSTRAINT [FK_ConclusionSuggestion_Conclusion] FOREIGN KEY([ConclusionID])
REFERENCES [dbo].[Conclusion] ([ID])
GO
ALTER TABLE [dbo].[ConclusionSuggestion] CHECK CONSTRAINT [FK_ConclusionSuggestion_Conclusion]
GO
ALTER TABLE [dbo].[DeptServAxPx]  WITH CHECK ADD  CONSTRAINT [FK_DeptServAxPx_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[DeptServAxPx] CHECK CONSTRAINT [FK_DeptServAxPx_Department]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_EpisodeRecord]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_ICDDx] FOREIGN KEY([ICDDxID])
REFERENCES [dbo].[ICDDx] ([ID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_ICDDx]
GO
ALTER TABLE [dbo].[EpisodeRecord]  WITH CHECK ADD  CONSTRAINT [FK_EpisodeRecord_Episode] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episode] ([ID])
GO
ALTER TABLE [dbo].[EpisodeRecord] CHECK CONSTRAINT [FK_EpisodeRecord_Episode]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [FK_Medication_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [FK_Medication_EpisodeRecord]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [FK_Medication_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [FK_Medication_Medicine]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_EpisodeRecord]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Promotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotion] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Promotion]
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_EpisodeRecord] FOREIGN KEY([EpisodeRecordID])
REFERENCES [dbo].[EpisodeRecord] ([ID])
GO
ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Treatment_EpisodeRecord]
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_ICD] FOREIGN KEY([ICDID])
REFERENCES [dbo].[ICD] ([ID])
GO
ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Treatment_ICD]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Queued, 2 = Processing, 3 = Success, 0 = Failed, -1 = Canceled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Analysis'
GO
USE [master]
GO
ALTER DATABASE [EMR v2] SET  READ_WRITE 
GO
