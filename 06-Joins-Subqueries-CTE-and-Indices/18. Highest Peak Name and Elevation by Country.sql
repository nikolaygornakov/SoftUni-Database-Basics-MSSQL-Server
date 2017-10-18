USE Geography
GO

SELECT TOP(5) CountryName AS [Country],
	CASE PeakName
	WHEN NULL THEN '(no highest peak)'
	ELSE PeakName
	END AS [Highest Peak Name], 
	CASE Elevation
	WHEN NULL THEN 0
	ELSE Elevation
	END AS [Highest Peak Elevation],
	CASE MountainRange
	WHEN NULL THEN '(no mountain)'
	ELSE MountainRange
	END AS [Mountain]
FROM (
	SELECT CountryName,
		   PeakName,
		   Elevation,
		   MountainRange,
		   DENSE_RANK() OVER(PARTITION BY CountryName ORDER BY Elevation DESC) AS [Rank]
	FROM (
		SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange FROM Countries AS c
		LEFT OUTER JOIN MountainsCountries AS mc
		ON mc.CountryCode = c.CountryCode
		LEFT OUTER JOIN Mountains AS m
		ON m.Id = mc.MountainId
		LEFT OUTER JOIN Peaks AS p
		ON p.MountainId = m.Id
	) AS [AllPeaks]
) AS [RankedPeaks]
WHERE [Rank] = 1
ORDER BY Country ASC, [Highest Peak Name] ASC