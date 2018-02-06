USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Test_Results](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[User_ID] nvarchar(128) NOT NULL foreign key references AspNetUsers(id),
	[Test_Name] nvarchar(128),
	[Board] nvarchar(128),
	[Rollno] nvarchar(128),
	[Passing_Year] nvarchar(128),
	[Total_Marks] nvarchar(128),
	[Obtained_Marks] nvarchar(128),
	[Percentage] nvarchar(128),
	[Division] nvarchar(128)

) ON [PRIMARY] 
GO

