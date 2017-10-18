USE Geography
GO

SELECT COUNT(CountryCode) FROM Countries
WHERE CountryCode NOT IN (SELECT DISTINCT CountryCode FROM MountainsCountries)