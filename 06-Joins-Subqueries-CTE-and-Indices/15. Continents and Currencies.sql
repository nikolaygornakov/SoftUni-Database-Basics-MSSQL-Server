USE Geography
GO

SELECT ContinentCode, CurrencyCode, CurrencyUsage
FROM (
	SELECT *,
			DENSE_RANK() OVER(PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC) AS [Rank]
	FROM (
		SELECT ContinentCode,
			   CurrencyCode,
			   COUNT(CurrencyCode) AS [CurrencyUsage]
		  FROM Countries
	  GROUP BY CurrencyCode, ContinentCode
	) AS Currencies
) AS [RankedCurrencies]
WHERE [Rank] = 1 AND CurrencyUsage > 1
ORDER BY ContinentCode ASC