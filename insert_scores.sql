--inserting scores 

-- insert into scores VALUES (1,20,1,44,5);
-- insert into scores VALUES (1,20,2,44,5);
-- insert into scores VALUES (1,20,3,44,7);
-- insert into scores VALUES (1,20,4,44,3);
-- insert into scores VALUES (1,20,5,44,7);
-- insert into scores VALUES (1,20,6,44,5);
-- insert into scores VALUES (1,20,7,44,7);
-- insert into scores VALUES (1,20,8,44,5);
-- insert into scores VALUES (1,20,9,44,7);
-- insert into scores VALUES (1,20,10,44,4);
-- insert into scores VALUES (1,20,11,44,4);
-- insert into scores VALUES (1,20,12,44,6);
-- insert into scores VALUES (1,20,13,44,4);
-- insert into scores VALUES (1,20,14,44,7);
-- insert into scores VALUES (1,20,15,44,6);
-- insert into scores VALUES (1,20,16,44,7);
-- insert into scores VALUES (1,20,17,44,4);
-- insert into scores VALUES (1,20,18,44,6);



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
--select hole_number,hole_id,notes from hole_stats where course_id=1 order by 2;
--select * from course;
select * from scores where round_id=44 order by 3;
--select sum(score) from scores where round_id=44 and player_id=1;
-- select * from player
--select * from round