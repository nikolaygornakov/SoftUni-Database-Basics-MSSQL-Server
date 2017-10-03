USE SoftUni
GO

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName FROM Employees
WHERE DATEPART(YYYY, HireDate) > 2000
GO

SELECT * FROM V_EmployeesHiredAfter2000