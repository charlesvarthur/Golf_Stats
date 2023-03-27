--inserting scores 

-- insert into scores VALUES (1,7,109,26,7);
-- insert into scores VALUES (1,7,110,26,4);
-- insert into scores VALUES (1,7,111,26,6);
-- insert into scores VALUES (1,7,112,26,6);
-- insert into scores VALUES (1,7,113,26,4);
-- insert into scores VALUES (1,7,114,26,7);
-- insert into scores VALUES (1,7,115,26,7);
-- insert into scores VALUES (1,7,116,26,6);
-- insert into scores VALUES (1,7,117,26,4);
-- insert into scores VALUES (1,7,118,26,5);
-- insert into scores VALUES (1,7,119,26,5);
-- insert into scores VALUES (1,7,120,26,7);
-- insert into scores VALUES (1,7,121,26,4);
-- insert into scores VALUES (1,7,122,26,8);
-- insert into scores VALUES (1,7,123,26,5);
-- insert into scores VALUES (1,7,124,26,4);
-- insert into scores VALUES (1,7,125,26,6);
-- insert into scores VALUES (1,7,126,26,4);

-- insert into scores VALUES (1,3,55,23,3);
-- insert into scores VALUES (1,3,56,23,6);
-- insert into scores VALUES (1,3,57,23,4);
-- insert into scores VALUES (1,3,58,23,7);
-- insert into scores VALUES (1,3,59,23,4);
-- insert into scores VALUES (1,3,60,23,4);
-- insert into scores VALUES (1,3,61,23,5);
-- insert into scores VALUES (1,3,62,23,4);
-- insert into scores VALUES (1,3,63,23,7);


-- Results checking and supporting queries
-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=5
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=7 order by 2;
--select * from course;
select * from scores where round_id=26 order by 2;
-- select * from players
--select * from round

--update round set round_length=18 where round_date='2022-02-19';