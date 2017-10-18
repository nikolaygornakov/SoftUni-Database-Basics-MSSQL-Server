USE Bank2
GO

CREATE PROC usp_CalculateFutureValueForAccount (@AccountID INT, @InterestRate FLOAT)
AS
SELECT ah.Id AS [Account Id],
	   ah.FirstName AS [First Name],
	   ah.LastName AS [Last Name],
	   a.Balance AS [Current Balance],
	   dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5) AS [Balance in 5 years]
FROM AccountHolders AS ah
JOIN Accounts AS a ON a.Id = ah.Id
WHERE ah.Id = @AccountID
Go

EXEC dbo.usp_CalculateFutureValueForAccount 1, 0.1