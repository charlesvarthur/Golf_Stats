--inserting scores 
--SELECT * FROM PLAYER

-- insert into scores VALUES (1,4,64,46,7);
-- insert into scores VALUES (1,4,65,46,3);
-- insert into scores VALUES (1,4,66,46,9);
-- insert into scores VALUES (1,4,67,46,4);
-- insert into scores VALUES (1,4,68,46,9);
-- insert into scores VALUES (1,4,69,46,9);
-- insert into scores VALUES (1,4,70,46,5);
-- insert into scores VALUES (1,4,71,46,5);
-- insert into scores VALUES (1,4,72,46,9);
-- insert into scores VALUES (1,4,73,46,9);
-- insert into scores VALUES (1,4,74,46,6);
-- insert into scores VALUES (1,4,75,46,7);
-- insert into scores VALUES (1,4,76,46,4);
-- insert into scores VALUES (1,4,77,46,6);
-- insert into scores VALUES (1,4,78,46,7);
-- insert into scores VALUES (1,4,79,46,5);
-- insert into scores VALUES (1,4,80,46,5);
-- insert into scores VALUES (1,4,81,46,9);



-- insert into scores VALUES (1,17,262,45,3);
-- insert into scores VALUES (1,17,263,45,8);
-- insert into scores VALUES (1,17,264,45,6);
-- insert into scores VALUES (1,17,265,45,4);
-- insert into scores VALUES (1,17,266,45,6);
-- insert into scores VALUES (1,17,267,45,7);
-- insert into scores VALUES (1,17,268,45,7);
-- insert into scores VALUES (1,17,269,45,6);
-- insert into scores VALUES (1,17,270,45,5);

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
--select * from scores where round_id=46 order by 3;
select sum(score) from scores where round_id=46 and player_id=1;
-- select * from player
--select * from round