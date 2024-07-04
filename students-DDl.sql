-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS "Students".courses
(
    course_id integer NOT NULL,
    course_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT courses_pkey PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS "Students".enrollments
(
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date,
    CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id)
);

CREATE TABLE IF NOT EXISTS "Students".grades
(
    grade_id integer NOT NULL,
    grade_name character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT grades_pkey PRIMARY KEY (grade_id)
);

CREATE TABLE IF NOT EXISTS "Students".students
(
    student_id integer NOT NULL,
    student_name character varying(50) COLLATE pg_catalog."default",
    student_age integer,
    student_grade_id integer,
    CONSTRAINT students_pkey PRIMARY KEY (student_id)
);

ALTER TABLE IF EXISTS "Students".enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id)
    REFERENCES "Students".courses (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS "Students".enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id)
    REFERENCES "Students".students (student_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS "Students".students
    ADD CONSTRAINT students_student_grade_id_fkey FOREIGN KEY (student_grade_id)
    REFERENCES "Students".grades (grade_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;