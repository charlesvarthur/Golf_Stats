DO
$$DECLARE
--	datestr text := to_char(current_timestamp, 'YYYY-MM-DD-HH24_MI_SS');

BEGIN
	EXECUTE	format(
		'COPY ' 
		'(select * from full_stats) '
		'TO %L CSV HEADER',
		'/Users/charlesarthur/Documents/Data_Projects/Golf_Stats/full_stats.csv'
		);
END;
$$;
			