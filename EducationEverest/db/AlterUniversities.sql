/*
   Thursday, February 15, 201812:16:20 PM
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
CREATE TABLE dbo.Tmp_Universities
	(
	id int NOT NULL IDENTITY (1, 1),
	Name nvarchar(128) NULL,
	last_updated datetime NULL,
	updated_by nvarchar(128) NULL,
	Status bit NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Universities SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Universities ON
GO
IF EXISTS(SELECT * FROM dbo.Universities)
	 EXEC('INSERT INTO dbo.Tmp_Universities (id, Name, last_updated, updated_by, Status)
		SELECT id, Name, last_updated, updated_by, CONVERT(bit, data_progress) FROM dbo.Universities WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Universities OFF
GO
ALTER TABLE dbo.MakeChoices
	DROP CONSTRAINT FK__MakeChoic__Uni_I__72C60C4A
GO
ALTER TABLE dbo.ProgrammCategories
	DROP CONSTRAINT FK__ProgrammC__Uni_I__6C190EBB
GO
ALTER TABLE dbo.Programms
	DROP CONSTRAINT FK__Programms__Uni_I__68487DD7
GO
ALTER TABLE dbo.Departments
	DROP CONSTRAINT FK__Departmen__Uni_I__656C112C
GO
ALTER TABLE dbo.AdmissionDetails
	DROP CONSTRAINT FK__Admission__Uni_I__628FA481
GO
ALTER TABLE dbo.Campuses
	DROP CONSTRAINT FK__Campuses__Uni_ID__5CD6CB2B
GO
ALTER TABLE dbo.Categories
	DROP CONSTRAINT FK__Categorie__Uni_I__59FA5E80
GO
ALTER TABLE dbo.Portfolios
	DROP CONSTRAINT FK__Portfolio__Uni_I__5441852A
GO
ALTER TABLE dbo.University_Tests
	DROP CONSTRAINT FK__Universit__Uni_I__4D94879B
GO
DROP TABLE dbo.Universities
GO
EXECUTE sp_rename N'dbo.Tmp_Universities', N'Universities', 'OBJECT' 
GO
ALTER TABLE dbo.Universities ADD CONSTRAINT
	PK__Universi__3213E83FA0B7ECB8 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.University_Tests ADD CONSTRAINT
	FK__Universit__Uni_I__4D94879B FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.University_Tests SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Portfolios ADD CONSTRAINT
	FK__Portfolio__Uni_I__5441852A FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Portfolios SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Categories ADD CONSTRAINT
	FK__Categorie__Uni_I__59FA5E80 FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Categories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Campuses ADD CONSTRAINT
	FK__Campuses__Uni_ID__5CD6CB2B FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Campuses SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.AdmissionDetails ADD CONSTRAINT
	FK__Admission__Uni_I__628FA481 FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.AdmissionDetails SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Departments ADD CONSTRAINT
	FK__Departmen__Uni_I__656C112C FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Departments SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Programms ADD CONSTRAINT
	FK__Programms__Uni_I__68487DD7 FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Programms SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProgrammCategories ADD CONSTRAINT
	FK__ProgrammC__Uni_I__6C190EBB FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProgrammCategories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MakeChoices ADD CONSTRAINT
	FK__MakeChoic__Uni_I__72C60C4A FOREIGN KEY
	(
	Uni_ID
	) REFERENCES dbo.Universities
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.MakeChoices SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
