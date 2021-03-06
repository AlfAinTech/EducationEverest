/*
   Thursday, March 08, 20182:51:24 PM
   User: 
   Server: M-LAB-PC\SQLEXPRESS
   Database: EducationEverest_wajid
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
EXECUTE sp_rename N'dbo.Payment.AppID', N'Tmp_ApplicationID', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Payment.Tmp_ApplicationID', N'ApplicationID', 'COLUMN' 
GO
ALTER TABLE dbo.Payment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Payment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Payment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Payment', 'Object', 'CONTROL') as Contr_Per 