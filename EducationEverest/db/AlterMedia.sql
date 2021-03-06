/*
   Wednesday, February 21, 20183:15:03 PM
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
ALTER TABLE dbo.Media
	DROP CONSTRAINT FK__Media__User_ID__2E1BDC42
GO
ALTER TABLE dbo.AspNetUsers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Media
	(
	id int NOT NULL IDENTITY (1, 1),
	User_ID nvarchar(128) NOT NULL,
	Path nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Media SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Media ON
GO
IF EXISTS(SELECT * FROM dbo.Media)
	 EXEC('INSERT INTO dbo.Tmp_Media (id, User_ID, Path)
		SELECT id, User_ID, CONVERT(nvarchar(MAX), Path) FROM dbo.Media WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Media OFF
GO
ALTER TABLE dbo.UniversityProfile
	DROP CONSTRAINT FK__Universit__LogoA__42E1EEFE
GO
DROP TABLE dbo.Media
GO
EXECUTE sp_rename N'dbo.Tmp_Media', N'Media', 'OBJECT' 
GO
ALTER TABLE dbo.Media ADD CONSTRAINT
	PK__Media__3213E83F053D43B5 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Media ADD CONSTRAINT
	FK__Media__User_ID__2E1BDC42 FOREIGN KEY
	(
	User_ID
	) REFERENCES dbo.AspNetUsers
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.UniversityProfile ADD CONSTRAINT
	FK__Universit__LogoA__42E1EEFE FOREIGN KEY
	(
	LogoAttachment
	) REFERENCES dbo.Media
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UniversityProfile SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
