--inserting scores 

-- insert into scores VALUES (1,3,37,8,3);
-- insert into scores VALUES (1,3,38,8,9);
-- insert into scores VALUES (1,3,39,8,6);
-- insert into scores VALUES (1,3,40,8,5);
-- insert into scores VALUES (1,3,41,8,5);
-- insert into scores VALUES (1,3,42,8,9);
-- insert into scores VALUES (1,3,43,8,8);
-- insert into scores VALUES (1,3,44,8,8);
-- insert into scores VALUES (1,3,45,8,5);
-- insert into scores VALUES (1,3,46,8,4);
-- insert into scores VALUES (1,3,47,8,7);
-- insert into scores VALUES (1,3,48,8,9);
-- insert into scores VALUES (1,3,49,8,6);
-- insert into scores VALUES (1,3,50,8,8);
-- insert into scores VALUES (1,3,51,8,9);
-- insert into scores VALUES (1,3,52,8,9);
-- insert into scores VALUES (1,3,53,8,4);
-- insert into scores VALUES (1,3,54,8,5);

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
--select hole_number,hole_id,notes from hole_stats where course_id=3 order by 2;
select * from scores where round_id=8 order by 2;
-- select * from player