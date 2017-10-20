USE Bank
GO

CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
IF (@MoneyAmount > 0)
BEGIN
	UPDATE Accounts
	SET Balance += @MoneyAmount
	WHERE Id = @AccountId
END
GO

EXEC usp_DepositMoney 1, 10
SELECT * FROM Accounts