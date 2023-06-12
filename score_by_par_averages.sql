TRUNCATE par_averages CASCADE;
DROP TABLE par_averages CASCADE;
CREATE TEMP TABLE par_averages(
	average_score numeric,
	par int
);

INSERT INTO par_averages(
SELECT avg(s.score),hs.par_yellow as par_combined
FROM scores s 
RIGHT JOIN hole_stats hs  
ON s.hole_id=hs.hole_id
GROUP BY hs.par_yellow
UNION ALL 
SELECT avg(s.score),hs.par_white as par_combined
FROM scores s 
RIGHT JOIN hole_stats hs 
ON s.hole_id=hs.hole_id
GROUP BY hs.par_white);

CREATE OR REPLACE VIEW average_score_vs_par as (
SELECT ROUND(avg(average_score),2) as score_average, par, (ROUND(avg(average_score),2) - par) difference
from par_averages
group by par
order by 2)
;

SELECT * FROM average_score_vs_par;