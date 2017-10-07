USE master
GO

CREATE DATABASE UniversityDatabase
GO

USE UniversityDatabase
GO

CREATE TABLE Majors (
	MajorID INT IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Majors PRIMARY KEY (MajorID)
)

CREATE TABLE Students (
	StudentID INT IDENTITY,
	StudentNumber VARCHAR(50) NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT NOT NULL,
	CONSTRAINT PK_Students PRIMARY KEY (StudentID)
)

CREATE TABLE Payments (
	PaymentID INT IDENTITY,
	PaymentDate DATE NOT NULL,
	PaymentAmount DECIMAL(15, 2) NOT NULL,
	StudentID INT NOT NULL,
	CONSTRAINT PK_Payments PRIMARY KEY (PaymentID)
)

CREATE TABLE Agenda (
	StudentID INT,
	SubjectID INT,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Subjects (
	SubjectID INT IDENTITY,
	SubjectName VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Subjects PRIMARY KEY (SubjectID)
)
GO

ALTER TABLE Students
ADD CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)

ALTER TABLE Agenda
ADD 
CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
