--inserting scores 

-- insert into scores VALUES (1,6,91,14,4);
-- insert into scores VALUES (1,6,92,14,4);
-- insert into scores VALUES (1,6,93,14,4);
-- insert into scores VALUES (1,6,94,14,5);
-- insert into scores VALUES (1,6,95,14,5);
-- insert into scores VALUES (1,6,96,14,3);
-- insert into scores VALUES (1,6,97,14,6);
-- insert into scores VALUES (1,6,98,14,4);
-- insert into scores VALUES (1,6,99,14,4);
-- insert into scores VALUES (1,6,100,14,3);
-- insert into scores VALUES (1,6,101,14,5);
-- insert into scores VALUES (1,6,102,14,6);
-- insert into scores VALUES (1,6,103,14,3);
-- insert into scores VALUES (1,6,104,14,6);
-- insert into scores VALUES (1,6,105,14,4);
-- insert into scores VALUES (1,6,106,14,4);
-- insert into scores VALUES (1,6,107,14,3);
-- insert into scores VALUES (1,6,108,14,4);

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
--select hole_number,hole_id,notes from hole_stats where course_id=6 order by 2;

select * from scores where round_id=14 order by 2;
-- select * from player