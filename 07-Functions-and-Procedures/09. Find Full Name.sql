USE Bank2
GO

CREATE PROC usp_GetHoldersFullName
AS
SELECT FirstName + ' ' + LastName AS [Full Name] FROM AccountHolders
GO

EXEC dbo.usp_GetHoldersFullName