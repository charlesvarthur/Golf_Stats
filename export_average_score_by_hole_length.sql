--What is my average score based on the length of the hole played
--group this by <99, 100-149, 150-199, etc up to 500+
CREATE OR REPLACE VIEW average_score_by_hole_length AS
(SELECT round(avg(s.score),2), hs.par_yellow, '< 100' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow < 100
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '100 - 149' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 100 AND 149
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '150 - 199' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 150 AND 199
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '200 - 249' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 200 AND 249
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '250 - 299' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 250 AND 299
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '300 - 349' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 300 AND 349
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '350 - 399' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 350 AND 399
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '400 - 449' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 400 AND 449
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '450 - 499' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow BETWEEN 450 AND 499
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
UNION ALL
SELECT round(avg(s.score),2), hs.par_yellow, '500 +' as yards_range
FROM scores s 
JOIN hole_stats hs
ON s.hole_id=hs.hole_id
JOIN round r
ON s.round_id=r.round_id
WHERE r.colour = 'yellow' 
AND hs.yards_yellow >=500
AND s.player_id=1
AND r.round_id IN (SELECT round_id from round order by 1 desc limit 5)
GROUP BY hs.par_yellow
 );

SELECT * FROM average_score_by_hole_length;


DO
$$DECLARE
--	datestr text := to_char(current_timestamp, 'YYYY-MM-DD-HH24_MI_SS');

BEGIN
	EXECUTE	format(
		'COPY ' 
		'(SELECT * FROM average_score_by_hole_length) '
		'TO %L CSV HEADER',
		'/Users/charlesarthur/Documents/Data_Projects/Golf_Stats/average_score_by_hole_length.csv'
		);
END;
$$;
			