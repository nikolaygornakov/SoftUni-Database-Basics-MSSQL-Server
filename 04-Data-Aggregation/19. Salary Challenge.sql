USE SoftUni
GO

SELECT TOP(10) e1.FirstName, e1.LastName, e1.DepartmentID
FROM Employees AS e1
WHERE Salary > (
			SELECT AVG(Salary) 
			FROM Employees AS e2
			WHERE e2.DepartmentID = e1.DepartmentID
			GROUP BY DepartmentID)
ORDER BY DepartmentID ASC