USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Portfolios](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Uni_ID] int NOT NULL foreign key references Universities(id),
	[Contact1] nvarchar(128),
	[Contact2] nvarchar(128),
	[Contact3] nvarchar(128),
	[Contact4] nvarchar(128),
	[Email] nvarchar(128),
	[Address] nvarchar(128),
	[Category] nvarchar(128)

) ON [PRIMARY] 
GO

