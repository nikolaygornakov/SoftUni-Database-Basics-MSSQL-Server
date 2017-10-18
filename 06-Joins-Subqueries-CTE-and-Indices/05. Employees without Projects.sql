USE SoftUni
GO

-- Solution 1 --
SELECT TOP(3) e.EmployeeID, e.FirstName FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL
ORDER BY e.EmployeeID ASC

-- Solution 2 --
/*
SELECT TOP(3) EmployeeID, FirstName FROM Employees
WHERE EmployeeID NOT IN (
	SELECT DISTINCT EmployeeID FROM EmployeesProjects
)
ORDER BY EmployeeID
*/