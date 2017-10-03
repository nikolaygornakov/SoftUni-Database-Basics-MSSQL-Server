USE SoftUni
GO

SELECT * FROM Towns
WHERE [Name] LIKE '[^RBD]%'
ORDER BY [Name] ASC