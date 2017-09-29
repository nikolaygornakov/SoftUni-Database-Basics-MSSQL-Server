USE master
GO

CREATE DATABASE Hotel
COLLATE Cyrillic_General_CI_AI
GO

USE Hotel
GO

CREATE TABLE Employees (
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVARCHAR(30),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers (
	AccountNumber INT NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(15),
	EmergencyName NVARCHAR(30),
	EmergencyNumber VARCHAR(15),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Customers PRIMARY KEY (AccountNumber)
)

CREATE TABLE RoomStatus (
	RoomStatus VARCHAR(10) NOT NULL,
	Notes NVARCHAR(1000),
	CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus)
	--CONSTRAINT DF_RoomStatus_State DEFAULT ('Available')--
)

CREATE TABLE RoomTypes (
	RoomType VARCHAR(10) NOT NULL,
	Notes NVARCHAR(1000),
	CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes (
	BedType VARCHAR(10) NOT NULL,
	Notes NVARCHAR(1000),
	CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms (
	RoomNumber INT NOT NULL,
	RoomType VARCHAR(10) NOT NULL,
	BedType VARCHAR(10) NOT NULL,
	Rate DECIMAL(3, 2),
	RoomStatus VARCHAR(10) NOT NULL,
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Rooms PRIMARY KEY (RoomNumber)
)

CREATE TABLE Payments (
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	PaymentDate DATETIME,
	AccountNumber INT NOT NULL,
	FirstDateOccupied DATE,
	LastDateOccupied DATE,
	TotalDays INT,
	AmountCharged DECIMAL(15, 2),
	TaxRate DECIMAL(5, 2),
	TaxAmount DECIMAL(15, 2),
	PaymentTotal DECIMAL(15, 2),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Payments PRIMARY KEY (Id)
)

CREATE TABLE Occupancies (
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	DateOccupied DATE NOT NULL,
	AccountNumber INT NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied DECIMAL(3, 2),
	PhoneCharge DECIMAL(15, 2),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Occupancies PRIMARY KEY (Id)
)

INSERT INTO Employees (FirstName, LastName) VALUES
('Gosho', 'Goshev'),
('Pesho', 'Peshev'),
('Misho', 'Mishev')

INSERT INTO Customers (AccountNumber, FirstName, LastName) VALUES
(435345, 'Ivan', 'Ivanov'),
(231312, 'Petar', 'Petrov'),
(123545, 'Atanas', 'Atanasov')

INSERT INTO RoomStatus (RoomStatus) VALUES
('Available'),
('Busy'),
('Service')

INSERT INTO RoomTypes (RoomType) VALUES
('Single'),
('Double'),
('Triple')

INSERT INTO BedTypes (BedType) VALUES
('Single'),
('Double'),
('Twin')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus) VALUES
(101, 'Double', 'Single', NULL, 'Service'),
(108, 'Double', 'Twin', 4, 'Busy'),
(231, 'Single', 'Double', 9.5, 'Available')

INSERT INTO Payments (EmployeeId, AccountNumber, TaxRate) VALUES
(1, 435345, 50),
(1, 231312, 22.4),
(3, 123545, 10)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber) VALUES
(2, '2015-10-17', 435345, 211),
(3, '2016-07-23', 123545, 108),
(2, '2017-03-15', 435345, 231)