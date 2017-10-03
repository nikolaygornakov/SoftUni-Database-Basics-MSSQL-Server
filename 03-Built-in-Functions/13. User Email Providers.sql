USE Diablo
GO

SELECT Username, RIGHT(Email, LEN(Email) - CHARINDEX('@', Email)) AS [Email Provider] FROM Users
-- WHERE Email LIKE '%@%' --
ORDER BY [Email Provider] ASC, Username ASC