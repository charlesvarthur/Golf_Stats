--inserting scores 

-- insert into scores VALUES (1,16,244,33,6);
-- insert into scores VALUES (1,16,245,33,5);
-- insert into scores VALUES (1,16,246,33,7);
-- insert into scores VALUES (1,16,247,33,8);
-- insert into scores VALUES (1,16,248,33,6);
-- insert into scores VALUES (1,16,249,33,5);
-- insert into scores VALUES (1,16,250,33,7);
-- insert into scores VALUES (1,16,251,33,3);
-- insert into scores VALUES (1,16,252,33,3);
-- insert into scores VALUES (1,16,253,33,7);
-- insert into scores VALUES (1,16,254,33,5);
-- insert into scores VALUES (1,16,255,33,6);
-- insert into scores VALUES (1,16,256,33,5);
-- insert into scores VALUES (1,16,257,33,6);
-- insert into scores VALUES (1,16,258,33,9);
-- insert into scores VALUES (1,16,259,33,3);
-- insert into scores VALUES (1,16,260,33,5);
-- insert into scores VALUES (1,16,261,33,7);

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
--select hole_number,hole_id,notes from hole_stats where course_id=16 order by 2;
--select * from course;
select * from scores where round_id=33 order by 3;
select sum(score) from scores where round_id=33 and player_id=1;
-- select * from player
--select * from round

