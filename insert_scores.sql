--inserting scores 

insert into scores VALUES (1,2,19,40,7);
insert into scores VALUES (1,2,20,40,8);
insert into scores VALUES (1,2,21,40,4);
insert into scores VALUES (1,2,22,40,7);
insert into scores VALUES (1,2,23,40,4);
insert into scores VALUES (1,2,24,40,6);
insert into scores VALUES (1,2,25,40,7);
insert into scores VALUES (1,2,26,40,5);
insert into scores VALUES (1,2,27,40,5);
insert into scores VALUES (1,2,28,40,5);
insert into scores VALUES (1,2,29,40,6);
insert into scores VALUES (1,2,30,40,4);
insert into scores VALUES (1,2,31,40,6);
insert into scores VALUES (1,2,32,40,5);
insert into scores VALUES (1,2,33,40,4);
insert into scores VALUES (1,2,34,40,6);
insert into scores VALUES (1,2,35,40,6);
insert into scores VALUES (1,2,36,40,7);

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
--select hole_number,hole_id,notes from hole_stats where course_id=2 order by 2;
--select * from course;
select * from scores where round_id=40 order by 3;
--select sum(score) from scores where round_id=40 and player_id=1;
-- select * from player
--select * from round