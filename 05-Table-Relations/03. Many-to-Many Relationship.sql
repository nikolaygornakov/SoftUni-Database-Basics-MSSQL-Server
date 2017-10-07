USE TableRelations
GO

CREATE TABLE Students (
	StudentID INT IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Students PRIMARY KEY (StudentID)
)

CREATE TABLE Exams (
	ExamID INT IDENTITY(101, 1),
	[Name] NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Exams PRIMARY KEY (ExamID)
)
GO

CREATE TABLE StudentsExams (
	StudentID INT NOT NULL,
	ExamID INT NOT NULL,
	CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID),
	CONSTRAINT FK_StudentExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)
GO

INSERT INTO Students ([Name]) VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO Exams ([Name]) VALUES
('SpringMVC'),
('Neo4j'),
('Oracle11g')
GO

INSERT INTO StudentsExams (StudentID, ExamID) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)