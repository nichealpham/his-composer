USE [master]
GO
/****** Object:  Database [HR]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE DATABASE [HR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR', FILENAME = N'/var/opt/mssql/data/HR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'HR_log', FILENAME = N'/var/opt/mssql/data/HR_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HR] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HR] SET  MULTI_USER 
GO
ALTER DATABASE [HR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HR] SET QUERY_STORE = OFF
GO
USE [HR]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[BrandName] [nvarchar](250) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Avatar] [nvarchar](500) NULL,
	[TaxNumber] [nvarchar](50) NULL,
	[Website] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryRoster]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRoster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[Color] [nvarchar](10) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_CategoryRoster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[BrandID] [int] NULL,
	[ClinicGroupID] [int] NULL,
	[ClinicName] [nvarchar](250) NOT NULL,
	[Description] [ntext] NULL,
	[Hotline] [nvarchar](50) NULL,
	[Address] [nvarchar](650) NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClinicGroup]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicGroup](
	[ClinicGroupID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
	[GroupName] [nvarchar](250) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_ClinicGroup] PRIMARY KEY CLUSTERED 
(
	[ClinicGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RecurrencePatternID] [int] NULL,
	[CategoryID] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[TimeStart] [datetime2](7) NOT NULL,
	[TimeEnd] [datetime2](7) NOT NULL,
	[IsFullday] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ParentEventID] [int] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventAttendees]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventAttendees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[AttendeeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_EventAttendees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecurrencePattern]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecurrencePattern](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeparationCount] [int] NULL,
	[MaxRecurrence] [int] NULL,
	[DayOfWeek] [int] NOT NULL,
	[WeekOfMonth] [int] NOT NULL,
	[DayOfMonth] [int] NOT NULL,
	[MonthOfYear] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_RecurrencePattern] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Floor] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomUsage]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomUsage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_RoomUsage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[UserCreatedID] [int] NOT NULL,
	[UserUpdatedID] [int] NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [varchar](150) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Avatar] [nvarchar](500) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](650) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 7/26/2021 11:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [BrandName], [Description], [Avatar], [TaxNumber], [Website]) VALUES (1, 1, CAST(N'2021-07-26T04:19:23.1401302' AS DateTime2), CAST(N'2021-07-26T04:19:23.1401648' AS DateTime2), 1, 1, N'Default Brand', N'Default Brand', N'', N'', N'https://gramme.io')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryRoster] ON 

INSERT [dbo].[CategoryRoster] ([ID], [Name], [Description], [StatusID], [Color], [CreatedAt], [UpdatedAt]) VALUES (1, N'In Office', N'The day that staffs must be at working', 1, N'#3F8FEE', CAST(N'2021-03-10T11:14:16.040' AS DateTime), CAST(N'2021-03-10T11:14:16.040' AS DateTime))
INSERT [dbo].[CategoryRoster] ([ID], [Name], [Description], [StatusID], [Color], [CreatedAt], [UpdatedAt]) VALUES (2, N'Out Of Office', N'Because of something, these days that staffs can not be at working (events of the year, stuck some else...)', 1, N'#7E0C0C', CAST(N'2021-03-10T14:56:53.510' AS DateTime), CAST(N'2021-03-10T14:56:53.510' AS DateTime))
INSERT [dbo].[CategoryRoster] ([ID], [Name], [Description], [StatusID], [Color], [CreatedAt], [UpdatedAt]) VALUES (1002, N'Vacation', N'Vacation in the year, or events in the year
(exp: 30/4, 1/5 ....)', 1, N'#F4BB55', CAST(N'2021-03-11T04:43:48.863' AS DateTime), CAST(N'2021-03-11T04:43:48.863' AS DateTime))
INSERT [dbo].[CategoryRoster] ([ID], [Name], [Description], [StatusID], [Color], [CreatedAt], [UpdatedAt]) VALUES (1003, N'Lunch', N'Time for taking a break, for having lunch', 1, N'#D36FEAFF', CAST(N'2021-03-11T04:55:07.120' AS DateTime), CAST(N'2021-03-11T04:55:07.120' AS DateTime))
INSERT [dbo].[CategoryRoster] ([ID], [Name], [Description], [StatusID], [Color], [CreatedAt], [UpdatedAt]) VALUES (1004, N'Reserved', N'can someone help me to understand that''s the name?
"Reserved" what does it mean? ', 1, N'#20CE33FF', CAST(N'2021-03-11T04:56:45.387' AS DateTime), CAST(N'2021-03-11T04:56:45.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoryRoster] OFF
GO
SET IDENTITY_INSERT [dbo].[Clinic] ON 

INSERT [dbo].[Clinic] ([ClinicID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [BrandID], [ClinicGroupID], [ClinicName], [Description], [Hotline], [Address]) VALUES (1, 1, CAST(N'2021-07-26T04:19:23.1804829' AS DateTime2), CAST(N'2021-07-26T04:19:23.1805158' AS DateTime2), 1, 1, 1, NULL, N'Default Clinic', N'Default Clinic', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Clinic] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [Name], [Description], [Floor], [ClinicID], [StatusID]) VALUES (1, N'GE.101', N'General Checkup Room', 1, 1, 1)
INSERT [dbo].[Room] ([ID], [Name], [Description], [Floor], [ClinicID], [StatusID]) VALUES (2, N'DR.101', N'Doctor room 1', 1, 1, 1)
INSERT [dbo].[Room] ([ID], [Name], [Description], [Floor], [ClinicID], [StatusID]) VALUES (3, N'RF.101', N'Refraction Room 101', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomUsage] ON 

INSERT [dbo].[RoomUsage] ([ID], [RoomID], [UserID]) VALUES (1, 1, 2)
INSERT [dbo].[RoomUsage] ([ID], [RoomID], [UserID]) VALUES (2, 1, 3)
INSERT [dbo].[RoomUsage] ([ID], [RoomID], [UserID]) VALUES (3, 1, 4)
INSERT [dbo].[RoomUsage] ([ID], [RoomID], [UserID]) VALUES (4, 2, 2)
INSERT [dbo].[RoomUsage] ([ID], [RoomID], [UserID]) VALUES (5, 3, 3)
SET IDENTITY_INSERT [dbo].[RoomUsage] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [UserTypeID], [UserName], [Password], [FullName], [Avatar], [Email], [Phone], [Address]) VALUES (1, 1, CAST(N'2021-07-26T04:19:22.8582734' AS DateTime2), CAST(N'2021-07-26T04:19:22.8583202' AS DateTime2), 0, 0, 2, N'root', N'Admin@123#', N'Root Account', NULL, N'root@gmail.com', N'', N'')
INSERT [dbo].[User] ([UserID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [UserTypeID], [UserName], [Password], [FullName], [Avatar], [Email], [Phone], [Address]) VALUES (2, 1, CAST(N'2021-07-26T04:20:16.3750981' AS DateTime2), CAST(N'2021-07-26T04:20:16.3751007' AS DateTime2), 1, 1, 3, N'doctor', N'123456', N'Default Doctor', N'', N'', N'', N'')
INSERT [dbo].[User] ([UserID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [UserTypeID], [UserName], [Password], [FullName], [Avatar], [Email], [Phone], [Address]) VALUES (3, 1, CAST(N'2021-07-26T04:20:33.5643167' AS DateTime2), CAST(N'2021-07-26T04:21:21.7171512' AS DateTime2), 1, 1, 4, N'optometrist', N'123456', N'Default Optometrist', N'', N'', N'', N'')
INSERT [dbo].[User] ([UserID], [StatusID], [DateCreated], [DateUpdated], [UserCreatedID], [UserUpdatedID], [UserTypeID], [UserName], [Password], [FullName], [Avatar], [Email], [Phone], [Address]) VALUES (4, 1, CAST(N'2021-07-26T04:20:52.7344805' AS DateTime2), CAST(N'2021-07-26T04:20:52.7344858' AS DateTime2), 1, 1, 6, N'receptionist', N'123456', N'Default Receptionist', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserInfoID], [UserID], [ClinicID], [BrandID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserInfo] ([UserInfoID], [UserID], [ClinicID], [BrandID]) VALUES (2, 2, 1, 1)
INSERT [dbo].[UserInfo] ([UserInfoID], [UserID], [ClinicID], [BrandID]) VALUES (3, 3, 1, 1)
INSERT [dbo].[UserInfo] ([UserInfoID], [UserID], [ClinicID], [BrandID]) VALUES (4, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
/****** Object:  Index [IX_Clinic_BrandID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Clinic_BrandID] ON [dbo].[Clinic]
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clinic_ClinicGroupID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Clinic_ClinicGroupID] ON [dbo].[Clinic]
(
	[ClinicGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicGroup_BrandID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClinicGroup_BrandID] ON [dbo].[ClinicGroup]
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserInfo_BrandID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserInfo_BrandID] ON [dbo].[UserInfo]
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserInfo_ClinicID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserInfo_ClinicID] ON [dbo].[UserInfo]
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserInfo_UserID]    Script Date: 7/26/2021 11:57:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserInfo_UserID] ON [dbo].[UserInfo]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[CategoryRoster] ADD  CONSTRAINT [DF_CategoryRoster_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[CategoryRoster] ADD  CONSTRAINT [DF_CategoryRoster_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[CategoryRoster] ADD  CONSTRAINT [DF_CategoryRoster_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF__Clinic__StatusID__4316F928]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[ClinicGroup] ADD  CONSTRAINT [DF__ClinicGro__Statu__3F466844]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Event_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[EventAttendees] ADD  CONSTRAINT [DF_EventAttendees_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[RecurrencePattern] ADD  CONSTRAINT [DF_RecurrencePattern_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Clinic]  WITH CHECK ADD  CONSTRAINT [FK_Clinic_Brand1] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Clinic] CHECK CONSTRAINT [FK_Clinic_Brand1]
GO
ALTER TABLE [dbo].[Clinic]  WITH CHECK ADD  CONSTRAINT [FK_Clinic_ClinicGroup1] FOREIGN KEY([ClinicGroupID])
REFERENCES [dbo].[ClinicGroup] ([ClinicGroupID])
GO
ALTER TABLE [dbo].[Clinic] CHECK CONSTRAINT [FK_Clinic_ClinicGroup1]
GO
ALTER TABLE [dbo].[ClinicGroup]  WITH CHECK ADD  CONSTRAINT [FK_ClinicGroup_Brand1] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[ClinicGroup] CHECK CONSTRAINT [FK_ClinicGroup_Brand1]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_RecurrencePattern] FOREIGN KEY([RecurrencePatternID])
REFERENCES [dbo].[RecurrencePattern] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_RecurrencePattern]
GO
ALTER TABLE [dbo].[EventAttendees]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendees_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[EventAttendees] CHECK CONSTRAINT [FK_EventAttendees_Event]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Clinic]
GO
ALTER TABLE [dbo].[RoomUsage]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsage_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[RoomUsage] CHECK CONSTRAINT [FK_RoomUsage_Room]
GO
ALTER TABLE [dbo].[RoomUsage]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsage_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[RoomUsage] CHECK CONSTRAINT [FK_RoomUsage_User]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Brand]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Clinic]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
USE [master]
GO
ALTER DATABASE [HR] SET  READ_WRITE 
GO
