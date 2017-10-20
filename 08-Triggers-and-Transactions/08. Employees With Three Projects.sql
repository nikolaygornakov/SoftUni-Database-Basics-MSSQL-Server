USE SoftUni
GO

CREATE PROC usp_AssignProject(@EmployeeId INT, @ProjectID INT)
AS
BEGIN TRANSACTION
INSERT INTO EmployeesProjects (EmployeeID, ProjectID) VALUES
(@EmployeeId, @ProjectID)

DECLARE @EmployeeProjectsCount INT = (
	SELECT COUNT(*) FROM EmployeesProjects
	WHERE EmployeeID = @EmployeeId
)

IF (@EmployeeProjectsCount > 3)
BEGIN
	ROLLBACK
	RAISERROR('The employee has too many projects!', 16, 1)
	RETURN
END
COMMIT
GO

EXEC usp_AssignProject 1, 5

SELECT * FROM EmployeesProjects