USE Bank
GO

CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(18, 4))
AS
IF (@Amount > 0)
BEGIN TRANSACTION
	EXEC usp_WithDrawMoney @SenderId, @Amount
	EXEC usp_DepositMoney @ReceiverId, @Amount

	DECLARE @SenderBalance DECIMAL(18, 4) = (
		SELECT Balance FROM Accounts
		WHERE Id = @SenderId
		)

	IF (@SenderBalance < 0)
	BEGIN
		ROLLBACK
		RETURN
	END
COMMIT
GO

SELECT * FROM Accounts
EXEC usp_TransferMoney 11, 10, 500