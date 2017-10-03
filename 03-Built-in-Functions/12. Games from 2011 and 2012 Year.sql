USE Diablo
GO

-- Using DATEPART() --
/*
SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start] FROM Games
WHERE DATEPART(YYYY, [Start]) BETWEEN 2011 AND 2012
ORDER BY [Start] ASC, [Name] ASC
*/

--  --
SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start] FROM Games
WHERE YEAR([Start]) BETWEEN 2011 AND 2012
ORDER BY [Start] ASC, [Name] ASC