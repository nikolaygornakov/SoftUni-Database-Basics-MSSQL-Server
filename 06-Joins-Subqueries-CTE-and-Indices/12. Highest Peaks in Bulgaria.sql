USE Geography
GO

SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation FROM Peaks AS p
INNER JOIN Mountains AS m
ON m.Id = p.MountainId
INNER JOIN MountainsCountries AS mc
ON mc.MountainId = m.Id
INNER JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
WHERE c.CountryName = 'Bulgaria' AND p.Elevation > 2835
ORDER BY p.Elevation DESC