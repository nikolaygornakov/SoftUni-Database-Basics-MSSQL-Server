USE SoftUni
GO

SELECT DepartmentID, Salary AS ThirdHighestSalary
FROM (
	SELECT 
		DepartmentID,
		MAX(Salary) AS Salary,
		DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
	FROM Employees
	GROUP BY DepartmentID, Salary
) AS RankedSalary
WHERE [Rank] = 3