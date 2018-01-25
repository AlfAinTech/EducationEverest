USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personal_Details](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[User_ID] nvarchar(128) NOT NULL foreign key references AspNetUsers(id),
	[Name] nvarchar(128),
	[Father_Name] nvarchar(128),
	[CNIC] nvarchar(128),
	[Father_CNIC] nvarchar(128),
	[DOB] date,
	[Nationality] nvarchar(128),
	[Application_ID] nvarchar(128)

) ON [PRIMARY] 
GO

