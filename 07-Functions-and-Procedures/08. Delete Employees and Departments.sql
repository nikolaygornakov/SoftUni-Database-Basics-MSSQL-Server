USE SoftUni
GO

CREATE PROC usp_DeleteEmployeesFromDepartment (@DepartmentId INT)
AS
ALTER TABLE Departments ALTER COLUMN ManagerID INT NULL

DELETE FROM EmployeesProjects
WHERE EmployeeID IN (
	SELECT EmployeeID FROM Employees
	WHERE DepartmentID = @DepartmentId
);

UPDATE Departments
SET ManagerID = NULL
WHERE ManagerID IN (
	SELECT EmployeeID FROM Employees
	WHERE DepartmentID = @DepartmentId
);

UPDATE Employees
SET ManagerID = NULL
WHERE ManagerID IN (
	SELECT EmployeeID FROM Employees
	WHERE DepartmentID = @DepartmentId
);

DELETE FROM Employees
WHERE DepartmentID = @DepartmentId

DELETE FROM Departments
WHERE DepartmentID = @DepartmentId

SELECT COUNT(*) FROM Employees
WHERE DepartmentID = @DepartmentId
GO

EXEC dbo.usp_DeleteEmployeesFromDepartment 3