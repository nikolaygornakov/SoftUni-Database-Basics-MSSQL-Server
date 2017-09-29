USE SoftUni
GO

-- INCREASE Salary using JOIN --
/*
UPDATE Employees
SET Salary *= 1.12
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')

SELECT Salary FROM Employees
*/


-- INCREASE Salary by 12% --
UPDATE Employees
SET Salary *= 1.12
WHERE DepartmentID IN (1, 2, 4, 11)
GO

SELECT Salary FROM Employees

-- REVERT CHANGES --
UPDATE Employees
SET Salary /= 1.12
WHERE DepartmentID IN (1, 2, 4, 11)