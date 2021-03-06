USE [EducationEverest_wajid]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03/06/2018 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TrackingID] [nvarchar](100) NOT NULL,
	[AppID] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Payment_Applications]    Script Date: 03/06/2018 14:50:13 ******/
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Applications] FOREIGN KEY([AppID])
REFERENCES [dbo].[Applications] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Applications]
GO
