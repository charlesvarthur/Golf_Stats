--inserting scores 

-- insert into scores VALUES (1,17,262,35,4);
-- insert into scores VALUES (1,17,263,35,7);
-- insert into scores VALUES (1,17,264,35,6);
-- insert into scores VALUES (1,17,265,35,4);
-- insert into scores VALUES (1,17,266,35,6);
-- insert into scores VALUES (1,17,267,35,4);
-- insert into scores VALUES (1,17,268,35,5);
-- insert into scores VALUES (1,17,269,35,5);
-- insert into scores VALUES (1,17,270,35,5);
-- insert into scores VALUES (1,17,262,35,4);
-- insert into scores VALUES (1,17,263,35,5);
-- insert into scores VALUES (1,17,264,35,5);
-- insert into scores VALUES (1,17,265,35,3);
-- insert into scores VALUES (1,17,266,35,4);
-- insert into scores VALUES (1,17,267,35,4);
-- insert into scores VALUES (1,17,268,35,5);
-- insert into scores VALUES (1,17,269,35,6);
-- insert into scores VALUES (1,17,270,35,7);

-- insert into scores VALUES (1,13,55,34,3);
-- insert into scores VALUES (1,13,56,34,4);
-- insert into scores VALUES (1,13,57,34,7);
-- insert into scores VALUES (1,13,58,34,5);
-- insert into scores VALUES (1,13,59,34,4);
-- insert into scores VALUES (1,13,60,34,7);
-- insert into scores VALUES (1,13,61,34,4);
-- insert into scores VALUES (1,13,62,34,6);
-- insert into scores VALUES (1,13,63,34,7);

-- Results checking and supporting queries
-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=6
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=17 order by 2;
--select * from course;
select * from scores where round_id=35 order by 3;
select sum(score) from scores where round_id=35 and player_id=1;
-- select * from player
--select * from round

