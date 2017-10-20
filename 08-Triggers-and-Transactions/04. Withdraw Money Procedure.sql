USE Bank
GO

CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
IF (@MoneyAmount > 0)
BEGIN
	UPDATE Accounts
	SET Balance -= @MoneyAmount
	WHERE Id = @AccountId

END
GO

EXEC usp_WithdrawMoney 5, 25
GO
SELECT * FROM Accounts