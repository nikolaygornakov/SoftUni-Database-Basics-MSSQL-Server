USE Diablo
GO

CREATE FUNCTION ufn_CashInUsersGames(@GameName VARCHAR(MAX))
RETURNS TABLE
AS
RETURN (
	SELECT SUM(Cash) AS [SumCash]
	FROM (
		SELECT ug.Cash,
				ROW_NUMBER() OVER(ORDER BY ug.Cash DESC) AS [Row Number] 
		FROM UsersGames AS ug
		JOIN Games AS g ON g.Id = ug.GameId
		WHERE g.Name = @GameName
	) AS AllGameCash
	WHERE [Row Number] % 2 = 1
)
GO

SELECT * FROM dbo.ufn_CashInUsersGames('Lily Stargazer')
SELECT * FROM dbo.ufn_CashInUsersGames('Love in a mist')