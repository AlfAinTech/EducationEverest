/*
   Saturday, February 17, 201811:37:35 AM
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
ALTER TABLE dbo.ProgrammCategories
	DROP CONSTRAINT FK__ProgrammC__Depar__6D0D32F4
GO
ALTER TABLE dbo.Departments
	DROP CONSTRAINT FK__Departmen__Campu__4E53A1AA
GO
ALTER TABLE dbo.Departments
	DROP COLUMN CampusID
GO
ALTER TABLE dbo.Departments SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProgrammCategories
	DROP CONSTRAINT FK__ProgrammC__Uni_I__6C190EBB
GO
ALTER TABLE dbo.Universities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProgrammCategories
	DROP COLUMN Uni_ID, Department_ID
GO
ALTER TABLE dbo.ProgrammCategories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
