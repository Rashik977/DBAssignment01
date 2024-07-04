--Q.1
select * from students where student_id in
(select student_id from enrollments where course_id =
( select course_id from courses where course_name = 'Math'))


--Q.2
select * from courses where course_id in
(select course_id from enrollments where student_id = (
select student_id from students where student_name = 'Bob'));

--Q.3
select student_name from students where student_id in
(select student_id from enrollments group by student_id having count(student_id) > 1);

--Q.4
SELECT * from students where
student_grade_id = (select grade_id from grades where grade_name = 'A');

--Q.5
SELECT
	(select course_name from courses c where c.course_id = e.course_id) as course_name ,
	COUNT(course_id) AS student_count
FROM Enrollments e
GROUP BY e.course_id;

--Q.6
select course_name from courses where course_id = (select max(course_id) from enrollments) ;

--Q.7
select student_name
from Students
WHERE
   student_id IN (
       select student_id
       from Enrollments
       GROUP BY
           student_id
       HAVING
			COUNT(course_id) = (SELECT
                   COUNT(course_id)
               FROM
                   Courses));

--Q.8
SELECT
   student_name
FROM
   Students
WHERE
   student_id NOT IN (
       SELECT
           student_id
       FROM
           Enrollments
       GROUP BY
           student_id
       HAVING
           COUNT(course_id) > 0
   );

--Q.9
SELECT
   AVG(student_age) as Avg_Age
FROM
   Students
WHERE
   student_id IN (
       SELECT
           student_id
       FROM
           Enrollments
       WHERE
           course_id = (
               SELECT
                   course_id
               FROM
                   courses
               WHERE
                   course_name = 'Science'
           )
   );

--Q.10
 SELECT
   student_name,
   (
       Select
           grade_name
       from
           grades G
       where
           S.student_grade_id = G.grade_id
   ) as Grade
from
   Students S
where
   student_id in (
       select
           student_id
       from
           Enrollments E
       where
           E.course_id = (
               Select
                   course_id
               from
                   courses
               where
                   course_name = 'History'
           )
   )
