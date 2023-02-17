--inserting scores 

-- insert into scores VALUES (1,4,19,21,7);
-- insert into scores VALUES (1,4,20,21,7);
-- insert into scores VALUES (1,4,21,21,7);
-- insert into scores VALUES (1,4,22,21,6);
-- insert into scores VALUES (1,4,23,21,5);
-- insert into scores VALUES (1,4,24,21,4);
-- insert into scores VALUES (1,4,25,21,5);
-- insert into scores VALUES (1,4,26,21,5);
-- insert into scores VALUES (1,4,27,21,6);
-- insert into scores VALUES (1,4,28,21,6);
-- insert into scores VALUES (1,4,29,21,5);
-- insert into scores VALUES (1,4,30,21,5);
-- insert into scores VALUES (1,4,31,21,6);
-- insert into scores VALUES (1,4,32,21,5);
-- insert into scores VALUES (1,4,33,21,4);
-- insert into scores VALUES (1,4,34,21,9);
-- insert into scores VALUES (1,4,35,21,4);
-- insert into scores VALUES (1,4,36,21,7);

-- insert into scores VALUES (1,11,190,18,5);
-- insert into scores VALUES (1,11,191,18,4);
-- insert into scores VALUES (1,11,192,18,8);
-- insert into scores VALUES (1,11,193,18,6);
-- insert into scores VALUES (1,11,194,18,7);
-- insert into scores VALUES (1,11,195,18,5);
-- insert into scores VALUES (1,11,196,18,6);
-- insert into scores VALUES (1,11,197,18,6);
-- insert into scores VALUES (1,11,198,18,5);

-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=5
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=6 order by 2;

select * from scores where round_id=21 order by 2;
-- select * from playe