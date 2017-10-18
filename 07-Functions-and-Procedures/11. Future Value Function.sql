USE Bank2
GO

CREATE FUNCTION ufn_CalculateFutureValue (@Sum DECIMAL(18, 4), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(18, 4)
AS
BEGIN
	DECLARE @FutureValue DECIMAL(18, 4) = @Sum * (POWER(1 + @YearlyInterestRate, @NumberOfYears))
	RETURN @FutureValue
END
GO

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)