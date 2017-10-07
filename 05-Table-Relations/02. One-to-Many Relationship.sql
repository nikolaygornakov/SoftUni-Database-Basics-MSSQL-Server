USE TableRelations
GO

DROP TABLE Models
GO

DROP TABLE Manufacturers
GO

CREATE TABLE Manufacturers (
	ManufacturerID INT IDENTITY,
	[Name] NVARCHAR(20) NOT NULL,
	EstablishedOn DATE NOT NULL,
	CONSTRAINT PK_Manufacturers PRIMARY KEY (ManufacturerID)
)
GO

CREATE TABLE Models (
	ModelID INT IDENTITY(101, 1),
	[Name] NVARCHAR(20) NOT NULL,
	ManufacturerID INT NOT NULL,
	CONSTRAINT PK_Models PRIMARY KEY (ModelID),
	CONSTRAINT FK_Models_Manufacturers FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)
GO

INSERT INTO Manufacturers ([Name], EstablishedOn) VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')
GO

INSERT INTO Models ([Name], ManufacturerID) VALUES
('X1', 1),
('i6', 1),
('ModelS', 2),
('ModelX', 2),
('Model3', 2),
('Nova', 3)