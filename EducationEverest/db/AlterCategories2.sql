/*
   Friday, February 16, 20185:33:06 PM
   User: 
   Server: DESKTOP-PNMV0HS\SQLEXPRESS
   Database: EducationEverest
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
ALTER TABLE dbo.Categories
	DROP CONSTRAINT FK__Categorie__Uni_I__59FA5E80
GO
ALTER TABLE dbo.Universities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Categories
	DROP COLUMN Uni_ID
GO
ALTER TABLE dbo.Categories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
