USE [EducationEverest]
GO

/****** Object:  Table [dbo].[DreamType]    Script Date: 8/4/2017 5:06:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MakeChoices](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[User_ID] nvarchar(128) NOT NULL foreign key references AspNetUsers(id),
	[Uni_ID] int NOT NULL foreign key references Universities(id),
	[Campus_Id] int NOT NULL foreign key references Campuses(id),
	[Department_Id] int NOT NULL foreign key references Departments(id),
	[Programm_Id] int NOT NULL foreign key references Programms(id),
	[Category_Id] int NOT NULL foreign key references ProgrammCategories(id)

) ON [PRIMARY] 
GO

