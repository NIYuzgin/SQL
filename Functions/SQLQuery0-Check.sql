--SQLQuery0-Check.sql

USE PV_521_Import;
SET DATEFIRST 1;

EXEC sp_SelectScheduleFor N'PV_521'
PRINT dbo.GetNextLearningDay(N'PV_521');