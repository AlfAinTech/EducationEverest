USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Programms](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Uni_ID] int NOT NULL foreign key references Universities(id),
	[Department_ID] int NOT NULL foreign key references Departments(id),
	[Program_Name] nvarchar(128)

) ON [PRIMARY]
GO