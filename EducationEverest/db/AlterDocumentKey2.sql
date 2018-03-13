/*
   Tuesday, March 13, 20189:01:24 AM
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
ALTER TABLE dbo.Personal_Details
	DROP CONSTRAINT FK__Personal___User___73BA3083
GO
ALTER TABLE dbo.AspNetUsers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.AspNetUsers', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.AspNetUsers', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.AspNetUsers', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Personal_Details
	(
	id nvarchar(128) NOT NULL,
	User_ID nvarchar(128) NOT NULL,
	Name nvarchar(128) NULL,
	Father_Name nvarchar(128) NULL,
	CNIC nvarchar(128) NULL,
	Father_CNIC nvarchar(128) NULL,
	DOB date NULL,
	Nationality nvarchar(128) NULL,
	Application_ID nvarchar(128) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Personal_Details SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Personal_Details)
	 EXEC('INSERT INTO dbo.Tmp_Personal_Details (id, User_ID, Name, Father_Name, CNIC, Father_CNIC, DOB, Nationality, Application_ID)
		SELECT CONVERT(nvarchar(128), id), User_ID, Name, Father_Name, CNIC, Father_CNIC, DOB, Nationality, Application_ID FROM dbo.Personal_Details WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.[Document]
	DROP CONSTRAINT FK_Document_Personal_Details
GO
DROP TABLE dbo.Personal_Details
GO
EXECUTE sp_rename N'dbo.Tmp_Personal_Details', N'Personal_Details', 'OBJECT' 
GO
ALTER TABLE dbo.Personal_Details ADD CONSTRAINT
	PK__Personal__3213E83F3A81B327 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Personal_Details ADD CONSTRAINT
	FK__Personal___User___73BA3083 FOREIGN KEY
	(
	User_ID
	) REFERENCES dbo.AspNetUsers
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Personal_Details', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Personal_Details', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Personal_Details', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Document
	(
	id int NOT NULL IDENTITY (1, 1),
	documentName nvarchar(50) NOT NULL,
	documentURL nvarchar(MAX) NOT NULL,
	userID nvarchar(128) NOT NULL,
	documentType nvarchar(50) NOT NULL,
	documentSizeInKB int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Document SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Document ON
GO
IF EXISTS(SELECT * FROM dbo.[Document])
	 EXEC('INSERT INTO dbo.Tmp_Document (id, documentName, documentURL, userID, documentType, documentSizeInKB)
		SELECT id, documentName, documentURL, CONVERT(nvarchar(128), userID), documentType, documentSizeInKB FROM dbo.[Document] WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Document OFF
GO
ALTER TABLE dbo.TestResult_Document
	DROP CONSTRAINT FK_TestResult_Document_Document
GO
DROP TABLE dbo.[Document]
GO
EXECUTE sp_rename N'dbo.Tmp_Document', N'Document', 'OBJECT' 
GO
ALTER TABLE dbo.[Document] ADD CONSTRAINT
	PK_Documents PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[Document] ADD CONSTRAINT
	FK_Document_Personal_Details FOREIGN KEY
	(
	userID
	) REFERENCES dbo.Personal_Details
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.[Document]', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TestResult_Document ADD CONSTRAINT
	FK_TestResult_Document_Document FOREIGN KEY
	(
	documentID
	) REFERENCES dbo.[Document]
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TestResult_Document SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TestResult_Document', 'Object', 'CONTROL') as Contr_Per 