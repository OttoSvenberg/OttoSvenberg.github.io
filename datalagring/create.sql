CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 ensambles BOOLEAN NOT NULL,
 last_name VARCHAR(500),
 personal_number  VARCHAR(500) NOT NULL,
 email VARCHAR(500),
 phone_number VARCHAR(500),
 first_name VARCHAR(500),
 street VARCHAR(500),
 zip VARCHAR(500),
 city VARCHAR(500)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument_type (
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_name VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE place (
 place_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 building VARCHAR(500)
);

ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY (place_id);


CREATE TABLE price_scheme (
 price_scheme_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price_skill_level  VARCHAR(500) NOT NULL,
 discount  VARCHAR(500) NOT NULL,
 type_of_lesson_price  VARCHAR(500) NOT NULL,
 lesson_cost INT NOT NULL
);

ALTER TABLE price_scheme ADD CONSTRAINT PK_price_scheme PRIMARY KEY (price_scheme_id);


CREATE TABLE rentable_instruments (
 rentable_instruments_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price  VARCHAR(500) NOT NULL,
 brand VARCHAR(500),
 type_of_instrument   VARCHAR(500) NOT NULL
);

ALTER TABLE rentable_instruments ADD CONSTRAINT PK_rentable_instruments PRIMARY KEY (rentable_instruments_id);


CREATE TABLE salary_scheme (
 salary_scheme_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type  VARCHAR(500) NOT NULL,
 skill_level  VARCHAR(500) NOT NULL,
 salary_price INT NOT NULL
);

ALTER TABLE salary_scheme ADD CONSTRAINT PK_salary_scheme PRIMARY KEY (salary_scheme_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 contact_person_phone_number VARCHAR(500),
 current_level VARCHAR(500),
 contact_person_email VARCHAR(500),
 last_name VARCHAR(500),
 personal_number  VARCHAR(12) NOT NULL,
 email VARCHAR(500),
 phone_number VARCHAR(500),
 first_name VARCHAR(500),
 street VARCHAR(500),
 zip VARCHAR(500),
 city VARCHAR(500)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE instructor_instrument (
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument_id,instructor_id);


CREATE TABLE lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP,
 student_id INT,
 instructor_id INT,
 place_id INT NOT NULL,
 price_scheme_id INT NOT NULL,
 salary_scheme_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE renting_instruments (
 renting_instruments_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 expired   TIMESTAMP,
 rent_start_time TIMESTAMP NOT NULL,
 student_id INT,
 rentable_instruments_id INT NOT NULL
);

ALTER TABLE renting_instruments ADD CONSTRAINT PK_renting_instruments PRIMARY KEY (renting_instruments_id );


CREATE TABLE sibling (
 student_id INT NOT NULL,
 student_id2 INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,student_id2);


CREATE TABLE ensamble (
 lesson_id INT NOT NULL,
 amount_of_students VARCHAR(500),
 min_students VARCHAR(500),
 max_students VARCHAR(500),
 genre  VARCHAR(500) NOT NULL
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 min_students VARCHAR(500),
 amount_of_students VARCHAR(500),
 instrument_type  VARCHAR(500) NOT NULL,
 max_students VARCHAR(500),
 skill_level VARCHAR(500) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lessons (
 lesson_id INT NOT NULL,
 instrument_type  VARCHAR(500) NOT NULL,
 skill_level VARCHAR(500) NOT NULL
);

ALTER TABLE individual_lessons ADD CONSTRAINT PK_individual_lessons PRIMARY KEY (lesson_id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (place_id) REFERENCES place (place_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_3 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme (price_scheme_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_4 FOREIGN KEY (salary_scheme_id) REFERENCES salary_scheme (salary_scheme_id);


ALTER TABLE renting_instruments ADD CONSTRAINT FK_renting_instruments_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE renting_instruments ADD CONSTRAINT FK_renting_instruments_1 FOREIGN KEY (rentable_instruments_id) REFERENCES rentable_instruments (rentable_instruments_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (student_id2) REFERENCES student (student_id);


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE individual_lessons ADD CONSTRAINT FK_individual_lessons_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);