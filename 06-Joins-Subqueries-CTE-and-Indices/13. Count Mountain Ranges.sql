USE Geography
GO

WITH CTE_CountryMountains (CountryCode, MountainRange)
AS
(
SELECT c.CountryCode, m.MountainRange FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
INNER JOIN Mountains AS m
ON m.Id = mc.MountainId
WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
)

SELECT CountryCode, COUNT(MountainRange) AS [MountainRanges] FROM CTE_CountryMountains
GROUP BY CountryCode