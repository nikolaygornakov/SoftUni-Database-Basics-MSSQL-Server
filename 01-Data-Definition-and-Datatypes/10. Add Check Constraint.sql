USE Minions
GO

ALTER TABLE Users
DROP CONSTRAINT CK_Users_Password
GO

ALTER TABLE Users
ADD CONSTRAINT CK_Users_Password CHECK (DATALENGTH(Password) >= 5)