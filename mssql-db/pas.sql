USE [master]
GO
/****** Object:  Database [PAS]    Script Date: 7/26/2021 11:50:15 AM ******/
CREATE DATABASE [PAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Patient', FILENAME = N'/var/opt/mssql/data/Patient.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Patient_log', FILENAME = N'/var/opt/mssql/data/Patient_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PAS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PAS] SET  MULTI_USER 
GO
ALTER DATABASE [PAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PAS] SET QUERY_STORE = OFF
GO
USE [PAS]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission](
	[AdmissionID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[EpisodeID] [int] NOT NULL,
	[AdmissionTypeID] [int] NOT NULL,
	[ReferralID] [int] NULL,
	[ServiceGroupID] [int] NULL,
	[AdmissionTime] [datetime] NOT NULL,
	[AlertID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[UserInChargeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[AdmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdmissionType]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionType](
	[AdmissionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionTypeCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_AdmissionType] PRIMARY KEY CLUSTERED 
(
	[AdmissionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alert]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[AlertID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Alert] PRIMARY KEY CLUSTERED 
(
	[AlertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[VNDescription] [nvarchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Allergy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChronicDisease]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChronicDisease](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_ChronicConditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discharge]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discharge](
	[DischargeID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DischargeTime] [datetime] NOT NULL,
	[DischargeModeID] [int] NOT NULL,
	[PatientSatisfactionID] [int] NOT NULL,
	[EpisodeID] [int] NULL,
 CONSTRAINT [PK_Discharge] PRIMARY KEY CLUSTERED 
(
	[DischargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DischargeMode]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DischargeMode](
	[DischargeModeID] [int] IDENTITY(1,1) NOT NULL,
	[DischargeModeCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_DischargeMode] PRIMARY KEY CLUSTERED 
(
	[DischargeModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ethnicity]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ethnicity](
	[EthnicityID] [int] IDENTITY(1,1) NOT NULL,
	[EthnicityCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Ethnicity] PRIMARY KEY CLUSTERED 
(
	[EthnicityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyHistory]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[VNDescription] [nvarchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_FamilyHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthInsurance]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthInsurance](
	[HealthInsuranceID] [int] IDENTITY(1,1) NOT NULL,
	[HealthInsuranceNumber] [nvarchar](250) NOT NULL,
	[InsuranceCompanyID] [int] NULL,
	[PublicInsurance] [bit] NULL,
 CONSTRAINT [PK_HealthInsurance] PRIMARY KEY CLUSTERED 
(
	[HealthInsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [nvarchar](250) NOT NULL,
	[HospitalDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceCompany]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceCompany](
	[InsuranceCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceCompanyCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[InsuranceCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[NationalityID] [int] IDENTITY(1,1) NOT NULL,
	[NationalityCode] [nvarchar](250) NULL,
	[NationalityDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[NationalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupation](
	[OccupationID] [int] IDENTITY(1,1) NOT NULL,
	[OccupationCode] [nvarchar](250) NULL,
	[OccupationDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Occupation] PRIMARY KEY CLUSTERED 
(
	[OccupationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PastHistory]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PastHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[VNDescription] [nvarchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_PastHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[GivenName] [nvarchar](50) NULL,
	[GenderType] [int] NOT NULL,
	[DOB] [datetime] NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Avatar] [nvarchar](500) NULL,
	[HealthInsuranceID] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[IdentificationNumber] [nvarchar](30) NULL,
	[OccupationID] [int] NULL,
	[EthnicityID] [int] NULL,
	[NationalityID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[AthenaID] [int] NULL,
 CONSTRAINT [PK_PatientMasterIndex] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientAdditionalStat]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAdditionalStat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[TargetStatID] [int] NOT NULL,
	[TargetStatType] [int] NOT NULL,
 CONSTRAINT [PK_PatientAdditionalStat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientSatisfaction]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientSatisfaction](
	[PatientSatisfactionID] [int] IDENTITY(1,1) NOT NULL,
	[PatientSatisfactionCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_PatientSatisfaction] PRIMARY KEY CLUSTERED 
(
	[PatientSatisfactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentSummary]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentSummary](
	[PaymentSummaryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[BookingID] [int] NULL,
	[EpisodeRecordID] [int] NOT NULL,
	[EpisodeID] [int] NOT NULL,
	[AdmissionTypeID] [int] NOT NULL,
	[AdjustmentPriceID] [int] NULL,
	[PromotionID] [int] NULL,
	[OriginalPrice] [decimal](18, 0) NOT NULL,
	[AdditionalPrice] [decimal](18, 0) NULL,
	[FinalPrice] [decimal](18, 0) NOT NULL,
	[StatusID] [int] NOT NULL,
	[StaffOrderedID] [int] NULL,
	[StaffConfirmID] [int] NULL,
	[StaffCreatedID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateConfirmed] [datetime] NULL,
	[CustomerCashAdvance] [decimal](18, 0) NULL,
	[CustomerCashChange] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[AdjustmentPrice] [decimal](18, 0) NULL,
	[Note] [ntext] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentMethodDescription] [nvarchar](500) NULL,
	[ExportInvoice] [bit] NULL,
	[InvoiceNo] [int] NULL,
	[InvoiceSerial] [text] NULL,
	[InvoiceForm] [nvarchar](50) NULL,
	[InvoiceGUID] [text] NULL,
	[PartnerInvoiceID] [bigint] NULL,
 CONSTRAINT [PK_PaymentSummary] PRIMARY KEY CLUSTERED 
(
	[PaymentSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalBehaviour]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalBehaviour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[VNDescription] [nvarchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_PersonalBehaviour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalHistory]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalHistory](
	[PersonalHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ChronicDiseaseCode] [nvarchar](50) NULL,
	[DiagnosisDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_PersonalHistory] PRIMARY KEY CLUSTERED 
(
	[PersonalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode] [nvarchar](50) NULL,
	[English] [varchar](50) NULL,
	[Size] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[ReferralID] [int] IDENTITY(1,1) NOT NULL,
	[ReferralCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
	[HospitalID] [int] NULL,
	[ClinicID] [int] NULL,
	[DoctorID] [int] NULL,
 CONSTRAINT [PK_Refferral] PRIMARY KEY CLUSTERED 
(
	[ReferralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferralOrder]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReferralID] [int] NULL,
	[ServiceID] [int] NULL,
	[AxPxID] [int] NULL,
 CONSTRAINT [PK_ReferralOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relatives]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relatives](
	[PatientRelativeID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[DOB] [datetime] NULL,
	[Relationship] [nvarchar](150) NULL,
 CONSTRAINT [PK_Relatives] PRIMARY KEY CLUSTERED 
(
	[PatientRelativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionID] [int] IDENTITY(1,1) NOT NULL,
	[ReligionCode] [varchar](100) NULL,
	[ReligionDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceGroup]    Script Date: 7/26/2021 11:50:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceGroup](
	[ServiceGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceGroupCode] [nvarchar](250) NULL,
	[CodeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_ServiceGroup] PRIMARY KEY CLUSTERED 
(
	[ServiceGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdmissionType] ON 

INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (2, N'FLUP - 21022021', N'Follow-up ')
INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (3, N'FT - 2102', N'first-time to this service')
INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (4, N'RS - 2102', N'routinely scheduled ')
INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (5, N'EM - 21', N'emergency ')
INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (6, N'EA - 21', N'elective admission ')
INSERT [dbo].[AdmissionType] ([AdmissionTypeID], [AdmissionTypeCode], [CodeDescription]) VALUES (7, N'PS - 21', N'post- operation ')
SET IDENTITY_INSERT [dbo].[AdmissionType] OFF
GO
SET IDENTITY_INSERT [dbo].[Alert] ON 

INSERT [dbo].[Alert] ([AlertID], [Description]) VALUES (1, N'Checkin')
INSERT [dbo].[Alert] ([AlertID], [Description]) VALUES (2, N'Emergency')
SET IDENTITY_INSERT [dbo].[Alert] OFF
GO
SET IDENTITY_INSERT [dbo].[Allergy] ON 

INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (1, N'Z88.0', N'Tiền sử cá nhân dị ứng với penicillin', N'Tiền sử cá nhân dị ứng với penicillin', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (2, N'Z88.1', N'Tiền sử cá nhân dị ứng với các kháng sinh khác', N'Tiền sử cá nhân dị ứng với các kháng sinh khác', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (3, N'Z88.2', N'Tiền sử cá nhân dị ứng với sulfonamides', N'Tiền sử cá nhân dị ứng với sulfonamides', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (4, N'Z88.3', N'Tiền sử cá nhân dị ứng với các tác nhân chống nhiễm khuẩn khác', N'Tiền sử cá nhân dị ứng với các tác nhân chống nhiễm khuẩn khác', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (5, N'Z88.4', N'Tiền sử cá nhân dị ứng với thuốc gây mê', N'Tiền sử cá nhân dị ứng với thuốc gây mê', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (6, N'Z88.5', N'Tiền sử cá nhân dị ứng với các chất gây ngủ', N'Tiền sử cá nhân dị ứng với các chất gây ngủ', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (7, N'Z88.6', N'Tiền sử cá nhân dị ứng với các tác nhân giảm đau', N'Tiền sử cá nhân dị ứng với các tác nhân giảm đau', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (8, N'Z88.7', N'Tiền sử cá nhân dị ứng với huyết thanh và vaccin', N'Tiền sử cá nhân dị ứng với huyết thanh và vaccin', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (9, N'Z88.8', N'Tiền sử cá nhân dị ứng với các chất ma túy, thuốc và các chất sinh học khác', N'Tiền sử cá nhân dị ứng với các chất ma túy, thuốc và các chất sinh học khác', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (10, N'Z88.9', N'Tiền sử cá nhân dị ứng với chất ma túy, thuốc các chất sinh học không đặc hiệu khác', N'Tiền sử cá nhân dị ứng với chất ma túy, thuốc các chất sinh học không đặc hiệu khác', 1)
INSERT [dbo].[Allergy] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (11, N'Z91.0', N'Tiền sử cá nhân có dị ứng, không kể dị ứng thuốc và các chất sinh học', N'Tiền sử cá nhân có dị ứng, không kể dị ứng thuốc và các chất sinh học', 1)
SET IDENTITY_INSERT [dbo].[Allergy] OFF
GO
SET IDENTITY_INSERT [dbo].[ChronicDisease] ON 

INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (1, N'U78.1', N'Béo phì với BMI ≥ 30,00 kg / m²
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (2, N'U78.2', N'Bệnh xơ nang', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (3, N'U79.1', N'Sa sút trí tuệ (bao gồm Alzheimer)', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (4, N'U79.2', N'Tâm thần phân liệt', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (5, N'U79.3', N'Phiền muộn', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (6, N'U79.4', N'Rối loạn phát triển trí tuệ', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (7, N'U80.1', N'Parkinson
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (8, N'U80.2', N'Bệnh đa xơ cứng
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (9, N'U80.3', N'Động kinh
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (10, N'U80.4', N'Bại não
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (11, N'U80.5', N'Liệt nửa người hoặc 1 bên người, Liệt tứ chi
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (12, N'U82.1', N'Bệnh nhồi máu cơ tim
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (13, N'U82.2', N'Suy tim mãn tính
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (14, N'U82.3', N'Tăng huyết áp
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (15, N'U83.1', N'Khí phế thũng
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (16, N'U83.2', N'Bệnh phổi tắc nghẽn mãn tính (COPD)
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (17, N'U83.3', N'Hen suyễn
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (18, N'U83.4', N'Giãn phế quản
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (19, N'U83.5', N'Suy hô hấp mãn tính
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (20, N'U84.1', N'Bệnh Crohn
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (21, N'U84.2', N'Viêm loét đại tràng
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (22, N'U84.3', N'Suy gan mãn tính
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (23, N'U86.1', N'Viêm khớp dạng thấp
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (24, N'U86.2', N'Viêm khớp và viêm xương khớp
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (25, N'U86.3', N'Lupus ban đỏ hệ thống
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (26, N'U86.4', N'Loãng xương
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (27, N'U87.1', N'Bệnh thận mãn tính, giai đoạn 3-5
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (28, N'U88.1', N'Nứt đốt sống
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (29, N'U88.2', N'Hội chứng Down Trisomy 21
', 1)
INSERT [dbo].[ChronicDisease] ([ID], [Code], [Description], [StatusID]) VALUES (30, N'U0.0', N'Không
 có', 0)
SET IDENTITY_INSERT [dbo].[ChronicDisease] OFF
GO
SET IDENTITY_INSERT [dbo].[DischargeMode] ON 

INSERT [dbo].[DischargeMode] ([DischargeModeID], [DischargeModeCode], [CodeDescription]) VALUES (1, N'1', N'Home')
INSERT [dbo].[DischargeMode] ([DischargeModeID], [DischargeModeCode], [CodeDescription]) VALUES (2, N'2', N'Refer to other health provider')
INSERT [dbo].[DischargeMode] ([DischargeModeID], [DischargeModeCode], [CodeDescription]) VALUES (3, N'3', N'Patient ask to leave')
INSERT [dbo].[DischargeMode] ([DischargeModeID], [DischargeModeCode], [CodeDescription]) VALUES (4, N'4', N'Leave against medical advices')
INSERT [dbo].[DischargeMode] ([DischargeModeID], [DischargeModeCode], [CodeDescription]) VALUES (1002, N'5', N'Death')
SET IDENTITY_INSERT [dbo].[DischargeMode] OFF
GO
SET IDENTITY_INSERT [dbo].[Ethnicity] ON 

INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1002, N'Kinh', N'Việt')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1003, N'Tày', N'Thổ, Ngạn, Phén, Thù lao, Pa Dí')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1004, N'Thái', N'Tày, Tày khao (Thái trắng), Tày Dăm (Thái Đen), Tày Mười Tây Thanh, Màn Thanh (Hang Ông (Tày Mường), Pi Thay, Thổ Đà Bắc')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1005, N'Hoa', N'Hán, Triều Châu, Phúc Kiến, Quảng Đông, Hải Nam, Hạ, Xạ Phạng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1006, N'Khơ-me', N'Cur, Cul, Cu, Thổ, Việt gốc Miên, Khơ-me, Krôm')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1007, N'Mường', N'Mol, Mual, Mọi, Mọi Bi, Ao Tá, (Ậu Tá)')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1008, N'Nùng', N'Xuồng, Giang, Nùng An, Phàn Sinh, Nùng Cháo, Nùng Lòi, Quý Rim, Khèn Lài, ...')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1009, N'Hmông', N'Mèo, Mẹo, Hoa, Mèo Xanh, Mèo Đỏ, Mèo Đen, Ná Mẻo, Mán Trắng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1010, N'Dao', N'Mán, Động, Trại, Xá, Dìu Miền, Kiềm, Miền, Quần Trắng, Dao Đỏ, Quần Chẹt, Lô Gang, Dao Tiền, Thanh Y, Lan Tẻn, Đại Bản,Tiểu Bản, Cóc Ngáng, Cóc Mùn, Sơn Đầu, ...')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1011, N'Gia-rai', N'Giơ-rai, Tơ-buăn, Chơ-rai, Hơ-bau, Hđrung, Chor, ...')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1012, N'Ngái', N'Xín, Lê, Đản, Khách Gia')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1013, N'Ê-đê', N'Ra-đê, Đê, Kpạ, A-đham, Krung, Ktul, Đliê Ruê, Blô, E-pan, Mđhur, Bih, ...')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1014, N'Ba-na', N'Gơ-lar, Tơ-lô, Giơ-lâng (Y-Lăng), Rơ-ngao, Krem, Roh, ConKđe, A-la Công, Kpăng Công, Bơ-nâm')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1015, N'Xơ-đăng', N'Xơ-teng, Hđang, Tơ-đra, Mơ-nâm, Ha-lăng, Ca-dông, Kmrâng, Con Lan, Bri-la, Tang')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1016, N'Sán Chay', N'Cao Lan-Sán chỉ, Cao Lan, Mán Cao Lan, Hờn Bạn, Sán Chỉ (Sơn Tử)')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1017, N'Cơ-ho', N'Xrê, Nốp (Tu Lốp), Cơ-don, Chil, Lat (Lach), Trinh')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1018, N'Chăm', N'Chàm, Chiêm Thành, Hroi')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1019, N'Sán Dìu', N'Sán Dẻo, Trại, Trại Đất, Mán Quần Cộc')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1020, N'Hrê', N'Chăm Rê, Chom, Krẹ Lũy')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1021, N'Mnông', N'Pnông, Nông, Pré, Bu-đâng, ĐiPri, Biat, Gar, Rơ-lam, Chil')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1022, N'Ra-glai', N'Ra-clây, Rai, Noang, La-oang')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1023, N'Xtiêng', N'Xa-điêng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1024, N'Bru-Vân Kiều', N'Bru, Vân Kiều, Măng Coong, Tri Khùa')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1025, N'Thổ', N'Kẹo, Mọn, Cuối, Họ, Đan Lai, Ly Hà, Tày Pọng, Con Kha, Xá Lá Vàng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1026, N'Giáy', N'Nhắng, Dẩng, Pầu Thìn Pu Nà, Cùi Chu , Xa')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1027, N'Cơ-tu', N'Ca-tu, Cao, Hạ, Phương, Ca-tang')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1028, N'Gié-Triêng', N'Đgiéh, Tareh, Giang Rẫy Pin, Triêng, Treng, Ta-riêng, Ve (Veh), La-ve, Ca-tang')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1029, N'Mạ', N'Châu Mạ, Mạ Ngăn, Mạ Xốp, Mạ Tô, Mạ Krung, ...')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1030, N'Khơ-mú', N'Xá Cẩu, Mứn Xen, Pu Thênh Tềnh, Tày Hay')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1031, N'Co', N'Cor, Col, Cùa, Trầu')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1032, N'Ta-ôi', N'Tôi-ôi, Pa-co, Pa-hi (Ba-hi)')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1033, N'Chơ-ro', N'Dơ-ro, Châu-ro')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1034, N'Kháng', N'Xá Khao, Xá Súa, Xá Dón, Xá Dẩng, Xá Hốc, Xá Ái, Xá Bung, Quảng Lâm')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1035, N'Xinh-mun', N'Puộc, Pụa')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1036, N'Hà Nhì', N'U Ni, Xá U Ni')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1037, N'Chu-ru', N'Chơ-ru, Chu')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1038, N'Lào', N'Lào Bốc, Lào Nọi')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1039, N'La Chi', N'Cù Tê, La Quả')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1040, N'La Ha', N'Xá Khao, Khlá Phlạo')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1041, N'Phù Lá', N'Bồ Khô Pạ, Mu Di, Pạ Xá, Phó, Phổ, VaXơ')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1042, N'La Hủ', N'Lao, Pu Đang,Khù Xung, Cò Xung, Khả Quy')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1043, N'Lự', N'Lừ, Nhuồn Duôn, Mun Di')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1044, N'Lô Lô', N'')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1045, N'Chứt', N'Sách, May, Rục, Mã-liêng, A-rem, Tu vang, Pa-leng, Xơ-lang, Tơ-hung, Chà-củi, Tắc-củi, U-mo, Xá Lá Vàng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1046, N'Mảng', N'Mảng Ư, Xá Lá Vàng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1047, N'Pà Thẻn', N'Pà Hưng, Tống')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1048, N'Cơ Lao', N'')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1049, N'Cống', N'Xắm Khống, Mấng Nhé, Xá Xeng')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1050, N'Bố Y', N'Chủng Chá, Trọng Gia, Tu Dí, Tu Dìn')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1051, N'Si La', N'Cù Dề Xừ, Khả pẻ')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1052, N'Pu Péo', N'Ka Bèo, Pen Ti Lô Lô')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1053, N'Brâu', N'Brao')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1054, N'Ơ Đu', N'Tày Hạt')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1055, N'Rơ-măm', N'')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (1056, N'Người nước ngoài', N'')
INSERT [dbo].[Ethnicity] ([EthnicityID], [EthnicityCode], [CodeDescription]) VALUES (2032, N'hờ le', N'hờ le')
SET IDENTITY_INSERT [dbo].[Ethnicity] OFF
GO
SET IDENTITY_INSERT [dbo].[FamilyHistory] ON 

INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (1, N'Z82.1', N'Tiền sử gia đình có mù loà và mất thị giác', N'Tiền sử gia đình có mù loà và mất thị giác', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (2, N'Z82.2', N'Tiền sử gia đình có điếc và mất thính giác', N'Tiền sử gia đình có điếc và mất thính giác', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (3, N'Z83.0', N'Tiền sử gia đình có bệnh suy giảm miễn dịch virus người (HIV)', N'Tiền sử gia đình có bệnh suy giảm miễn dịch virus người (HIV)', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (4, N'Z83.1', N'Tiền sử gia đình có các bệnh nhiễm khuẩn và ký sinh trùng khác', N'Tiền sử gia đình có các bệnh nhiễm khuẩn và ký sinh trùng khác', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (5, N'Z83.2', N'Tiền sử gia đình có các bệnh về máu và cơ quan tạo máu và một số rối loạn về cơ chế miễn dịch', N'Tiền sử gia đình có các bệnh về máu và cơ quan tạo máu và một số rối loạn về cơ chế miễn dịch', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (6, N'Z83.5', N'Tiền sử gia đình có các rối loạn thị giác và thính giác', N'Tiền sử gia đình có các rối loạn thị giác và thính giác', 1)
INSERT [dbo].[FamilyHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (7, N'Z83.3', N'Tiền sử gia đình có bệnh đái tháo đường', N'Tiền sử gia đình có bệnh đái tháo đường', 1)
SET IDENTITY_INSERT [dbo].[FamilyHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthInsurance] ON 

INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (2, N'123456GH', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (1023, N'DN4797916593396', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (1026, N'234324234234234', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (2028, N'123aaa!@#', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (5028, N'1232132312', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (6027, N'3344223', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (6028, N'123123123', NULL, 1)
INSERT [dbo].[HealthInsurance] ([HealthInsuranceID], [HealthInsuranceNumber], [InsuranceCompanyID], [PublicInsurance]) VALUES (7027, N'44334455', NULL, 1)
SET IDENTITY_INSERT [dbo].[HealthInsurance] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [HospitalDescription]) VALUES (1, N'Bệnh viện trung ương', N'Bệnh viện trung ương')
SET IDENTITY_INSERT [dbo].[Hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2233, N'AF', N'Afghanistan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2234, N'AX', N'Åland Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2235, N'AL', N'Albania')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2236, N'DZ', N'Algeria')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2237, N'AS', N'American Samoa')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2238, N'AD', N'Andorra')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2239, N'AO', N'Angola')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2240, N'AI', N'Anguilla')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2241, N'AQ', N'Antarctica')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2242, N'AG', N'Antigua And Barbuda')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2243, N'AR', N'Argentina')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2244, N'AM', N'Armenia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2245, N'AW', N'Aruba')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2246, N'AU', N'Australia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2247, N'AT', N'Austria')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2248, N'AZ', N'Azerbaijan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2249, N'BS', N'Bahamas')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2250, N'BH', N'Bahrain')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2251, N'BD', N'Bangladesh')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2252, N'BB', N'Barbados')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2253, N'BY', N'Belarus')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2254, N'BE', N'Belgium')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2255, N'BZ', N'Belize')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2256, N'BJ', N'Benin')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2257, N'BM', N'Bermuda')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2258, N'BT', N'Bhutan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2259, N'BO', N'Bolivia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2260, N'BA', N'Bosnia And Herzegovina')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2261, N'BW', N'Botswana')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2262, N'BV', N'Bouvet Island')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2263, N'BR', N'Brazil')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2264, N'IO', N'British Indian Ocean Territory')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2265, N'BN', N'Brunei Darussalam')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2266, N'BG', N'Bulgaria')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2267, N'BF', N'Burkina Faso')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2268, N'BI', N'Burundi')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2269, N'KH', N'Cambodia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2270, N'CM', N'Cameroon')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2271, N'CA', N'Canada')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2272, N'CV', N'Cape Verde')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2273, N'KY', N'Cayman Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2274, N'CF', N'Central African Republic')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2275, N'TD', N'Chad')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2276, N'CL', N'Chile')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2277, N'CN', N'China')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2278, N'CX', N'Christmas Island')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2279, N'CC', N'Cocos (Keeling) Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2280, N'CO', N'Colombia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2281, N'KM', N'Comoros')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2282, N'CG', N'Congo')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2283, N'CD', N'Congo. The Democratic Republic Of The')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2284, N'CK', N'Cook Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2285, N'CR', N'Costa Rica')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2286, N'CI', N'Côte D''Ivoire')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2287, N'HR', N'Croatia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2288, N'CU', N'Cuba')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2289, N'CY', N'Cyprus')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2290, N'CZ', N'Czech Republic')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2291, N'DK', N'Denmark')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2292, N'DJ', N'Djibouti')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2293, N'DM', N'Dominica')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2294, N'DO', N'Dominican Republic')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2295, N'EC', N'Ecuador')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2296, N'EG', N'Egypt')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2297, N'SV', N'El Salvador')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2298, N'GQ', N'Equatorial Guinea')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2299, N'ER', N'Eritrea')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2300, N'EE', N'Estonia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2301, N'ET', N'Ethiopia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2302, N'FK', N'Falkland Islands (Malvinas)')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2303, N'FO', N'Faroe Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2304, N'FJ', N'Fiji')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2305, N'FI', N'Finland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2306, N'FR', N'France')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2307, N'GF', N'French Guiana')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2308, N'PF', N'French Polynesia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2309, N'TF', N'French Southern Territories')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2310, N'GA', N'Gabon')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2311, N'GM', N'Gambia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2312, N'GE', N'Georgia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2313, N'DE', N'Germany')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2314, N'GH', N'Ghana')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2315, N'GI', N'Gibraltar')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2316, N'GR', N'Greece')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2317, N'GL', N'Greenland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2318, N'GD', N'Grenada')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2319, N'GP', N'Guadeloupe')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2320, N'GU', N'Guam')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2321, N'GT', N'Guatemala')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2322, N'GN', N'Guinea')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2323, N'GW', N'Guinea-Bissau')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2324, N'GY', N'Guyana')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2325, N'HT', N'Haiti')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2326, N'HM', N'Heard Island And Mcdonald Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2327, N'VA', N'Holy See (Vatican City State)')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2328, N'HN', N'Honduras')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2329, N'HK', N'Hong Kong')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2330, N'HU', N'Hungary')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2331, N'IS', N'Iceland')
GO
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2332, N'IN', N'India')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2333, N'ID', N'Indonesia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2334, N'IR', N'Iran. Islamic Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2335, N'IQ', N'Iraq')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2336, N'IE', N'Ireland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2337, N'IL', N'Israel')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2338, N'IT', N'Italy')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2339, N'JM', N'Jamaica')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2340, N'JP', N'Japan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2341, N'JO', N'Jordan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2342, N'KZ', N'Kazakhstan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2343, N'KE', N'Kenya')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2344, N'KI', N'Kiribati')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2345, N'KP', N'Korea. Democratic People''S Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2346, N'KR', N'Korea. Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2347, N'KW', N'Kuwait')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2348, N'KG', N'Kyrgyzstan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2349, N'LA', N'Lao People''S Democratic Republic')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2350, N'LV', N'Latvia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2351, N'LB', N'Lebanon')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2352, N'LS', N'Lesotho')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2353, N'LR', N'Liberia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2354, N'LY', N'Libyan Arab Jamahiriya')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2355, N'LI', N'Liechtenstein')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2356, N'LT', N'Lithuania')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2357, N'LU', N'Luxembourg')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2358, N'MO', N'Macao')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2359, N'MK', N'Macedonia. The Former Yugoslav Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2360, N'MG', N'Madagascar')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2361, N'MW', N'Malawi')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2362, N'MY', N'Malaysia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2363, N'MV', N'Maldives')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2364, N'ML', N'Mali')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2365, N'MT', N'Malta')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2366, N'MH', N'Marshall Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2367, N'MQ', N'Martinique')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2368, N'MR', N'Mauritania')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2369, N'MU', N'Mauritius')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2370, N'YT', N'Mayotte')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2371, N'MX', N'Mexico')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2372, N'FM', N'Micronesia. Federated States Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2373, N'MD', N'Moldova. Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2374, N'MC', N'Monaco')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2375, N'MN', N'Mongolia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2376, N'MS', N'Montserrat')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2377, N'MA', N'Morocco')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2378, N'MZ', N'Mozambique')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2379, N'MM', N'Myanmar')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2380, N'NA', N'Namibia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2381, N'NR', N'Nauru')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2382, N'NP', N'Nepal')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2383, N'NL', N'Netherlands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2384, N'AN', N'Netherlands Antilles')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2385, N'NC', N'New Caledonia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2386, N'NZ', N'New Zealand')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2387, N'NI', N'Nicaragua')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2388, N'NE', N'Niger')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2389, N'NG', N'Nigeria')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2390, N'NU', N'Niue')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2391, N'NF', N'Norfolk Island')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2392, N'MP', N'Northern Mariana Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2393, N'NO', N'Norway')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2394, N'OM', N'Oman')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2395, N'PK', N'Pakistan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2396, N'PW', N'Palau')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2397, N'PS', N'Palestinian Territory. Occupied')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2398, N'PA', N'Panama')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2399, N'PG', N'Papua New Guinea')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2400, N'PY', N'Paraguay')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2401, N'PE', N'Peru')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2402, N'PH', N'Philippines')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2403, N'PN', N'Pitcairn')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2404, N'PL', N'Poland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2405, N'PT', N'Portugal')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2406, N'PR', N'Puerto Rico')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2407, N'QA', N'Qatar')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2408, N'RE', N'Réunion')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2409, N'RO', N'Romania')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2410, N'RU', N'Russian Federation')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2411, N'RW', N'Rwanda')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2412, N'SH', N'Saint Helena')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2413, N'KN', N'Saint Kitts And Nevis')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2414, N'LC', N'Saint Lucia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2415, N'PM', N'Saint Pierre And Miquelon')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2416, N'VC', N'Saint Vincent And The Grenadines')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2417, N'WS', N'Samoa')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2418, N'SM', N'San Marino')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2419, N'ST', N'Sao Tome And Principe')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2420, N'SA', N'Saudi Arabia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2421, N'SN', N'Senegal')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2422, N'CS', N'Serbia And Montenegro')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2423, N'SC', N'Seychelles')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2424, N'SL', N'Sierra Leone')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2425, N'SG', N'Singapore')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2426, N'SK', N'Slovakia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2427, N'SI', N'Slovenia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2428, N'SB', N'Solomon Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2429, N'SO', N'Somalia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2430, N'ZA', N'South Africa')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2431, N'GS', N'South Georgia And The South Sandwich Islands')
GO
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2432, N'ES', N'Spain')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2433, N'LK', N'Sri Lanka')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2434, N'SD', N'Sudan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2435, N'SR', N'Suriname')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2436, N'SJ', N'Svalbard And Jan Mayen')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2437, N'SZ', N'Swaziland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2438, N'SE', N'Sweden')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2439, N'CH', N'Switzerland')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2440, N'SY', N'Syrian Arab Republic')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2441, N'TW', N'Taiwan. Province Of China')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2442, N'TJ', N'Tajikistan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2443, N'TZ', N'Tanzania. United Republic Of')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2444, N'TH', N'Thailand')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2445, N'TL', N'Timor-Leste')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2446, N'TG', N'Togo')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2447, N'TK', N'Tokelau')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2448, N'TO', N'Tonga')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2449, N'TT', N'Trinidad And Tobago')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2450, N'TN', N'Tunisia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2451, N'TR', N'Turkey')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2452, N'TM', N'Turkmenistan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2453, N'TC', N'Turks And Caicos Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2454, N'TV', N'Tuvalu')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2455, N'UG', N'Uganda')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2456, N'UA', N'Ukraine')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2457, N'AE', N'United Arab Emirates')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2458, N'GB', N'United Kingdom')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2459, N'US', N'United States')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2460, N'UM', N'United States Minor Outlying Islands')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2461, N'UY', N'Uruguay')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2462, N'UZ', N'Uzbekistan')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2463, N'VU', N'Vanuatu')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2464, N'VA', N'Vatican Holy See ')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2465, N'VE', N'Venezuela')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2466, N'VN', N'Vietnam')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2467, N'VG', N'Virgin Islands. British')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2468, N'VI', N'Virgin Islands. U.S.')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2469, N'WF', N'Wallis And Futuna')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2470, N'EH', N'Western Sahara')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2471, N'YE', N'Yemen')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2472, N'ZM', N'Zambia')
INSERT [dbo].[Nationality] ([NationalityID], [NationalityCode], [NationalityDescription]) VALUES (2473, N'ZW', N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Nationality] OFF
GO
SET IDENTITY_INSERT [dbo].[Occupation] ON 

INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1002, N'HPT1', N'Chiropractor')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1003, N'HPT2', N'Dentist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1004, N'HPT3', N'Dietitian or Nutritionist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1005, N'HPT4', N'Optometrist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1006, N'HPT5', N'Pharmacist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1007, N'HPT6', N'Physician')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1008, N'HPT7', N'Physician Assistant')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1009, N'HPT8', N'Podiatrist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1010, N'HPT9', N'Registered Nurse')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1011, N'HPT10', N'Therapist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1012, N'HPT11', N'Veterinarian')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1013, N'HPT12', N'Health Technologist or Technician')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1014, N'HPT13', N'Other Healthcare Practitioners and Technical Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1015, N'HS1', N'Nursing, Psychiatric or Home Health Aide')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1016, N'HS2', N'Occupational and Physical Therapist Assistant or Aide')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1017, N'HS3', N'Other Healhcare Support Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1018, N'BEMF1', N'Chief Executive')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1019, N'BEMF2', N'General and Operations Manager')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1020, N'BEMF3', N'Advertising, Marketing, Promotions, Public Relations, and Sales Manager')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1021, N'BEMF4', N'Operations Specialties Manager (e.g., IT or HR Manager)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1022, N'BEMF5', N'Construction Manager')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1023, N'BEMF6', N'Engineering Manager')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1024, N'BEMF7', N'Accountant, Auditor')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1025, N'BEMF8', N'Business Operations or Financial Specialist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1026, N'BEMF9', N'Business Owner')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1027, N'BEMF10', N'Other Business, Executive, Management, Financial Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1028, N'AE1', N'Architect, Surveyor, or Cartographer')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1029, N'AE2', N'Engineer')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1030, N'AE3', N'Other Architecture and Engineering Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1031, N'ETL1', N'Postsecondary Teacher (e.g., College Professor)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1032, N'ETL2', N'Primary, Secondary, or Special Education School Teacher')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1033, N'ETL3', N'Other Teacher or Instructor')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1034, N'ETL4', N'Other Education, Training, and Library Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1035, N'OP1', N'Arts, Design, Entertainment, Sports, and Media Occupations')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1036, N'OP2', N'Computer Specialist, Mathematical Science')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1037, N'OP3', N'Counselor, Social Worker, or Other Community and Social Service Specialist')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1038, N'OP4', N'Lawyer, Judge')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1039, N'OP5', N'Life Scientist (e.g., Animal, Food, Soil, or Biological Scientist, Zoologist)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1040, N'OP6', N'Physical Scientist (e.g., Astronomer, Physicist, Chemist, Hydrologist)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1041, N'OP7', N'Religious Worker (e.g., Clergy, Director of Religious Activities or Education)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1042, N'OP8', N'Social Scientist and Related Worker')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1043, N'OP9', N'Other Professional Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1044, N'OAS1', N'Supervisor of Administrative Support Workers')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1045, N'OAS2', N'Financial Clerk')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1046, N'OAS3', N'Secretary or Administrative Assistant')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1047, N'OAS4', N'Material Recording, Scheduling, and Dispatching Worker')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1048, N'OAS5', N'Other Office and Administrative Support Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1049, N'S1', N'Protective Service (e.g., Fire Fighting, Police Officer, Correctional Officer)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1050, N'S2', N'Chef or Head Cook')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1051, N'S3', N'Cook or Food Preparation Worker')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1052, N'S4', N'Food and Beverage Serving Worker (e.g., Bartender, Waiter, Waitress)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1053, N'S5', N'Building and Grounds Cleaning and Maintenance')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1054, N'S6', N'Personal Care and Service (e.g., Hairdresser, Flight Attendant, Concierge)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1055, N'S7', N'Sales Supervisor, Retail Sales')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1056, N'S8', N'Retail Sales Worker')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1057, N'S9', N'Insurance Sales Agent')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1058, N'S10', N'Sales Representative')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1059, N'S11', N'Real Estate Sales Agent')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1060, N'S12', N'Other Services Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1061, N'AMRSC1', N'Construction and Extraction (e.g., Construction Laborer, Electrician)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1062, N'AMRSC2', N'Farming, Fishing, and Forestry')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1063, N'AMRSC3', N'Installation, Maintenance, and Repair')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1064, N'AMRSC4', N'Production Occupations')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1065, N'AMRSC5', N'Other Agriculture, Maintenance, Repair, and Skilled Crafts Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1066, N'T1', N'Aircraft Pilot or Flight Engineer')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1067, N'T2', N'Motor Vehicle Operator (e.g., Ambulance, Bus, Taxi, or Truck Driver)')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1068, N'T3', N'Other Transportation Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1069, N'O1', N'Military')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1070, N'O2', N'Homemaker')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1071, N'O3', N'Other Occupation')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1072, N'O4', N'Don''t Know')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1073, N'O5', N'Not Applicable')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1074, N'Vận động viên', N'Vận động viên')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1075, N'Vận động viên - bơi lội', N'Vận động viên - bơi lội')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1076, N'Điền kinh', N'Điền kinh')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1077, N'thượng nghị sỹ', N'thượng nghị sỹ')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1078, N'Thương gia', N'Thương gia')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1079, N'Tiếp viên hàng không', N'Tiếp viên hàng không')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1080, N'Trình dược viên', N'Trình dược viên')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1081, N'Developer', N'Developer')
INSERT [dbo].[Occupation] ([OccupationID], [OccupationCode], [OccupationDescription]) VALUES (1082, N'dien kinh', N'dien kinh')
SET IDENTITY_INSERT [dbo].[Occupation] OFF
GO
SET IDENTITY_INSERT [dbo].[PastHistory] ON 

INSERT [dbo].[PastHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (1, N'Z94.7', N'Tình trạng ghép giác mạc', N'Tình trạng ghép giác mạc', 1)
INSERT [dbo].[PastHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (2, N'Z95.0', N'Tồn tại của thiết bị điện tại tim', N'Tồn tại của thiết bị điện tại tim', 1)
INSERT [dbo].[PastHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (3, N'Z96.1', N'Sự có mặt của thấu kính nội nhãn', N'Sự có mặt của thấu kính nội nhãn', 1)
INSERT [dbo].[PastHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (4, N'Z97.0', N'Sự có mặt mắt giả', N'Sự có mặt mắt giả', 1)
INSERT [dbo].[PastHistory] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (5, N'Z97.1', N'Sự có mặt của kính (toàn bộ) (một phần) hoặc/và kính áp tròng', N'Sự có mặt của kính (toàn bộ) (một phần) hoặc/và kính áp tròng', 1)
SET IDENTITY_INSERT [dbo].[PastHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientID], [FamilyName], [MiddleName], [GivenName], [GenderType], [DOB], [PhoneNumber], [Address], [Avatar], [HealthInsuranceID], [Email], [IdentificationNumber], [OccupationID], [EthnicityID], [NationalityID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [FullName], [AthenaID]) VALUES (1, NULL, NULL, NULL, 2, CAST(N'1999-02-12T00:00:00.000' AS DateTime), N'', N'', N'', NULL, N'', N'', NULL, NULL, NULL, 1, CAST(N'2021-07-26T04:44:35.530' AS DateTime), CAST(N'2021-07-26T04:44:35.530' AS DateTime), 4, 4, N'Default Patient', NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientSatisfaction] ON 

INSERT [dbo].[PatientSatisfaction] ([PatientSatisfactionID], [PatientSatisfactionCode], [CodeDescription]) VALUES (1, N'1', N'extremely well overall')
INSERT [dbo].[PatientSatisfaction] ([PatientSatisfactionID], [PatientSatisfactionCode], [CodeDescription]) VALUES (2, N'2', N'satisfied ')
INSERT [dbo].[PatientSatisfaction] ([PatientSatisfactionID], [PatientSatisfactionCode], [CodeDescription]) VALUES (3, N'3', N'average ')
INSERT [dbo].[PatientSatisfaction] ([PatientSatisfactionID], [PatientSatisfactionCode], [CodeDescription]) VALUES (4, N'4', N'dissatisfied ')
INSERT [dbo].[PatientSatisfaction] ([PatientSatisfactionID], [PatientSatisfactionCode], [CodeDescription]) VALUES (5, N'5', N'terrible ')
SET IDENTITY_INSERT [dbo].[PatientSatisfaction] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonalBehaviour] ON 

INSERT [dbo].[PersonalBehaviour] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (1, N'Z72.0', N'Sử dụng thuốc lá', N'Sử dụng thuốc lá', 1)
INSERT [dbo].[PersonalBehaviour] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (2, N'Z72.1', N'Sử dụng rượu', N'Sử dụng rượu', 1)
INSERT [dbo].[PersonalBehaviour] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (3, N'Z72.2', N'Sử dụng ma túy', N'Sử dụng ma túy', 1)
INSERT [dbo].[PersonalBehaviour] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (4, N'Z72.9', N'Vấn đề liên quan đến lối sống, không xác định', N'Vấn đề liên quan đến lối sống, không xác định', 1)
INSERT [dbo].[PersonalBehaviour] ([ID], [Code], [Description], [VNDescription], [StatusID]) VALUES (5, N'Z72.3', N'Không luyện tập thể dục', N'Không luyện tập thể dục', 1)
SET IDENTITY_INSERT [dbo].[PersonalBehaviour] OFF
GO
ALTER TABLE [dbo].[Allergy] ADD  CONSTRAINT [DF_Allergy_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[ChronicDisease] ADD  CONSTRAINT [DF_ChronicDisease_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[FamilyHistory] ADD  CONSTRAINT [DF_FamilyHistory_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[HealthInsurance] ADD  CONSTRAINT [DF_HealthInsurance_PublicInsurance]  DEFAULT ((1)) FOR [PublicInsurance]
GO
ALTER TABLE [dbo].[PastHistory] ADD  CONSTRAINT [DF_PastHistory_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PatientAdditionalStat] ADD  CONSTRAINT [DF_PatientAdditionalStat_TargetStatType]  DEFAULT ((1)) FOR [TargetStatType]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF_PaymentSummary_AdditionalPrice]  DEFAULT ((0)) FOR [AdditionalPrice]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF_PaymentSummary_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF_PaymentSummary_PromotionPrice]  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF_PaymentSummary_AdjustmentPrice]  DEFAULT ((0)) FOR [AdjustmentPrice]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF__PaymentSu__Payme__7908F585]  DEFAULT ((1)) FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[PaymentSummary] ADD  CONSTRAINT [DF_PaymentSummary_ExportInvoice]  DEFAULT ((0)) FOR [ExportInvoice]
GO
ALTER TABLE [dbo].[PersonalBehaviour] ADD  CONSTRAINT [DF_PersonalBehaviour_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_AdmissionType] FOREIGN KEY([AdmissionTypeID])
REFERENCES [dbo].[AdmissionType] ([AdmissionTypeID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_AdmissionType]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Alert] FOREIGN KEY([AlertID])
REFERENCES [dbo].[Alert] ([AlertID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Alert]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_PatientMasterIndex] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_PatientMasterIndex]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Refferral] FOREIGN KEY([ReferralID])
REFERENCES [dbo].[Referral] ([ReferralID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Refferral]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_ServiceGroup] FOREIGN KEY([ServiceGroupID])
REFERENCES [dbo].[ServiceGroup] ([ServiceGroupID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_ServiceGroup]
GO
ALTER TABLE [dbo].[Discharge]  WITH CHECK ADD  CONSTRAINT [FK_Discharge_DischargeMode] FOREIGN KEY([DischargeModeID])
REFERENCES [dbo].[DischargeMode] ([DischargeModeID])
GO
ALTER TABLE [dbo].[Discharge] CHECK CONSTRAINT [FK_Discharge_DischargeMode]
GO
ALTER TABLE [dbo].[Discharge]  WITH CHECK ADD  CONSTRAINT [FK_Discharge_PatientSatisfaction] FOREIGN KEY([PatientSatisfactionID])
REFERENCES [dbo].[PatientSatisfaction] ([PatientSatisfactionID])
GO
ALTER TABLE [dbo].[Discharge] CHECK CONSTRAINT [FK_Discharge_PatientSatisfaction]
GO
ALTER TABLE [dbo].[HealthInsurance]  WITH CHECK ADD  CONSTRAINT [FK_HealthInsurance_InsuranceCompany] FOREIGN KEY([InsuranceCompanyID])
REFERENCES [dbo].[InsuranceCompany] ([InsuranceCompanyID])
GO
ALTER TABLE [dbo].[HealthInsurance] CHECK CONSTRAINT [FK_HealthInsurance_InsuranceCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_PatientMasterIndex_Ethnicity] FOREIGN KEY([EthnicityID])
REFERENCES [dbo].[Ethnicity] ([EthnicityID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_PatientMasterIndex_Ethnicity]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_PatientMasterIndex_HealthInsurance] FOREIGN KEY([HealthInsuranceID])
REFERENCES [dbo].[HealthInsurance] ([HealthInsuranceID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_PatientMasterIndex_HealthInsurance]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_PatientMasterIndex_Nationality] FOREIGN KEY([NationalityID])
REFERENCES [dbo].[Nationality] ([NationalityID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_PatientMasterIndex_Nationality]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_PatientMasterIndex_Occupation] FOREIGN KEY([OccupationID])
REFERENCES [dbo].[Occupation] ([OccupationID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_PatientMasterIndex_Occupation]
GO
ALTER TABLE [dbo].[PersonalHistory]  WITH CHECK ADD  CONSTRAINT [FK_PersonalHistory_PatientMasterIndex] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[PersonalHistory] CHECK CONSTRAINT [FK_PersonalHistory_PatientMasterIndex]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_Refferral_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([HospitalID])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_Refferral_Hospital]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_PatientMasterIndex] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_PatientMasterIndex]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Alergy, 2 = Personal Behavior, 3 = Past History, 4 = Family history' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientAdditionalStat', @level2type=N'COLUMN',@level2name=N'TargetStatType'
GO
USE [master]
GO
ALTER DATABASE [PAS] SET  READ_WRITE 
GO
