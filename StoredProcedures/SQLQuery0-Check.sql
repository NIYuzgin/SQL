--SQLQuery0-Check.sql

USE PV_521_Import;
SET DATEFIRST 1;

--DELETE FROM Schedule WHERE [group]=521;
--DELETE FROM Schedule WHERE discipline =(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE );

--EXEC sp_InsertScheduleStacionar N'PV_521', N'%MS SQL Server%', N'Олег', N'2025-12-24';
EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2026-01-21';
EXEC sp_SelectScheduleFor	N'PV_521';

