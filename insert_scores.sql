--inserting scores 

-- insert into scores VALUES (1,4,64,12,9);
-- insert into scores VALUES (1,4,65,12,8);
-- insert into scores VALUES (1,4,66,12,8);
-- insert into scores VALUES (1,4,67,12,6);
-- insert into scores VALUES (1,4,68,12,5);
-- insert into scores VALUES (1,4,69,12,5);
-- insert into scores VALUES (1,4,70,12,6);
-- insert into scores VALUES (1,4,71,12,7);
-- insert into scores VALUES (1,4,72,12,7);
-- insert into scores VALUES (1,4,73,12,6);
-- insert into scores VALUES (1,4,74,12,9);
-- insert into scores VALUES (1,4,75,12,6);
-- insert into scores VALUES (1,4,76,12,9);
-- insert into scores VALUES (1,4,77,12,9);
-- insert into scores VALUES (1,4,78,12,9);
-- insert into scores VALUES (1,4,79,12,7);
-- insert into scores VALUES (1,4,80,12,7);
-- insert into scores VALUES (1,4,81,12,9);

-- insert into scores VALUES (1,3,55,13,6);
-- insert into scores VALUES (1,3,56,13,6);
-- insert into scores VALUES (1,3,57,13,4);
-- insert into scores VALUES (1,3,58,13,6);
-- insert into scores VALUES (1,3,59,13,5);
-- insert into scores VALUES (1,3,60,13,8);
-- insert into scores VALUES (1,3,61,13,7);
-- insert into scores VALUES (1,3,62,13,7);
-- insert into scores VALUES (1,3,63,13,6);

-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=5
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=3 order by 2;

select * from scores where round_id=13 order by 2;
-- select * from player