drop table if exists course cascade;
drop table if exists scores cascade;
drop table if exists player cascade;
drop table if exists hole_stats cascade;
drop table if exists round cascade;
drop table if exists handicap cascade;

create table if not exists course (
	course_id serial primary key,
	course_name varchar(50),
	slope_index_red int,
	slope_index_yellow int,
	slope_index_white int
);

create table if not exists player(
	player_id serial primary key,
	first_name varchar(50),
	last_name varchar(50)
);

create table if not exists hole_stats (
	course_id int references course(course_id),
	hole_id serial primary key,
	hole_number int, 
	par_red int,
	par_yellow int, 
	par_white int,
	stroke_index int, 
	yards_red int,
	yards_yellow int, 
	yards_white int
);

create table if not exists round (
	round_id serial primary key,
	round_date date,
	course_id int references course (course_id),
	colour varchar(10),
	round_type varchar(20),
	round_length int
);

create table if not exists scores (
	player_id int references player(player_id),
	course_id int references course(course_id),
	hole_id int references hole_stats(hole_id),
	round_id int references round(round_id),
	score int
);

create table if not exists handicap (
	handicap_id serial primary key,
	player_id int references player(player_id),
	course_id int references course(course_id),
	round_id int references round(round_id),
	handicap int
);