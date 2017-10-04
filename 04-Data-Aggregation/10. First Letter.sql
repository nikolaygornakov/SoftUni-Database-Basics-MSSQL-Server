USE Gringotts
GO

-- Using GROUP BY --
/*
SELECT LEFT(FirstName, 1) AS FirsLetter FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName, 1)
ORDER BY FirsLetter
*/

-- Using DISTINCT --
SELECT DISTINCT LEFT(FirstName, 1) AS FirsLetter FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
ORDER BY FirsLetter