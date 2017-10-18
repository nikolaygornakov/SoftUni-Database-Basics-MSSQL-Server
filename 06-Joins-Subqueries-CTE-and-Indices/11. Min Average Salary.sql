USE SoftUni
GO

-- Solution 1 - Using CTE --
WITH CTE_AverageSalary (Salary)
AS (
SELECT AVG(Salary) FROM Employees AS e
GROUP BY DepartmentID)

SELECT MIN(Salary) FROM CTE_AverageSalary

-- Solution 2 --
SELECT MIN(AvgSalary)
FROM (
SELECT AVG(Salary) AS AvgSalary FROM Employees AS e
GROUP BY DepartmentID) AS AverageSalary