--inserting scores 

-- insert into scores VALUES (5,9,145,32,7);
-- insert into scores VALUES (5,9,146,32,7);
-- insert into scores VALUES (5,9,147,32,6);
-- insert into scores VALUES (5,9,148,32,6);
-- insert into scores VALUES (5,9,149,32,9);
-- insert into scores VALUES (5,9,150,32,9);
-- insert into scores VALUES (5,9,151,32,9);
-- insert into scores VALUES (5,9,152,32,9);
-- insert into scores VALUES (5,9,153,32,5);
-- insert into scores VALUES (5,9,154,32,9);
-- insert into scores VALUES (5,9,155,32,6);
-- insert into scores VALUES (5,9,156,32,9);
-- insert into scores VALUES (5,9,157,32,9);
-- insert into scores VALUES (5,9,158,32,6);
-- insert into scores VALUES (5,9,159,32,9);
-- insert into scores VALUES (5,9,160,32,7);
-- insert into scores VALUES (5,9,161,32,9);
-- insert into scores VALUES (5,9,162,32,7);

-- insert into scores VALUES (1,15,235,31,4);
-- insert into scores VALUES (1,15,236,31,6);
-- insert into scores VALUES (1,15,237,31,6);
-- insert into scores VALUES (1,15,238,31,6);
-- insert into scores VALUES (1,15,239,31,6);
-- insert into scores VALUES (1,15,240,31,3);
-- insert into scores VALUES (1,15,241,31,6);
-- insert into scores VALUES (1,15,242,31,6);
-- insert into scores VALUES (1,15,243,31,9);

-- Results checking and supporting queries
-- select hs.hole_id, hs.hole_number, c.course_id, c.course_name, hs.notes
-- from hole_stats hs
-- JOIN 
-- course c
-- ON hs.course_id = c.course_id
-- where c.course_id=6
-- order by 1;
--select hole_number,hole_id,notes from hole_stats where course_id=9 order by 2;
--select * from course;
select * from scores where round_id=32 order by 3;
select sum(score) from scores where round_id=32 and player_id=1;
-- select * from player
--select * from round

