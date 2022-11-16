-- --query to export relevant stats for dashboard
DROP VIEW IF EXISTS full_stats;
CREATE VIEW full_stats as (

SELECT 
p.player_id,
c.course_name,
r.round_id,
r.round_date,
hs.hole_number,
coalesce(hs.par_yellow,hs.par_white) as par,
coalesce(hs.yards_yellow,hs.yards_white) as yards,
hs.stroke_index,
s.score,
s.score - coalesce(hs.par_yellow,hs.par_white) as score_vs_par  
from course c
JOIN hole_stats hs
ON c.course_id=hs.course_id
JOIN scores s
ON hs.hole_id=s.hole_id
JOIN round r
ON r.round_id=s.round_id
JOIN player p 
ON p.player_id=s.player_id
WHERE s.player_id=1 
order by 4,5
);