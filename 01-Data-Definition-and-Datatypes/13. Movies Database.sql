USE master
GO

CREATE DATABASE Movies
COLLATE Cyrillic_General_100_CI_AI
GO

USE Movies
GO

CREATE TABLE Directors (
	Id INT IDENTITY NOT NULL,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Directors PRIMARY KEY (Id)
)

CREATE TABLE Genres (
	Id INT IDENTITY NOT NULL,
	GenreName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Genres PRIMARY KEY (Id)
)

CREATE TABLE Categories (
	Id INT IDENTITY NOT NULL,
	CategoryName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Categories PRIMARY KEY (Id)
)

CREATE TABLE Movies (
	Id INT IDENTITY NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	DirectorId INT NOT NULL,
	CopyRightYear SMALLINT NOT NULL,
	[Length] INT NOT NULL,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating DECIMAL(3, 2),
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Movies PRIMARY KEY (Id)
)
--GO--

INSERT INTO Directors (DirectorName, Notes) VALUES
('David Benioff', NULL),
('Michael Bay', NULL),
('James Cameron', NULL),
('Pierre Morel', NULL),
('Andrew Stanton', NULL)

INSERT INTO Genres (GenreName, Notes) VALUES
('Action', NULL),
('Comedy', NULL),
('Adventure', NULL),
('Fantasy', NULL),
('Animation', NULL)

INSERT INTO Categories (CategoryName, Notes) VALUES
('Family', NULL),
('13+', NULL),
('16+', NULL),
('18+', NULL),
('TV Series', NULL)
--GO--

INSERT INTO Movies (Title, DirectorId, CopyRightYear, Length, GenreId, CategoryId, Rating, Notes) VALUES
('Game of thrones', 1, 2011, 54, 4, 3, 9.5, NULL),
('Avatar', 3, 2009, 162, 3, 3, 7.8, NULL),
('WALL-E', 5, 2008, 98, 5, 1, 8.4, NULL),
('Taken', 4, 2008, 93, 1, 2, 7.8, NULL),
('Transformers', 2, 2007, 144, 4, 2, 7.1, NULL)