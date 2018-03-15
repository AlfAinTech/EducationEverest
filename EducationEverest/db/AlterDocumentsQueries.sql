ALTER TABLE Document
DROP CONSTRAINT FK_Document_Personal_Details;

ALTER TABLE Document
Drop COLUMN userDetailID;

ALTER TABLE Document
ADD userID nvarchar(128) not Null;

ALTER TABLE Document
ADD FOREIGN KEY (userID) REFERENCES AspNetUsers(Id);



