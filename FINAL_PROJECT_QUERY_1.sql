--CREATE PRIMARY KEYS FOR NECESSARY TABLES
ALTER TABLE dbo.null_music_participation
	ADD ID INT IDENTITY
		CONSTRAINT null_participation_ID PRIMARY KEY CLUSTERED
ALTER TABLE dbo.participation_music
	ADD ID INT IDENTITY
		CONSTRAINT music_participation_ID PRIMARY KEY CLUSTERED
ALTER TABLE dbo.participation_vocal
	ADD ID INT IDENTITY
		CONSTRAINT vocal_participation_ID PRIMARY KEY CLUSTERED
ALTER TABLE dbo.participation_instrumental
	ADD ID INT IDENTITY
		CONSTRAINT instrumental_participation_ID PRIMARY KEY CLUSTERED


--CREATE ENGAGEMENT LEVELS TABLE, AND DROP OLD ENGAGEMENT TABLES (VOCAL_ENGAGEMENT AND INSTRUMENTAL_ENGAGEMENT)
SELECT * 
INTO engagement_levels
FROM dbo.vocal_engagement
UNION
SELECT *
FROM dbo.vocal_engagement

--DROP OLD ENGAGEMENT TABLES
DROP TABLE dbo.vocal_engagement
DROP TABLE dbo.instrumental_engagement


--CREATE THE TABLE THAT THE STORED PROCEDURE WILL INSERT THE RETURNED FUNCTION VALUES INTO
--THE FUNCTION AND STORED PROCEDURE CAN BE USED AS THE DATABASE GETS UPDATED WITH MORE DATA FROM FUTURE STUDIES
CREATE TABLE music_averages (
		exam_averages int,
		engagement_exam_averages int,
		participation_levels varchar(50),
)

--CREATE THE STORED PROCEDURE THAT WILL INSERT THE FUNCTION CALCULATIONS INTO THE NEW music_averages TABLE CREATED ABOVE
GO
CREATE PROCEDURE music_exams_participation
AS
	INSERT INTO music_averages (exam_averages)
		SELECT dbo.participationAverages('no')
		FROM null_music_participation
	INSERT INTO music_averages (exam_averages)
		SELECT dbo.participationAverages('yes')
		FROM participation_music
	INSERT INTO music_averages (exam_averages)
		SELECT dbo.participationAverages('vocal')
		FROM participation_vocal
	INSERT INTO music_averages (exam_averages)
		SELECT dbo.participationAverages('instrumental')
		FROM participation_instrumental
GO;

GO
CREATE PROCEDURE music_exams_engagement
AS

	INSERT INTO music_averages (engagement_exam_averages)
		SELECT dbo.engagementAverages(1)
		FROM engagement_levels
	INSERT INTO music_averages (engagement_exam_averages)
		SELECT dbo.engagementAverages(2)
		FROM engagement_levels
	INSERT INTO music_averages (engagement_exam_averages)
		SELECT dbo.engagementAverages(3)
		FROM engagement_levels
	INSERT INTO music_averages (engagement_exam_averages)
		SELECT dbo.engagementAverages(4)
		FROM engagement_levels
GO;