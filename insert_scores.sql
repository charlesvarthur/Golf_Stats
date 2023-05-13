--inserting scores 

-- insert into scores VALUES (1,3,37,28,4);
-- insert into scores VALUES (1,3,38,28,9);
-- insert into scores VALUES (1,3,39,28,6);
-- insert into scores VALUES (1,3,40,28,7);
-- insert into scores VALUES (1,3,41,28,6);
-- insert into scores VALUES (1,3,42,28,5);
-- insert into scores VALUES (1,3,43,28,8);
-- insert into scores VALUES (1,3,44,28,9);
-- insert into scores VALUES (1,3,45,28,5);
-- insert into scores VALUES (1,3,46,28,4);
-- insert into scores VALUES (1,3,47,28,8);
-- insert into scores VALUES (1,3,48,28,7);
-- insert into scores VALUES (1,3,49,28,5);
-- insert into scores VALUES (1,3,50,28,7);
-- insert into scores VALUES (1,3,51,28,7);
-- insert into scores VALUES (1,3,52,28,7);
-- insert into scores VALUES (1,3,53,28,5);
-- insert into scores VALUES (1,3,54,28,9);

-- insert into scores VALUES (1,1,1,30,3);
-- insert into scores VALUES (1,1,2,30,7);
-- insert into scores VALUES (1,1,3,30,7);
-- insert into scores VALUES (1,1,4,30,4);
-- insert into scores VALUES (1,1,5,30,5);
-- insert into scores VALUES (1,1,6,30,4);
-- insert into scores VALUES (1,1,7,30,5);
-- insert into scores VALUES (1,1,8,30,5);
-- insert into scores VALUES (1,1,9,30,5);

-- Results checking and supporting queries
-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=5
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=1 order by 2;
--select * from course;
select * from scores where round_id=30 order by 3;
select sum(score) from scores where round_id=30 and player_id=1;
-- select * from player
--select * from round

