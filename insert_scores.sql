--inserting scores 

-- insert into scores VALUES (1,8,127,10,5);
-- insert into scores VALUES (1,8,128,10,8);
-- insert into scores VALUES (1,8,129,10,5);
-- insert into scores VALUES (1,8,130,10,5);
-- insert into scores VALUES (1,8,131,10,6);
-- insert into scores VALUES (1,8,132,10,4);
-- insert into scores VALUES (1,8,133,10,8);
-- insert into scores VALUES (1,8,134,10,5);
-- insert into scores VALUES (1,8,135,10,6);
-- insert into scores VALUES (1,8,136,10,6);
-- insert into scores VALUES (1,8,137,10,6);
-- insert into scores VALUES (1,8,138,10,5);
-- insert into scores VALUES (1,8,139,10,7);
-- insert into scores VALUES (1,8,140,10,7);
-- insert into scores VALUES (1,8,141,10,5);
-- insert into scores VALUES (1,8,142,10,8);
-- insert into scores VALUES (1,8,142,10,7);
-- insert into scores VALUES (1,8,144,10,7);

-- insert into scores VALUES (4,5,82,6,8);
-- insert into scores VALUES (4,5,83,6,7);
-- insert into scores VALUES (4,5,84,6,5);
-- insert into scores VALUES (4,5,85,6,7);
-- insert into scores VALUES (4,5,86,6,4);
-- insert into scores VALUES (4,5,87,6,5);
-- insert into scores VALUES (4,5,88,6,5);
-- insert into scores VALUES (4,5,89,6,4);
-- insert into scores VALUES (4,5,90,6,7);

-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=5
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=8 order by 2;

select * from scores where round_id=10 order by 2;
-- select * from player