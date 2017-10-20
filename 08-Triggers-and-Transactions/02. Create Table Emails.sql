USE Bank
GO

CREATE TABLE NotificationEmails (
	Id INT IDENTITY,
	Recipient VARCHAR(50),
	[Subject] VARCHAR(200),
	Body VARCHAR(500)
)
GO

SELECT * FROM NotificationEmails
GO

CREATE TRIGGER tr_CreateEmail ON Logs
AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails (Recipient, [Subject], Body)
	SELECT l.AccountID,
		   CONCAT('Balance change for account: ', l.AccountID),
		   CONCAT('On ', GETDATE(), ' your balance was changed from ', l.OldSum, ' to ', l.NewSum, '.')
	FROM Logs AS l
	JOIN inserted ON inserted.LogID = l.LogID
	WHERE l.LogID = inserted.LogID
END

UPDATE Accounts
SET Balance = 10101
WHERE Id = 1
GO

SELECT * FROM NotificationEmails
