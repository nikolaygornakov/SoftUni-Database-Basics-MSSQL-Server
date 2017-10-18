USE SoftUni
GO

CREATE PROC usp_GetTownsStartingWith (@String VARCHAR(MAX))
AS
SELECT [Name] AS Town FROM Towns
WHERE [Name] LIKE @String + '%'
GO

EXEC usp_GetTownsStartingWith be