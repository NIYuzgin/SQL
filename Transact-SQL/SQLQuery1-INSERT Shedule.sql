--SQLQuery1-INSERT Shedule.sql

USE PV_521_Import;
SET DATEFIRST 1;		--Для правильной интерпретации дней недели (Пн-1, Вт-2, ..., Вс-7)

--Объявляем переменные:
DECLARE @group		AS INT		=	(SELECT group_id		FROM Groups			WHERE group_name=N'PV_521');
DECLARE @discipline AS SMALLINT =	(SELECT discipline_id	FROM Disciplines	WHERE discipline_name LIKE N'%MS SQL%');
DECLARE @number_of_lessons AS TINYINT =	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id=@discipline);
DECLARE @teacher	AS INT		=	(SELECT teacher_id		FROM Teachers		WHERE first_name = N'Олег');
DECLARE @start_date	AS DATE		=	N'2025-12-24';
DECLARE @start_time	AS TIME		=	(SELECT start_time		FROM Groups			WHERE group_id = @group);


PRINT(@group);
PRINT(@discipline);
PRINT(@number_of_lessons);
PRINT(@teacher);
PRINT(@start_date);
PRINT(@start_time);


-- В цикле перебираем занятия по номеру, определяем дату и время каждого занятия
DECLARE @date	AS DATE = @start_date;
DECLARE @lesson_number	AS TINYINT = 1;
DECLARE @time	AS	TIME	=	@start_time;
WHILE @lesson_number < @number_of_lessons
BEGIN
		SET @time	=	@start_time;
		--PRINT(FORMATMESSAGE(N'%i  %s  %s  %s', @lesson_number,CAST(@date AS VARCHAR(24)),DATENAME(WEEKDAY,@date), CAST(@time  AS VARCHAR(24))));
		--IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group] = @group)
		--	INSERT Schedule	VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
		--SET @lesson_number = @lesson_number +1;
		--SET @time = DATEADD(MINUTE, 95, @start_time);

		EXEC		sp_InsertLesson @group, @discipline, @teacher, @date, @time		OUTPUT, @lesson_number	OUTPUT

		--PRINT(FORMATMESSAGE(N'%i  %s  %s  %s', @lesson_number,CAST(@date AS VARCHAR(24)),DATENAME(WEEKDAY,@date), CAST(@time  AS VARCHAR(24))));
		--IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group] = @group)
		--	INSERT Schedule	VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
		--SET @lesson_number = @lesson_number +1;

		EXEC		sp_InsertLesson @group, @discipline, @teacher, @date, @time		OUTPUT, @lesson_number	OUTPUT

		
		DECLARE @day	AS	TINYINT = DATEPART(WEEKDAY,@date);
		--PRINT(@day);
		SET @date	=	DATEADD(DAY,IIF(@day = 5, 3, 2), @date);
END

--PRINT(@time);

