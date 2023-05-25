-- Returns the lowest scores from my rounds, doubling the score of a 9. 
CREATE OR REPLACE VIEW handicap_rounds as(
SELECT s.round_id, sum(s.score) score,
CASE 
 	WHEN sum(s.score) < 90 THEN sum(s.score) * 2
	WHEN sum(s.score) > 90 THEN sum(s.score)
END round_score
FROM scores s
JOIN round r 
ON s.round_id = r.round_id
WHERE s.player_id=1 AND r.course_id != 6 AND r.round_type != 'Scramble'
GROUP BY s.round_id
HAVING s.round_id BETWEEN (SELECT (max(round_id) - 20) from round) AND max(s.round_id)
ORDER BY 3 ASC
LIMIT 8
);
--select * from handicap_rounds;

--Calculate the par of each course, based on the yellow tees or white, when there are no yellows
CREATE OR REPLACE VIEW course_par as (
SELECT c.course_id,c.course_name, 
CASE 
	WHEN sum(hs.par_yellow) IS NOT NULL THEN sum(hs.par_yellow)
	WHEN sum(hs.par_yellow) IS NULL THEN sum(hs.par_white)
END par
FROM COURSE c
JOIN hole_stats hs
ON c.course_id=hs.course_id
GROUP BY c.course_id, c.course_name
ORDER BY 1
);
SELECT * from course_par;


-- Returns the course name alongside the handicap_rounds view 
--Handicap differential = (Adjusted Gross Score-rating of the course) X 113 / Course slope ratings.
CREATE OR REPLACE VIEW handicap_courses_and_scores AS
(
SELECT hr.*,c.course_name, cp.par, c.slope_rating_yellow ,c.course_rating, round(((hr.round_score - c.course_rating) * 113 / slope_rating_yellow),1) differential
FROM handicap_rounds hr
JOIN round r 
ON hr.round_id=r.round_id
JOIN course c
ON r.course_id=c.course_id
JOIN course_par cp 
ON c.course_id=cp.course_id
Order by 2
);

--select * from handicap_courses_and_scores;




