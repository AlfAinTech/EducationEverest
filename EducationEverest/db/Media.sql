USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Media](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[User_ID] nvarchar(128) NOT NULL foreign key references AspNetUsers(id),
	[Path] nvarchar(128)

) ON [PRIMARY] 
GO

