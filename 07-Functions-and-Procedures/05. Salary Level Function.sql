USE SoftUni
GO

-- DROP FUNCTION dbo.ufn_GetSalaryLevel

--CREATE FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18,4))
--RETURNS VARCHAR(10)
--AS
--BEGIN
--	DECLARE @SalaryLevel VARCHAR(10) = 'Low'

--	SET @SalaryLevel =
--	CASE
--	WHEN @Salary < 30000 THEN 'Low'
--	WHEN @Salary BETWEEN 30000 AND 50000 THEN 'Average'
--	WHEN @Salary > 50000 THEN 'High'
--	END
--	RETURN @SalaryLevel
--END
--GO

CREATE FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(10) = 'Low'

	IF(@Salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @SalaryLevel = 'Average'
	END
	ELSE IF(@Salary > 50000)
	BEGIN
		SET @SalaryLevel = 'High'
	END

	RETURN @SalaryLevel
END
GO

SELECT Salary,
	   dbo.ufn_GetSalaryLevel(Salary)
  FROM Employees