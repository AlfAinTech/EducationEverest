USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SystemNotifications](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Title] nvarchar(MAX),
	[User_ID] nvarchar(128) NOT NULL foreign key references AspNetUsers(id),
	[AppID] int NOT NULL foreign key references Applications(id),
	[Read] bit ,
	[Type] nvarchar(128),
	[TriggeredBy] nvarchar(128),
	[DateTime] dateTime

) ON [PRIMARY] 
GO