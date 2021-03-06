USE master
GO

CREATE DATABASE SoftUni
COLLATE Cyrillic_General_CI_AI
GO

USE SoftUni
GO

CREATE TABLE Towns (
	Id INT IDENTITY(1, 1) NOT NULL,
	[Name] NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY (Id)
)

CREATE TABLE Addresses (
	Id INT IDENTITY(1, 1) NOT NULL,
	AddressText NVARCHAR(100) NOT NULL,
	TownId INT NOT NULL,
	CONSTRAINT PK_Addresses PRIMARY KEY (Id),
	CONSTRAINT FK_Towns_Id FOREIGN KEY (TownId)
	REFERENCES Towns(Id)
)

CREATE TABLE Departments (
	Id INT IDENTITY(1, 1) NOT NULL,
	Name NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Departments PRIMARY KEY (Id)
)

CREATE TABLE Employees (
	Id INT IDENTITY(1, 1) NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	MiddleName NVARCHAR(20),
	LastName NVARCHAR(20) NOT NULL,
	JobTitle NVARCHAR(50) NOT NULL,
	DepartmentId INT NOT NULL,
	HireDate DATE NOT NULL,
	Salary DECIMAL(10, 2),
	AddressId INT,
	CONSTRAINT PK_Employees PRIMARY KEY (Id),
	CONSTRAINT FK_Employees_Departmens FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	CONSTRAINT FK_Employees_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)