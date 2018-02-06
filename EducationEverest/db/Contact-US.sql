USE [EducationEverest]
GO

/****** Object:  Table [dbo].[Contact_Us]    Script Date: 06-Feb-18 11:36:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Contact_Us](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](128) NULL,
	[User_Email] [nvarchar](128) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact_Us] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Contact_Us]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Us_Contact_Us] FOREIGN KEY([User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[Contact_Us] CHECK CONSTRAINT [FK_Contact_Us_Contact_Us]
GO


