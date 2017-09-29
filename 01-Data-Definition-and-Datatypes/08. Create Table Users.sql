USE Minions
GO

DROP TABLE Users
GO

CREATE TABLE Users (
	Id BIGINT IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT,
	CONSTRAINT PK_Users PRIMARY KEY (Id),
	CONSTRAINT UQ_Users UNIQUE (Username),
	CONSTRAINT CK_Users_ProfilePicture CHECK (ProfilePicture <= 900 * 1024)
)

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted) VALUES
('ivan', '12345', NULL, NULL, 0),
('pesho', '12345', NULL, NULL, 0),
('gosho', '12345', NULL, NULL, 1),
('koi', '12345', NULL, NULL, 0),
('toi', '12345', NULL, NULL, 0)