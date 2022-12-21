DROP VIEW IF EXISTS total_score_by_course;
CREATE or REPLACE VIEW total_score_by_course AS

SELECT 
c.course_name as course_name,
coalesce(hs.par_yellow,hs.par_white) as par,
s.score as scores,
hs.hole_id,
s.score - coalesce(hs.par_yellow,hs.par_white) as score_vs_par
FROM scores s
JOIN course c
ON s.course_id=c.course_id
JOIN hole_stats hs
ON hs.hole_id=s.hole_id
JOIN player p
ON s.player_id = p.player_id
where p.player_id=1
order by 1,4;

SELECT * FROM total_score_by_course;

SELECT 
course_name,
round(AVG(score_vs_par),2) as average_score
FROM total_score_by_course
GROUP BY course_name;