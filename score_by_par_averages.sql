TRUNCATE par_averages CASCADE;
DROP TABLE par_averages CASCADE;
CREATE TEMP TABLE par_averages(
	round_id int,
	average_score numeric,
	par int
);

INSERT INTO par_averages(
SELECT s.round_id, avg(s.score), hs.par_yellow as par_combined
FROM scores s 
RIGHT JOIN hole_stats hs  
ON s.hole_id=hs.hole_id
GROUP BY hs.par_yellow,s.round_id
UNION ALL 
SELECT s.round_id, avg(s.score),hs.par_white as par_combined
FROM scores s 
RIGHT JOIN hole_stats hs 
ON s.hole_id=hs.hole_id
GROUP BY hs.par_white,s.round_id)
;

CREATE OR REPLACE VIEW average_score_vs_par as (
SELECT round_id, ROUND(avg(average_score),2) as score_average, par, (ROUND(avg(average_score),2) - par) difference
from par_averages
group by par, round_id
order by 1,3)
;

SELECT * FROM average_score_vs_par;

DO
$$DECLARE
--	datestr text := to_char(current_timestamp, 'YYYY-MM-DD-HH24_MI_SS');

BEGIN
	EXECUTE	format(		
		'COPY ' 
		'(SELECT * FROM average_score_vs_par) '
		'TO %L CSV HEADER',
		'/Users/charlesarthur/Documents/Data_Projects/Golf_Stats/average_strokes_vs_par.csv'
		);
END;
$$;