--inserting scores 

-- insert into scores VALUES (1,10,163,15,9);
-- insert into scores VALUES (1,10,164,15,4);
-- insert into scores VALUES (1,10,165,15,8);
-- insert into scores VALUES (1,10,166,15,9);
-- insert into scores VALUES (1,10,167,15,9);
-- insert into scores VALUES (1,10,168,15,9);
-- insert into scores VALUES (1,10,169,15,6);
-- insert into scores VALUES (1,10,170,15,6);
-- insert into scores VALUES (1,10,171,15,7);
-- insert into scores VALUES (1,10,172,15,6);
-- insert into scores VALUES (1,10,173,15,7);
-- insert into scores VALUES (1,10,174,15,4);
-- insert into scores VALUES (1,10,175,15,9);
-- insert into scores VALUES (1,10,176,15,6);
-- insert into scores VALUES (1,10,177,15,7);
-- insert into scores VALUES (1,10,178,15,7);
-- insert into scores VALUES (1,10,179,15,4);
-- insert into scores VALUES (1,10,180,15,9);

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
--select hole_number,hole_id,notes from hole_stats where course_id=10 order by 2;

select * from scores where round_id=15 order by 2;
-- select * from player