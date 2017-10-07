USE master
GO

CREATE DATABASE TableRelations
COLLATE Cyrillic_General_100_CI_AI
GO

USE TableRelations
GO

DROP TABLE Persons
GO

DROP TABLE Passports
GO

CREATE TABLE Passports (
	PassportID INT IDENTITY(101, 1),
	PassportNumber VARCHAR(8) NOT NULL,
	CONSTRAINT PK_Passports PRIMARY KEY (PassportID)
)
GO

CREATE TABLE Persons (
	PersonID INT IDENTITY,
	FirstName NVARCHAR(20) NOT NULL,
	Salary DECIMAL(15, 2) NOT NULL,
	PassportID INT NOT NULL,
	CONSTRAINT PK_Persons PRIMARY KEY (PersonID),
	CONSTRAINT UQ_Persons_PassportID UNIQUE (PassportID),
	CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)
)
GO

INSERT INTO Passports (PassportNumber) VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')
GO

INSERT INTO Persons (FirstName, Salary, PassportID) VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)