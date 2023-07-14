--Create a view that compares my overall form to my most recent form of the previous 10 rounds. 
--round par and round score versus round score

CREATE OR REPLACE VIEW form_comparison AS
(SELECT hs.course_id, c.course_name, r.round_date, sq2.par, sqs.score 
FROM hole_stats hs
JOIN scores s
ON s.course_id=hs.course_id
JOIN course c
ON hs.course_id=c.course_id
JOIN round r
ON s.round_id=r.round_id
INNER JOIN 
	(SELECT DISTINCT round_id, SUM(score) score
	 FROM scores 
	 WHERE player_id=1
	 GROUP BY round_id) sqs
ON s.round_id=sqs.round_id
INNER JOIN 
	(SELECT DISTINCT course_id, SUM(COALESCE(par_yellow,par_white)) par
	FROM hole_stats
	GROUP BY course_id) sq2
ON  hs.course_id=sq2.course_id
GROUP BY hs.course_id, r.round_date, c.course_name, sqs.score, sq2.par
ORDER BY 1,3
);

SELECT * FROM form_comparison;

DO
$$DECLARE
--	datestr text := to_char(current_timestamp, 'YYYY-MM-DD-HH24_MI_SS');

BEGIN
	EXECUTE	format(
		'COPY ' 
		'(SELECT * FROM form_comparison) '
		'TO %L CSV HEADER',
		'/Users/charlesarthur/Documents/Data_Projects/Golf_Stats/form_comparison.csv'
		);
END;
$$;
			
