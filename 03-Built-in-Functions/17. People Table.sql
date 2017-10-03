USE Orders
GO

DROP TABLE People
GO

CREATE TABLE People (
	Id INT IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	Birthdate DATETIME NOT NULL
)
GO

INSERT INTO People (Name, Birthdate) VALUES
('Victor', '2000-12-07'),
('Steven', '1992-09-10'),
('Stephen', '1910-09-19'),
('John', '2010-01-06'),
('Ivan', '2001-11-23'),
('Misho', '2000-09-30'),
('Pesho', '1995-01-02'),
('Gosho', '1993-03-17'),
('Sasho', '1998-10-07'),
('Nikolay', '1988-05-06')
GO

/*
SELECT [Name],
		CASE
			WHEN DATEPART(MONTH, Birthdate) < DATEPART(MONTH, GETDATE())
			THEN DATEDIFF(YEAR, Birthdate, GETDATE())
			ELSE DATEDIFF(YEAR, Birthdate, GETDATE()) - 1
		END
	AS [Age in Years],
	DATEDIFF(MONTH, Birthdate, GETDATE()) AS [Age in Months],
	DATEDIFF(DAY, Birthdate, GETDATE()) AS [Age in Days],
	DATEDIFF(MINUTE, Birthdate, GETDATE()) AS [Age in Minutes]
FROM People
*/

SELECT [Name],
	[Age in Years] = 
		CASE
			WHEN DATEPART(MONTH, Birthdate) < DATEPART(MONTH, GETDATE())
			THEN DATEDIFF(YEAR, Birthdate, GETDATE())
			ELSE DATEDIFF(YEAR, Birthdate, GETDATE()) - 1
		END,
	[Age in Months] = DATEDIFF(MONTH, Birthdate, GETDATE()),
	[Age in Days] = DATEDIFF(DAY, Birthdate, GETDATE()),
	[Age in Minutes] = DATEDIFF(MINUTE, Birthdate, GETDATE())
FROM People