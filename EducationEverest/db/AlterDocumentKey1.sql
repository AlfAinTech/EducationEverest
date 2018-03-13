/*
   Tuesday, March 13, 20188:58:40 AM
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
EXECUTE sp_rename N'dbo.[Document].userDetailID', N'Tmp_userID', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.[Document].Tmp_userID', N'userID', 'COLUMN' 
GO
ALTER TABLE dbo.[Document] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'CONTROL') as Contr_Per 