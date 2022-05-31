--EXECUTE STORED PROCEDURES AND FUNCTIONS
EXEC music_exams_participation;
EXEC music_exams_engagement;

--FUNCTION TO SEE HOW ALL OF THE PARTICIPATION LEVELS AND GRADES INTERACT
/*
GO
CREATE VIEW view_all_participation
AS
SELECT * 
FROM null_music_participation
UNION
SELECT *
FROM participation_instrumental
UNION
SELECT *
FROM participation_music
UNION
SELECT *
FROM participation_vocal
GO */

--SELECT THE VIEW
SELECT * FROM view_all_participation


--*********************************************DELETE SCRIPT*********************************************
/*
DROP TABLE dbo.engagement_levels;
DROP TABLE dbo.instrumental_engagement;
DROP TABLE dbo.music_averages;
DROP TABLE dbo.null_music_participation;
DROP TABLE dbo.participation_instrumental;
DROP TABLE dbo.participation_music;
DROP TABLE dbo.participation_vocal;
DROP TABLE dbo.vocal_engagement;
DROP FUNCTION [IF EXISTS]
	dbo.engagementAverages,
	dbo.participationAverages
DROP PROCEDURE dbo.music_exams_engagement, dbo.music_exams_participation
GO
DROP VIEW view_all_participation
*/