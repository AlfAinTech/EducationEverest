USE [EducationEverest]
GO

/****** Object:  Table [dbo].[UserActivation]    Script Date: 02-Feb-18 3:02:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserActivation](
	[UserId] [nvarchar](128) NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


