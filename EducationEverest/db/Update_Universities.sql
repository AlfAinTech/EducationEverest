/*
   Wednesday, November 8, 20174:46:52 PM
   User: sa
   Server: tcp:10.11.16.135
   Database: DreamBird
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Universities
 ADD last_updated datetime NULL 
GO
GO
ALTER TABLE dbo.Universities
 ADD updated_by nvarchar(128) NULL 
GO

GO
ALTER TABLE dbo.Universities
 ADD data_progress nvarchar(128) NULL 
GO

COMMIT
