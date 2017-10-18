USE Geography
GO

SELECT TOP(5) CountryName,
	   Elevation AS [HighestPeakElevation],
	   [Length] AS [LongestRiverLength]
FROM (
	SELECT CountryName,
		   Elevation,
		   [Length],
		   DENSE_RANK() OVER(PARTITION BY CountryName ORDER BY Elevation DESC, [Length] DESC) AS [Rank]
	FROM (
		SELECT c.CountryName, p.Elevation, r.[Length] FROM Countries AS c
		LEFT OUTER JOIN CountriesRivers AS cr
		ON cr.CountryCode = c.CountryCode
		LEFT OUTER JOIN Rivers AS r
		ON r.Id = cr.RiverId
		LEFT OUTER JOIN MountainsCountries AS mc
		ON mc.CountryCode = c.CountryCode
		LEFT OUTER JOIN Mountains AS m
		ON m.Id = mc.MountainId
		LEFT OUTER JOIN Peaks AS p
		ON p.MountainId = m.Id
	) AS PeaksAndRivers
) AS [RankedPeaksAndRivers]
WHERE [Rank] = 1
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName ASC