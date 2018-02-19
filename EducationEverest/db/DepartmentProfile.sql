USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DepartmentProfile](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[DepartmentID] int NOT NULL foreign key references Departments(id),
	[ApplicationFee] nvarchar(128),
	[Criteria] nvarchar(MAX),
	[AdmissionDocs] nvarchar(MAX)

) ON [PRIMARY] 
GO

