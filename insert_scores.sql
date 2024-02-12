--inserting scores 

-- insert into scores VALUES (1,20,307,43,6);
-- insert into scores VALUES (1,20,308,43,4);
-- insert into scores VALUES (1,20,309,43,7);
-- insert into scores VALUES (1,20,310,43,8);
-- insert into scores VALUES (1,20,311,43,5);
-- insert into scores VALUES (1,20,312,43,5);
-- insert into scores VALUES (1,20,313,43,6);
-- insert into scores VALUES (1,20,314,43,6);
-- insert into scores VALUES (1,20,315,43,6);
-- insert into scores VALUES (1,20,316,43,9);
-- insert into scores VALUES (1,20,317,43,8);
-- insert into scores VALUES (1,20,318,43,5);
-- insert into scores VALUES (1,20,319,43,8);
-- insert into scores VALUES (1,20,320,43,9);
-- insert into scores VALUES (1,20,321,43,6);
-- insert into scores VALUES (1,20,322,43,5);
-- insert into scores VALUES (1,20,323,43,5);
-- insert into scores VALUES (1,20,324,43,9);

-- alter table scores drop column course_id;

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
--select hole_number,hole_id,notes from hole_stats where course_id=20 order by 2;
--select * from course;
select * from scores where round_id=43 order by 3;
--select sum(score) from scores where round_id=43 and player_id=1;
-- select * from player
--select * from round