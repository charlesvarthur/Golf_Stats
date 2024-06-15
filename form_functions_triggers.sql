

INSERT INTO recent_form
SELECT 
	s.player_id,
	h.handicap,
	hs.stroke_index,
	hs.hole_number,
	coalesce(par_yellow, par_white) par,
	s.round_id,
	s.score,
	CASE 
		WHEN hs.stroke_index <=8 then 2
		WHEN hs.stroke_index >8 then 1
	END handicap_weighting
from scores s 
join handicap h 
ON s.player_id=h.player_id
join hole_stats hs
on s.hole_id=hs.hole_id
join round r
ON s.round_id = r.round_id
where r.round_date >= current_date - 365
;


CREATE OR REPLACE FUNCTION handicap_calc()
	RETURNS TRIGGER AS $$
	BEGIN
		new.adjusted_par := (new.par + new.handicap_weighting);
		RETURN new;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION stableford_calc()
	RETURNS TRIGGER AS $$
	BEGIN
		new.stableford := 
			CASE
				WHEN (new.score - new.adjusted_par) >= 2 THEN 0
				WHEN (new.score - new.adjusted_par) = 1 THEN 1
				WHEN (new.score - new.adjusted_par) = 0 THEN 2
				WHEN (new.score - new.adjusted_par) = -1 THEN 3
				WHEN (new.score - new.adjusted_par) = -2 THEN 4
				WHEN (new.score - new.adjusted_par) = -3 THEN 5
			END;
		RETURN new;
	END;
$$ LANGUAGE plpgsql;

	
CREATE OR REPLACE TRIGGER calculate_handicap
BEFORE INSERT OR UPDATE ON recent_form
FOR EACH ROW
EXECUTE FUNCTION handicap_calc();

CREATE OR REPLACE TRIGGER calculate_stableford
BEFORE INSERT OR UPDATE ON recent_form
FOR EACH ROW
EXECUTE FUNCTION stableford_calc();

TRUNCATE recent_form;
drop table recent_form;
select * from recent_form order by 6,4;

update recent_form set score=6 where round_id=33 and hole_number=1;
commit;
select * from recent_form;