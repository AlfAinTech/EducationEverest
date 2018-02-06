USE [EducationEverest]
GO

/****** Object:  Table [dbo].[UserProfile]    Script Date: 06-Feb-18 3:15:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](128) NULL,
	[Phone] [nvarchar](128) NULL,
	[City] [nvarchar](128) NULL,
	[AspNetUserID] [nvarchar](128) NULL,
	[Email] [nvarchar](256) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers]
GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers1] FOREIGN KEY([Email])
REFERENCES [dbo].[AspNetUsers] ([UserName])
GO

ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers1]
GO


