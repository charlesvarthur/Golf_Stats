--insert into the hole_stats table with hole_id_seq

-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),1,5,5,5,4,445,465,481,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),2,3,3,3,18,105,176,188,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),3,4,4,4,8,344,407,416,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),4,4,4,4,10,313,334,347,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),5,4,4,4,6,344,368,375,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),6,4,4,4,12,314,335,380,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),7,4,4,4,14,238,251,260,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),8,5,5,5,2,424,434,444,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),9,3,3,3,16,144,170,189,NULL);

-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),10,4,4,4,11,391,422,450,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),11,5,5,5,1,516,580,601,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),12,3,3,3,13,132,145,153,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),13,5,5,5,3,438,463,473,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),14,5,5,5,7,401,456,497,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),15,3,3,3,15,127,137,171,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),16,4,4,4,9,360,393,421,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),17,3,3,3,17,93,147,176,NULL);
-- insert into hole_stats VALUES (20,nextval('hole_stats_hole_id_seq'),18,4,4,4,5,292,325,330,NULL);

-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),1,4,4,4,13,256,271,289,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),2,5,4,4,3,331,347,347,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),3,4,4,4,1,434,437,441,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),4,3,3,3,15,122,131,140,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),5,4,4,4,11,230,277,264,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),6,3,3,3,17,149,178,166,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),7,4,4,4,7,244,311,311,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),8,3,3,3,9,191,230,221,NULL);
-- insert into hole_stats VALUES (17,nextval('hole_stats_hole_id_seq'),9,4,4,4,5,331,374,393,NULL);
-- select * from course;
select * from hole_stats where course_id IN (20);