/*
   Wednesday, February 21, 20183:19:01 PM
   User: 
   Server: M-LAB-PC\SQLEXPRESS
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
ALTER TABLE dbo.Universities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Universities', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Universities', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Universities', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TestResult_Document ADD CONSTRAINT
	FK_TestResult_Document_Universities FOREIGN KEY
	(
	UniID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TestResult_Document SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'CONTROL') as Contr_Per 