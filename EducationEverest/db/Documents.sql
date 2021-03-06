USE [EducationEverest]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 02/17/2018 14:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[documentName] [nvarchar](50) NOT NULL,
	[documentURL] [nvarchar](max) NOT NULL,
	[userDetailID] [int] NOT NULL,
	[documentType] [nvarchar](50) NOT NULL,
	[documentSizeInKB] [int] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult_Document]    Script Date: 02/17/2018 14:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestResult_Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[documentID] [int] NOT NULL,
	[UniTestID] [int] NOT NULL,
 CONSTRAINT [PK_TestResult_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Document_Personal_Details]    Script Date: 02/17/2018 14:53:51 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Personal_Details] FOREIGN KEY([userDetailID])
REFERENCES [dbo].[Personal_Details] ([id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Personal_Details]
GO
/****** Object:  ForeignKey [FK_TestResult_Document_Document]    Script Date: 02/17/2018 14:53:51 ******/
ALTER TABLE [dbo].[TestResult_Document]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Document_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([id])
GO
ALTER TABLE [dbo].[TestResult_Document] CHECK CONSTRAINT [FK_TestResult_Document_Document]
GO
/****** Object:  ForeignKey [FK_TestResult_Document_University_Tests]    Script Date: 02/17/2018 14:53:51 ******/
ALTER TABLE [dbo].[TestResult_Document]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Document_University_Tests] FOREIGN KEY([UniTestID])
REFERENCES [dbo].[University_Tests] ([id])
GO
ALTER TABLE [dbo].[TestResult_Document] CHECK CONSTRAINT [FK_TestResult_Document_University_Tests]
GO
