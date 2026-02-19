--SQLQuery4-AggregateStudentsAndGroups.sql

USE PV_521_Import;

SELECT 
		direction_name	AS N'Напрвление обучения'
		,COUNT(DISTINCT group_id)	AS N'Количество групп'
		,COUNT(stud_id)	AS N'Количество студентов'
		--,(SELECT COUNT(DISTINCT group_id) FROM Groups WHERE	direction = direction_id)	AS N'Количество групп'
FROM		Students, Groups, Directions
WHERE		[group]	=	group_id
AND			direction = direction_id
GROUP BY	direction_name
;


SELECT 
		direction_name	AS N'Напрвление обучения'
		,(SELECT COUNT(DISTINCT group_id) FROM Groups WHERE	direction = direction_id)	AS N'Количество групп'
		,(
		SELECT COUNT(stud_id) 
		FROM Students, Groups	--, Directions 
		WHERE	[group]	=	group_id	
		AND direction = direction_id
		) AS N'Количество студентов'
FROM	Directions
;

--DISTINCT выбирает только уникальные записи




