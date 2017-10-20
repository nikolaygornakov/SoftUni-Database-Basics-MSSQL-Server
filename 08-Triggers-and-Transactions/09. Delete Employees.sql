USE SoftUni
GO

CREATE TABLE Deleted_Employees(
	EmployeeId INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50),
	DepartmentId INT,
	Salary DECIMAL(18, 4),
	CONSTRAINT PK_DeletedEmployees PRIMARY KEY (EmployeeId)
)
GO

CREATE TRIGGER tr_DeletedEmployees ON Employees
AFTER DELETE
AS
BEGIN
	INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
	SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary FROM deleted
END
GO