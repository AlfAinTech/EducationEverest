USE [master]
GO
/****** Object:  Database [EducationEverest]    Script Date: 2/7/2018 12:22:20 PM ******/
CREATE DATABASE [EducationEverest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EducationEverest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EducationEverest.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EducationEverest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EducationEverest_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EducationEverest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EducationEverest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EducationEverest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EducationEverest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EducationEverest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EducationEverest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EducationEverest] SET ARITHABORT OFF 
GO
ALTER DATABASE [EducationEverest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EducationEverest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EducationEverest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EducationEverest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EducationEverest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EducationEverest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EducationEverest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EducationEverest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EducationEverest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EducationEverest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EducationEverest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EducationEverest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EducationEverest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EducationEverest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EducationEverest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EducationEverest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EducationEverest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EducationEverest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EducationEverest] SET  MULTI_USER 
GO
ALTER DATABASE [EducationEverest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EducationEverest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EducationEverest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EducationEverest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EducationEverest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EducationEverest]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdmissionDetails]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Criteria] [nvarchar](max) NULL,
	[AdmissionDocuments] [nvarchar](max) NULL,
	[FreeStructure] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Applications]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Region] [varchar](1) NULL,
	[SubmittedOn] [datetime] NULL,
	[CurrentStatus] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campuses]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Campus_Name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Category_Name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Us]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Us](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NULL,
	[User_Email] [nvarchar](128) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact_Us] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Current_Address] [nvarchar](128) NULL,
	[Permanent_Address] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NULL,
	[Landline] [nvarchar](128) NULL,
	[Phone] [nvarchar](128) NULL,
	[Phone_Father] [nvarchar](128) NULL,
	[Zip] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Department_Name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Intermediate_Education]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intermediate_Education](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Board] [nvarchar](128) NULL,
	[Rollno] [nvarchar](128) NULL,
	[Passing_Year] [nvarchar](128) NULL,
	[Total_Marks] [nvarchar](128) NULL,
	[Obtained_Marks] [nvarchar](128) NULL,
	[Percentage] [nvarchar](128) NULL,
	[Division] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MakeChoices]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakeChoices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Campus_Id] [int] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[Programm_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Matriculation_Education]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matriculation_Education](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Board] [nvarchar](128) NULL,
	[Rollno] [nvarchar](128) NULL,
	[Passing_Year] [nvarchar](128) NULL,
	[Total_Marks] [nvarchar](128) NULL,
	[Obtained_Marks] [nvarchar](128) NULL,
	[Percentage] [nvarchar](128) NULL,
	[Division] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Path] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal_Details]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Father_Name] [nvarchar](128) NULL,
	[CNIC] [nvarchar](128) NULL,
	[Father_CNIC] [nvarchar](128) NULL,
	[DOB] [date] NULL,
	[Nationality] [nvarchar](128) NULL,
	[Application_ID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Portfolios]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Contact1] [nvarchar](128) NULL,
	[Contact2] [nvarchar](128) NULL,
	[Contact3] [nvarchar](128) NULL,
	[Contact4] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Category] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgrammCategories]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Programm_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Programms]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Program_Name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test_Results]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NOT NULL,
	[Test_Name] [nvarchar](128) NULL,
	[Board] [nvarchar](128) NULL,
	[Rollno] [nvarchar](128) NULL,
	[Passing_Year] [nvarchar](128) NULL,
	[Total_Marks] [nvarchar](128) NULL,
	[Obtained_Marks] [nvarchar](128) NULL,
	[Percentage] [nvarchar](128) NULL,
	[Division] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Universities]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [nvarchar](128) NULL,
	[data_progress] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[University_Tests]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University_Tests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Test_Name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserActivation]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivation](
	[UserId] [nvarchar](128) NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 2/7/2018 12:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](128) NULL,
	[Phone] [nvarchar](128) NULL,
	[City] [nvarchar](128) NULL,
	[AspNetUserID] [nvarchar](128) NULL,
	[Email] [nvarchar](256) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/7/2018 12:22:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdmissionDetails]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Campuses]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Contact_Us]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Us_Contact_Us] FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Contact_Us] CHECK CONSTRAINT [FK_Contact_Us_Contact_Us]
GO
ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Intermediate_Education]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[ProgrammCategories] ([id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([Programm_Id])
REFERENCES [dbo].[Programms] ([id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[MakeChoices]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Matriculation_Education]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Personal_Details]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Portfolios]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Programm_ID])
REFERENCES [dbo].[Programms] ([id])
GO
ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Programms]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Programms]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Test_Results]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[University_Tests]  WITH CHECK ADD FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers1] FOREIGN KEY([Email])
REFERENCES [dbo].[AspNetUsers] ([UserName])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers1]
GO
USE [master]
GO
ALTER DATABASE [EducationEverest] SET  READ_WRITE 
GO
