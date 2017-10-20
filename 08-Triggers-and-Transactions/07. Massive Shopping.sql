USE Diablo
GO

DECLARE @UserId INT = (
	SELECT Id
	FROM Users 
	WHERE Username = 'Stamat')

DECLARE @GameId INT = (
	SELECT Id
	FROM Games
	WHERE [Name] = 'Safflower')

DECLARE @UserGameId INT = (
	SELECT Id
	FROM UsersGames
	WHERE UserId = @UserId AND GameId = @GameId)

BEGIN TRANSACTION
DECLARE @UserBalance DECIMAL(18, 4) = (
	SELECT Cash
	FROM UsersGames
	WHERE Id = @UserGameId)

DECLARE @ItemsAmount DECIMAL(18, 4) = (
	SELECT SUM(Price)
	FROM Items
	WHERE MinLevel BETWEEN 11 AND 12)

IF (@UserBalance < @ItemsAmount)
BEGIN
   ROLLBACK
END
ELSE 
BEGIN
	UPDATE UsersGames
	   SET Cash -= @ItemsAmount
	 WHERE Id = @UserGameId

INSERT INTO UserGameItems (ItemId, UserGameId)
	 SELECT Id, @UserGameId
	   FROM Items 
	  WHERE MinLevel BETWEEN 11 AND 12
COMMIT
END

BEGIN TRANSACTION

SET @ItemsAmount = (
	SELECT SUM(Price)
	FROM Items
	WHERE MinLevel BETWEEN 19 AND 21)

IF (@UserBalance < @ItemsAmount)
BEGIN
	ROLLBACK
END
ELSE 
BEGIN
	UPDATE UsersGames
	   SET Cash -= @ItemsAmount
	 WHERE Id = @UserGameId

INSERT INTO UserGameItems (ItemId, UserGameId)
     SELECT Id, @UserGameId 
	 FROM Items 
	 WHERE MinLevel BETWEEN 19 AND 21
COMMIT
END

SELECT i.[Name] AS [Item Name] 
  FROM Items AS i
  JOIN UserGameItems AS u
  ON u.ItemId = i.Id
WHERE u.UserGameId = @UserGameId
ORDER BY [Item Name]