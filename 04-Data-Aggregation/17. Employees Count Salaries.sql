USE SoftUni
GO

SELECT COUNT(Salary) AS [Count] FROM Employees
WHERE ManagerID IS NULL