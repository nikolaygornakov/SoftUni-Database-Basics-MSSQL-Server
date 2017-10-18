USE Bank2
GO

CREATE PROC usp_GetHoldersWithBalanceHigherThan(@Amount DECIMAL(18, 4))
AS
SELECT FirstName, LastName
FROM (
	SELECT ah.FirstName AS FirstName, ah.LastName AS LastName, SUM(a.Balance) AS TotalBalance FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	GROUP BY ah.FirstName, ah.LastName
) AS TotalBalances
WHERE TotalBalance > @Amount
GO

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 200000 