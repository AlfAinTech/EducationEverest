USE [EducationEverest]
GO

/****** Object:  Table [dbo].[ProgrammCategories]    Script Date: 2/17/2018 2:27:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProgrammCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Programm_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([id])
GO

ALTER TABLE [dbo].[ProgrammCategories]  WITH CHECK ADD FOREIGN KEY([Programm_ID])
REFERENCES [dbo].[Programms] ([id])
GO


