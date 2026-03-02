--SQLQuery1-GetNextLearningDay.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION GetNextLearningDay (@group_name	AS	NCHAR(10)) RETURNS TINYINT
AS
BEGIN
		
		DECLARE @group_id	AS	INT		=	(SELECT group_id	FROM	Groups		WHERE group_name=@group_name);
		DECLARE @weekdays	AS	TINYINT	=	(SELECT weekdays	FROM	Groups		WHERE group_name=@group_name);
		DECLARE @last_date	AS	DATE	=	(SELECT MAX([date]) FROM	Schedule	WHERE [group]=@group_id);
		DECLARE @last_day	AS	TINYINT	=	DATEPART(WEEKDAY, @last_date);
		DECLARE @day		AS	TINYINT	=	@last_day + 1;

		WHILE	@day <= 14
		BEGIN
			IF (@weekdays & POWER(2, @day%7 - 1))	!= 0	RETURN @day%7;
			SET @day = @day + 1;
		END
		RETURN 0;
END

