--SQLQuery1-COUNT lessons.sql

USE PV_521_Import;
--SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION CountLessons (@group AS INT, @discipline AS SMALLINT) RETURNS TINYINT
AS
BEGIN
		RETURN (SELECT COUNT(lesson_id) FROM Schedule WHERE [group]=@group AND discipline=@discipline);

END