USE Geography
GO

SELECT p.PeakName, r.RiverName, LOWER(LEFT(PeakName, LEN(PeakName) - 1) + RiverName) AS Mix 
FROM Peaks AS p, Rivers AS r
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix ASC

-- Mix using CONCAT() --
/*
SELECT p.PeakName, r.RiverName, LOWER(CONCAT(LEFT(PeakName, LEN(PeakName) - 1), RiverName)) AS Mix 
FROM Peaks AS p, Rivers AS r
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix ASC
*/