--SQLQuery3-CREATE Shedule and Grades.sql

USE PV_521_DDL;

CREATE TABLE Shedule
(
	lesson_id		BIGINT			PRIMARY KEY,
	[date]			DATE			NOT NULL,
	[time]			TIME(0)			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT		FK_Shedule_Groups		FOREIGN KEY REFERENCES Groups(group_id),
	discipline		SMALLINT		NOT NULL
	CONSTRAINT		FK_Shedule_Disciplines	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher			INT				NOT NULL
	CONSTRAINT		FK_Shedule_Teacher		FOREIGN KEY REFERENCES Teachers(teacher_id),
	[subject]		NVARCHAR(256),
	spent			BIT				NOT NULL

);

CREATE TABLE Grades
(
	student		INT			CONSTRAINT	FK_GRADES_Students	FOREIGN KEY REFERENCES Students(student_id),
	lesson		BIGINT		CONSTRAINT	FK_GRADES_Shedule	FOREIGN KEY REFERENCES Shedule(lesson_id),
	PRIMARY KEY (student, lesson),
	grade_1		TINYINT		CONSTRAINT	CK_Grade_1	CHECK (grade_1>0 AND grade_1<=12),
	grade_2		TINYINT		CONSTRAINT	CK_Grade_2	CHECK (grade_2>0 AND grade_2<=12)
);

CREATE TABLE Exams
(
	student			INT			CONSTRAINT	FK_Exams_Students		FOREIGN KEY REFERENCES Students(student_id),
	discipline		SMALLINT	CONSTRAINT	FK_Exams_Disciplines	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	grade			TINYINT		CONSTRAINT	CK_Grade				CHECK (grade>0 AND grade<=12)
	
);

CREATE TABLE Homeworks
(
	[group]		INT						CONSTRAINT	FK_HW_Groups	FOREIGN KEY REFERENCES Groups(group_id),
	lesson		BIGINT					CONSTRAINT	FK_HW_Shedule	FOREIGN KEY REFERENCES Shedule(lesson_id),
	[data]		VARBINARY(MAX),
	comment		NVARCHAR(1024),
	CONSTRAINT	CK_DATA_OR_COMMENT		CHECK ([data] IS NOT NULL OR comment IS NOT NULL),
	PRIMARY KEY ([group], lesson)
	
);

CREATE TABLE ResultsHW
(
	student		INT			CONSTRAINT	FK_Results_Students	FOREIGN KEY REFERENCES Students(student_id),
	[group]		INT,		--CONSTRAINT	FK_Results_Groups	FOREIGN KEY REFERENCES Groups(group_id),
	lesson		BIGINT,		--CONSTRAINT	FK_Results_Shedule	FOREIGN KEY REFERENCES Shedule(lesson_id)
	result		VARBINARY(MAX),
	comment		NVARCHAR(1024),
	grade		TINYINT CONSTRAINT CK_HW_Grade	CHECK (grade>0 AND grade<=12),
	CONSTRAINT	FK_Results_HW			FOREIGN KEY ([group], lesson)		REFERENCES Homeworks ([group], lesson),
	CONSTRAINT	CK_RESULT_OR_COMMENT	CHECK ([result] IS NOT NULL OR comment IS NOT NULL),
	PRIMARY KEY (student, [group], lesson)

);

