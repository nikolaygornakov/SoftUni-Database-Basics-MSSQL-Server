USE Minions
GO

-- Create Default Constraint /sql default naming/ (i.e. DF__Users__LastLogin__628FA481) --
/*
ALTER TABLE Users
ADD DEFAULT GETDATE()
FOR LastLoginTime
*/

ALTER TABLE Users
DROP CONSTRAINT DF_Users_LastLoginTime
GO

-- Create DF Constraint (better naming) --
ALTER TABLE Users
ADD CONSTRAINT DF_Users_LastLoginTime
DEFAULT GETDATE()
FOR LastLoginTime