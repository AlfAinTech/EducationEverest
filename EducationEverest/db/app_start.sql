USE [EducationEverest]
GO

/****** Object:  Table [dbo].[App_Start]    Script Date: 20-Mar-18 3:59:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[App_Start](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[AspNetUserID] [nvarchar](128) NULL,
	[datetime] [datetime] NULL,
 CONSTRAINT [PK_App_Start] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[App_Start]  WITH CHECK ADD  CONSTRAINT [FK_App_Start_AspNetUsers1] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[App_Start] CHECK CONSTRAINT [FK_App_Start_AspNetUsers1]
GO

