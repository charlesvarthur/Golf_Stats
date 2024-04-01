-- --query to export relevant stats for dashboard
DROP VIEW IF EXISTS full_stats_hundred;
CREATE VIEW full_stats_hundred as (

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
WHERE s.player_id=1 and r.round_date >= (current_date - 365)
order by 4,5
);

DO
$$DECLARE
--	datestr text := to_char(current_timestamp, 'YYYY-MM-DD-HH24_MI_SS');

BEGIN
	EXECUTE	format(
		'COPY ' 
		'(select * from full_stats_hundred) '
		'TO %L CSV HEADER',
		'/Users/charlesarthur/Documents/Data_Projects/Golf_Stats/full_stats_hundred_days.csv'
		);
END;
$$;
			
