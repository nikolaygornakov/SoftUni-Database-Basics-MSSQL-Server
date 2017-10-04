USE SoftUni
GO

SELECT * INTO EmployeesAvgSalaries FROM Employees
WHERE Salary > 30000
GO

DELETE FROM EmployeesAvgSalaries
WHERE ManagerID = 42
GO

UPDATE EmployeesAvgSalaries
SET Salary += 5000
WHERE DepartmentID = 1
GO

SELECT DepartmentID, AVG(Salary) AS AverageSalary FROM EmployeesAvgSalaries
GROUP BY DepartmentID