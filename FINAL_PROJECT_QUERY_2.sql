--CREATE participationAverages FUNCTION TO CALCULATE GRADE AVERAGES BASED ON PARTICIPATION
GO
CREATE FUNCTION participationAverages (@participation varchar(50))
RETURNS int
AS
BEGIN
DECLARE @participation_amount varchar(50)

RETURN
	CASE 
		WHEN @participation = 'no' THEN (SELECT AVG(student_exam_grades) FROM dbo.null_music_participation)
		WHEN @participation = 'yes' THEN (SELECT AVG(student_exam_grades) FROM dbo.participation_music)
		WHEN @participation = 'vocal' THEN (SELECT AVG(student_exam_grades) FROM dbo.participation_vocal)
		WHEN @participation = 'instrumental' THEN (SELECT AVG(student_exam_grades) FROM dbo.participation_instrumental)
		ELSE 0
	END
END;
GO

--CREATE engagementAverages FUNCTION FOR FINDING EXAM AVERAGE PER ENGAGEMENT 
GO
CREATE FUNCTION engagementAverages (@engagement int)
RETURNS int
AS
BEGIN
DECLARE @engagement_amount int

RETURN
	CASE 
		WHEN @engagement = 1 THEN (SELECT AVG(engagement_exam_number) FROM dbo.engagement_levels WHERE engagement_levels = 1)
		WHEN @engagement = 2 THEN (SELECT AVG(engagement_exam_number) FROM dbo.engagement_levels WHERE engagement_levels = 2)
		WHEN @engagement = 3 THEN (SELECT AVG(engagement_exam_number) FROM dbo.engagement_levels WHERE engagement_levels = 3)
		WHEN @engagement = 4 THEN (SELECT AVG(engagement_exam_number) FROM dbo.engagement_levels WHERE engagement_levels = 4)
		ELSE 0
	END
END;
GO

--FUNCTION CALLS (FOR REFERENCE)
/*
SELECT dbo.participationAverages('no') AS exam_averages;
SELECT dbo.participationAverages('yes') AS exam_averages;
SELECT dbo.participationAverages('vocal') AS exam_averages;
SELECT dbo.participationAverages('instrumental') AS exam_averages;
SELECT dbo.engagementAverages(1) AS engagement__exam_averages;
SELECT dbo.engagementAverages(2) AS engagement__exam_averages;
SELECT dbo.engagementAverages(3) AS engagement__exam_averages;
SELECT dbo.engagementAverages(4) AS engagement__exam_averages;
*/