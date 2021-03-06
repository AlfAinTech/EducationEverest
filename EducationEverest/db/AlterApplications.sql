/*
   Tuesday, February 27, 201810:30:56 AM
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
ALTER TABLE dbo.Applications
	DROP CONSTRAINT FK__Applicati__UserI__5FB337D6
GO
ALTER TABLE dbo.AspNetUsers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Applications
	DROP CONSTRAINT FK_Applications_Universities
GO
ALTER TABLE dbo.Universities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Applications
	DROP CONSTRAINT FK_Applications_Departments
GO
ALTER TABLE dbo.Departments SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Applications
	(
	id int NOT NULL IDENTITY (1, 1),
	UserID nvarchar(128) NOT NULL,
	Region nvarchar(128) NULL,
	SubmittedOn datetime NULL,
	CurrentStatus nvarchar(128) NULL,
	UnivID int NULL,
	deptID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Applications SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Applications ON
GO
IF EXISTS(SELECT * FROM dbo.Applications)
	 EXEC('INSERT INTO dbo.Tmp_Applications (id, UserID, Region, SubmittedOn, CurrentStatus, UnivID, deptID)
		SELECT id, UserID, CONVERT(nvarchar(128), Region), SubmittedOn, CONVERT(nvarchar(128), CurrentStatus), UnivID, deptID FROM dbo.Applications WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Applications OFF
GO
DROP TABLE dbo.Applications
GO
EXECUTE sp_rename N'dbo.Tmp_Applications', N'Applications', 'OBJECT' 
GO
ALTER TABLE dbo.Applications ADD CONSTRAINT
	PK__Applicat__3213E83F89225268 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Applications ADD CONSTRAINT
	FK_Applications_Departments FOREIGN KEY
	(
	deptID
	) REFERENCES dbo.Departments
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Applications ADD CONSTRAINT
	FK_Applications_Universities FOREIGN KEY
	(
	UnivID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Applications ADD CONSTRAINT
	FK__Applicati__UserI__5FB337D6 FOREIGN KEY
	(
	UserID
	) REFERENCES dbo.AspNetUsers
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
