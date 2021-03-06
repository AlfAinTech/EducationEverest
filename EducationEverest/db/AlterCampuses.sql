/*
   Thursday, February 15, 201812:21:28 PM
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
ALTER TABLE dbo.CampusProfile
	DROP CONSTRAINT FK__CampusPro__Campu__2A164134
GO
ALTER TABLE dbo.Campuses ADD
	Status bit NULL
GO
ALTER TABLE dbo.Campuses SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
