-- --query to export relevant stats for dashboard
--DROP VIEW IF EXISTS round_7_stats;
--CREATE VIEW round_7_stats as (

SELECT 
p.player_id,
c.course_name,
r.round_id,
r.round_date,
hs.hole_number,
hs.par_yellow,
hs.yards_yellow,
hs.stroke_index,
s.score,
s.score - hs.par_yellow as score_vs_par_white
from course c
INNER JOIN round r
ON r.course_id=c.course_id
INNER JOIN hole_stats hs
ON r.course_id=hs.course_id
INNER JOIN scores s
ON hs.hole_id=s.hole_id
INNER JOIN player p 
ON p.player_id=s.player_id
WHERE s.player_id=1 and r.round_id=7
order by 5
--);

-- SELECT *, post - pre AS net
-- FROM (
--    SELECT interaction_id, customer_id 
--          ,(SELECT sum(x::numeric) FROM string_to_table(pre, ';') x) AS pre
--          ,(SELECT sum(x::numeric) FROM string_to_table(post, ';') x) AS post
--    FROM   tbl
--    ) sub;