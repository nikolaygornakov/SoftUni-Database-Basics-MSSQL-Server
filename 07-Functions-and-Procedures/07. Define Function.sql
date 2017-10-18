USE SoftUni
GO

CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters VARCHAR(MAX), @Word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @Statement BIT = 'true'
	DECLARE @StartIndex INT = 1
	DECLARE @CurrentLetter VARCHAR

	WHILE (@StartIndex <= LEN(@Word))
	BEGIN
		SET @CurrentLetter = SUBSTRING(@Word, @StartIndex, 1)
		IF (CHARINDEX(@CurrentLetter, @SetOfLetters) = 0)
		BEGIN
			SET @Statement = 'false'
			BREAK
		END
		SET @StartIndex += 1
	END
	RETURN @Statement
END
GO

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'Sofia') AS [result]
SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves') AS [result]
SELECT dbo.ufn_IsWordComprised('bobr', 'Rob') AS [result]
SELECT dbo.ufn_IsWordComprised('pppp', 'Guy') AS [result]