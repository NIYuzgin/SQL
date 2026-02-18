--SQLQuery2-Agregation.sql

USE PV_521_Import;

--SELECT 
--		direction_name		AS N'Направление обучения'
--		,	COUNT(group_id)	AS N'Количество групп' 
--FROM		Directions, Groups
--WHERE		direction	=	direction_id
--GROUP BY	direction_name

--;


SELECT
			direction_name		AS N'Направление обучения'
			, COUNT (stud_id)	AS N'Количество студентов'
FROM	Students, Groups, Directions
WHERE	[group]		=		group_id
AND		direction	=		direction_id
GROUP BY	direction_name
HAVING	COUNT(stud_id)	>	10
;
