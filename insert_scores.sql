--inserting scores 

-- insert into scores VALUES (1,14,64,37,4);
-- insert into scores VALUES (1,14,65,37,4);
-- insert into scores VALUES (1,14,66,37,6);
-- insert into scores VALUES (1,14,67,37,5);
-- insert into scores VALUES (1,14,68,37,2);
-- insert into scores VALUES (1,14,69,37,7);
-- insert into scores VALUES (1,14,70,37,4);
-- insert into scores VALUES (1,14,71,37,5);
-- insert into scores VALUES (1,14,72,37,6);
-- insert into scores VALUES (1,14,73,37,5);
-- insert into scores VALUES (1,14,74,37,5);
-- insert into scores VALUES (1,14,75,37,6);
-- insert into scores VALUES (1,14,76,37,9);
-- insert into scores VALUES (1,14,77,37,4);
-- insert into scores VALUES (1,14,78,37,6);
-- insert into scores VALUES (1,14,79,37,7);
-- insert into scores VALUES (1,14,80,37,5);
-- insert into scores VALUES (1,14,81,37,6);

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
--select hole_number,hole_id,notes from hole_stats where course_id=4 order by 2;
--select * from course;
select * from scores where round_id=37 order by 3;
select sum(score) from scores where round_id=37 and player_id=1;
-- select * from player
--select * from round

