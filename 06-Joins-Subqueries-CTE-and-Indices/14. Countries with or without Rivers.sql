USE Geography
GO

-- Solution 1 - Using Joins --
SELECT TOP(5) c.CountryName, r.RiverName FROM Countries AS c
INNER JOIN Continents AS con
ON con.ContinentCode = c.ContinentCode
LEFT OUTER JOIN CountriesRivers AS cr
ON cr.CountryCode = c.CountryCode
LEFT OUTER JOIN Rivers AS r
ON r.Id = cr.RiverId
WHERE con.ContinentName = 'Africa'
ORDER BY c.CountryName ASC

-- Solution 2 - Using Joins and Subquery --
SELECT TOP(5) c.CountryName, r.RiverName FROM Countries AS c
LEFT OUTER JOIN CountriesRivers AS cr
ON cr.CountryCode = c.CountryCode
LEFT OUTER JOIN Rivers AS r
ON r.Id = cr.RiverId
WHERE c.ContinentCode = (
	SELECT ContinentCode FROM Continents
	WHERE ContinentName = 'Africa')
ORDER BY c.CountryName ASC