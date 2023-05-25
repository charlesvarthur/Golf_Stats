--insert into the hole_stats table with hole_id_seq

-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),1,5,5,5,11,432,473,508,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),2,4,4,4,5,381,416,439,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),3,3,3,3,17,119,129,143,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),4,4,4,4,13,284,324,342,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),5,4,4,4,1,359,392,408,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),6,4,4,4,3,360,385,438,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),7,3,3,3,9,141,159,177,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),8,4,4,4,15,242,275,295,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),9,5,5,5,7,514,547,556,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),10,5,5,5,6,471,532,556,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),11,3,3,3,8,143,165,186,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),12,4,4,4,2,412,443,458,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),13,4,4,4,18,245,296,318,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),14,4,4,4,12,326,339,362,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),15,5,5,5,10,438,446,502,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),16,3,3,3,16,120,141,145,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),17,4,4,4,4,342,378,412,NULL);
-- insert into hole_stats VALUES (14,nextval('hole_stats_hole_id_seq'),18,4,4,4,14,306,332,351,NULL);

-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),19,3,3,3,15,125,153,173,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),20,4,4,4,1,390,411,422,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),21,3,3,3,11,146,152,184,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),22,4,4,4,5,314,332,354,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),23,5,5,5,7,468,482,494,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),24,3,3,3,17,106,115,122,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),25,4,4,4,3,300,317,326,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),26,4,4,4,13,271,284,302,NULL);
-- insert into hole_stats VALUES (15,nextval('hole_stats_hole_id_seq'),27,5,5,5,9,413,436,479,NULL);

select * from hole_stats where course_id IN (14,15);