USE master
GO

BACKUP DATABASE SoftUni
	TO DISK = 'C:\SQL Database Backups\softuni-backup.bak'

RESTORE DATABASE SoftUni
	FROM DISK = 'C:\SQL Database Backups\softuni-backup.bak'