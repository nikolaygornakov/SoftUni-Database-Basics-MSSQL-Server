USE Minions

CREATE TABLE People (
	Id INT IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	Height DECIMAL(10, 2),
	[Weight] DECIMAL(10, 2),
	Gender VARCHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX),
	CONSTRAINT PK_People PRIMARY KEY (Id),
	CONSTRAINT CK_PictureSize CHECK(DATALENGTH(Picture) <= 2048 * 1024),
	CONSTRAINT CK_Gender CHECK(Gender = 'm' OR Gender = 'f')
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES
('Pesho', NULL, 1.87, 75.4, 'm', '1989-12-14', NULL),
('Maria', NULL, 1.64, 50, 'f', '1995-08-11', NULL),
('Gosho', NULL, 1.83, 82, 'm', '1988-10-17', NULL),
('Ivan', NULL, 1.76, 74, 'm', '1992-05-14', NULL),
('Maya', NULL, 1.7, 53.6, 'f', '1993-11-29', NULL)