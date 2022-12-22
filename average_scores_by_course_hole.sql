select * from full_stats;

select hole_number, round(avg(score),2) as score from full_stats where course_name like 'Southa%' group by hole_number order by 1;