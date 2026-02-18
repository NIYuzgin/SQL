--SQLQuery1-CREATE Students branch.sql

USE PV_521_DDL;

CREATE TABLE Directions
(
direction_id	TINYINT			PRIMARY KEY,
direction_name	NVARCHAR(150)	NOT NULL
);

CREATE TABLE Groups
(
group_id	INT			PRIMARY KEY,
group_name	NVARCHAR(24)	NOT NULL,
direction	TINYINT			NOT NULL	--описание поля
CONSTRAINT	FK_Groups_Direction FOREIGN KEY REFERENCES Directions(direction_id)
-- CONSTRAINT	FK_Имя_ВнешнегоКлюча FOREIGN KEY REFERENCES Таблица(первичный_ключ_внешней_таблицы)
);

CREATE TABLE Students
(
student_id		INT			PRIMARY KEY IDENTITY(1,1),
last_name		NVARCHAR(50)	NOT NULL,
first_name		NVARCHAR(50)	NOT NULL,
middle_name		NVARCHAR(50),
birth_date		DATE			NOT NULL,
[group]			INT				NOT NULL
CONSTRAINT	FK_Students_Group FOREIGN KEY REFERENCES Groups(group_id)
);

--DROP TABLE Students, Groups, Directions;
