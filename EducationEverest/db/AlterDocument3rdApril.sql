/*
   Tuesday, April 3, 201812:59:18 PM
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
ALTER TABLE dbo.[Document]
	DROP CONSTRAINT FK__Document__userID__36470DEF
GO
ALTER TABLE dbo.AspNetUsers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Document
	(
	id int NOT NULL IDENTITY (1, 1),
	documentName nvarchar(MAX) NOT NULL,
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
		SELECT id, CONVERT(nvarchar(MAX), documentName), documentURL, userID, documentType, documentSizeInKB FROM dbo.[Document] WITH (HOLDLOCK TABLOCKX)')
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
	FK__Document__userID__36470DEF FOREIGN KEY
	(
	userID
	) REFERENCES dbo.AspNetUsers
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
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
