USE Bank
GO

CREATE TABLE Logs (
	LogID INT IDENTITY,
	AccountID INT NOT NULL,
	OldSum DECIMAL(15, 2),
	NewSum DECIMAL(15, 2)
)
GO

SELECT * FROM Logs
GO

CREATE TRIGGER tr_LogSumChanges ON Accounts
AFTER UPDATE
AS
BEGIN
	INSERT INTO Logs (AccountID, OldSum, NewSum)
	SELECT deleted.Id, deleted.Balance, inserted.Balance FROM inserted
	JOIN deleted ON deleted.Id = inserted.Id
END
GO

UPDATE Accounts
SET Balance += 20
WHERE Id = 1