--inserting scores 

-- insert into scores VALUES (1,8,109,38,5);
-- insert into scores VALUES (1,8,110,38,8);
-- insert into scores VALUES (1,8,111,38,9);
-- insert into scores VALUES (1,8,112,38,4);
-- insert into scores VALUES (1,8,113,38,4);
-- insert into scores VALUES (1,8,114,38,7);
-- insert into scores VALUES (1,8,115,38,4);
-- insert into scores VALUES (1,8,116,38,6);
-- insert into scores VALUES (1,8,117,38,6);
-- insert into scores VALUES (1,8,118,38,5);
-- insert into scores VALUES (1,8,119,38,6);
-- insert into scores VALUES (1,8,120,38,9);
-- insert into scores VALUES (1,8,121,38,4);
-- insert into scores VALUES (1,8,122,38,6);
-- insert into scores VALUES (1,8,123,38,5);
-- insert into scores VALUES (1,8,124,38,6);
-- insert into scores VALUES (1,8,125,38,7);
-- insert into scores VALUES (1,8,126,38,7);

-- insert into scores VALUES (1,13,55,36,4);
-- insert into scores VALUES (1,13,56,36,5);
-- insert into scores VALUES (1,13,57,36,5);
-- insert into scores VALUES (1,13,58,36,6);
-- insert into scores VALUES (1,13,59,36,4);
-- insert into scores VALUES (1,13,60,36,5);
-- insert into scores VALUES (1,13,61,36,4);
-- insert into scores VALUES (1,13,62,36,7);
-- insert into scores VALUES (1,13,63,36,6);

-- Results checking and supporting queries
-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=6
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=7 order by 2;
--select * from course;
select * from scores where round_id=38 order by 3;
--select sum(score) from scores where round_id=37 and player_id=1;
-- select * from player
--select * from round