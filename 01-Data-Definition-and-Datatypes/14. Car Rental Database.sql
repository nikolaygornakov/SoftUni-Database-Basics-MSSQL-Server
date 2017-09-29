USE master
GO

CREATE DATABASE CarRental
COLLATE Cyrillic_General_100_CI_AI
GO

USE CarRental
GO

CREATE TABLE Categories (
	Id INT IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	DailyRate DECIMAL(3, 2),
	WeeklyRate DECIMAL(3, 2),
	MonthlyRate DECIMAL(3, 2),
	WeekendRate DECIMAL(3, 2),
	CONSTRAINT PK_Categories PRIMARY KEY (Id)
)

CREATE TABLE Cars (
	Id INT IDENTITY NOT NULL,
	PlateNumber NVARCHAR(8) NOT NULL,
	Manufacturer NVARCHAR(20) NOT NULL,
	Model NVARCHAR(20) NOT NULL,
	CarYear SMALLINT NOT NULL,
	CategoryId INT NOT NULL,
	Doors TINYINT NOT NULL,
	Picture VARBINARY(MAX),
	Condition NVARCHAR(20),
	Available BIT NOT NULL,
	CONSTRAINT PK_Cars PRIMARY KEY (Id),
	CONSTRAINT CK_Cars_PictureSize CHECK (DATALENGTH(Picture) <= 1024 * 1024)
)

CREATE TABLE Employees (
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers (
	Id INT IDENTITY NOT NULL,
	DriverLicenseNumber NVARCHAR(20) NOT NULL,
	FullName NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	City NVARCHAR(20) NOT NULL,
	ZIPCode NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(1000),
	CONSTRAINT PK_Customers PRIMARY KEY (Id)
)

CREATE TABLE RentalOrders (
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	CustomerId INT NOT NULL,
	CarId INT NOT NULL,
	TankLevel INT,
	KilometrageStart INT,
	KilometrageEnd INT,
	TotalKilometrage INT,
	StartDate DATE,
	EndDate DATE,
	TotalDays INT,
	RateApplied DECIMAL(3, 2),
	TaxRate DECIMAL(3, 2),
	OrderStatus NVARCHAR(10),
	Notes NVARCHAR(1000),
	CONSTRAINT PK_RentalOrders PRIMARY KEY (Id)
)

INSERT INTO Categories (CategoryName) VALUES
('Car'),
('Truck'),
('Bus')

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
('XX1234XX', 'Mercedes', 'AMG', 2017, 1, 3, NULL, 'New', 1),
('BB1234BB', 'BMW', 'i8', 2015, 1, 3, NULL, 'Used', 1),
('AA1234AA', 'Audi', 'A6', 2013, 1, 5, NULL, 'New', 1)

INSERT INTO Employees (FirstName, LastName) VALUES
('Kolio', 'Kolev'),
('Pesho', 'Peshev'),
('Gosho', 'Goshev')

INSERT INTO Customers (DriverLicenseNumber, FullName, Address, City, ZIPCode, Notes) VALUES
('A123B123AS', 'Petar Petrov', 'Petrovska', 'Sofia', '1000', NULL),
('I213SA882F', 'Ivan Ivanov', 'Burgaska', 'Burgas', '8000', NULL),
('BAS1234AAA', 'Georgi Georgiev', 'Plovdivska', 'Plovdiv', '4000', NULL)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId) VALUES
(1, 2, 2),
(2, 1, 3),
(3, 3, 1)