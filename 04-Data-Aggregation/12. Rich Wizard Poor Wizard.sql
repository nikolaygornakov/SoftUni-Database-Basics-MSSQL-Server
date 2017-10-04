USE Gringotts
GO

SELECT SUM(AmountDifference) AS SumDifference
FROM
(
	SELECT DepositAmount - LEAD(DepositAmount) OVER(ORDER BY Id) AS AmountDifference
	FROM WizzardDeposits
) AS SumDiff