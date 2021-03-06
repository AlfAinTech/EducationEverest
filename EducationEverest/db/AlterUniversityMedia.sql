/*
   Tuesday, February 20, 201810:45:01 AM
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
ALTER TABLE dbo.UniversityMedia
	DROP CONSTRAINT FK__Universit__Unive__4D5F7D71
GO
ALTER TABLE dbo.Universities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_UniversityMedia
	(
	id int NOT NULL IDENTITY (1, 1),
	UniversityId int NOT NULL,
	Path nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_UniversityMedia SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_UniversityMedia ON
GO
IF EXISTS(SELECT * FROM dbo.UniversityMedia)
	 EXEC('INSERT INTO dbo.Tmp_UniversityMedia (id, UniversityId, Path)
		SELECT id, UniversityId, CONVERT(nvarchar(MAX), Path) FROM dbo.UniversityMedia WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_UniversityMedia OFF
GO
DROP TABLE dbo.UniversityMedia
GO
EXECUTE sp_rename N'dbo.Tmp_UniversityMedia', N'UniversityMedia', 'OBJECT' 
GO
ALTER TABLE dbo.UniversityMedia ADD CONSTRAINT
	PK__Universi__3213E83FEB709BF9 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.UniversityMedia ADD CONSTRAINT
	FK__Universit__Unive__4D5F7D71 FOREIGN KEY
	(
	UniversityId
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
