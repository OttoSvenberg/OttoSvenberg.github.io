INSERT INTO student (contact_person_phone_number, current_level, contact_person_email, first_name, last_name, personal_number, email, phone_number, street, zip, city)
VALUES
('555-1234-5678', 'Intermediate', 'contact1@example.com', 'John', 'Doe', '123456789012', 'john.doe@example.com', '555-9876-5432', '123 Main St', '12345', 'City1'),
('555-5678-1234', 'Beginner', 'contact2@example.com', 'Jane', 'Smith', '987654321098', 'jane.smith@example.com', '555-4321-8765', '456 Oak St', '67890', 'City2'),
('555-7734-5618', 'Advanced', 'contact3@example.com', 'John', 'Halfar', '153456789012', 'john.halfar@example.com', '544-9876-5432', '153 Main St', '12346', 'City1'),
('555-1203-5678', 'Intermediate', 'contact4@example.com', 'Zlatan', 'Ibrahimovic', '123454389012', 'Zla.Ibra@example.com', '555-0076-5432', '213 Cole St', '54535', 'City4'),
('555-1234-5678', 'Intermediate', 'coct1@example.com', 'Jon', 'egag', '123457748012', 'johoe@example.com', '555-9556-5432', '125 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 'contat1@example.com', 'Cole', 'eeeee', '123836789012', 'jdoe@example.com', '555-3376-5432', '126 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 'con@example.com', 'Leo', 'Doe', '123456705098', 'doe@example.com', '555-9876-1832', '127 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 'coact1@example.com', 'Olo', 'Cato', '123437769012', 'hn.doe@example.com', '555-0876-5432', '128 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 'ntact1@example.com', 'Una', 'Cervesa', '123423789012', 'john.d@example.com', '555-9826-5432', '153 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 'co@example.com', 'Para', 'Mi', '123456756912', 'johoe@example.com', '555-9876-5152', '623 Main St', '12345', 'City1'),
('555-1234-5678', 'Intermediate', 't1@example.com', 'Tiger', 'Woods', '121426783412', 'jo.de@example.com', '555-9876-5092', '173 Main St', '12345', 'City1'),
('555-1111-1111', 'Advanced', 'contact3@example.com', 'Michael', 'Miller', '111111111113', 'michael.miller@example.com', '555-3333-3333', '789 Birch St', '45678', 'City5'),
('555-4444-4444', 'Intermediate', 'contact4@example.com', 'Emily', 'Davis', '444444444412', 'emily.davis@example.com', '555-5555-5555', '890 Maple St', '56789', 'City6')

;
INSERT INTO instructor (ensambles, last_name, personal_number, email, phone_number, first_name, street, zip, city)
VALUES
(true, 'Smith', '123456789012', 'smith@example.com', '555-1234-5678', 'John', '123 Main St', '12345', 'City1'),
(false, 'Johnson', '987654321098', 'johnson@example.com', '555-5678-1234', 'Jane', '456 Oak St', '67890', 'City2'),
(true, 'Svenberg', '123456789012', 'smith@example.com', '555-3524-5688', 'Otto', '897 Main St', '12344', 'City1'),
(true, 'Lane', '123456789012', 'smith@example.com', '555-1674-5128', 'Oscar', '245 Main St', '12346', 'City1'),
(false, 'Eriksson', '123456789012', 'smith@example.com', '555-1674-8798', 'Patrik', '176 Main St', '12347', 'City1');
-- Insert data into instrument_type table
INSERT INTO instrument_type (instrument_name)
VALUES
('Piano'),
('Guitar'),
('Triangle'),
('Xylophone'),
('Ashiko');


-- Insert data into instructor_instrument table
INSERT INTO instructor_instrument (instrument_id, instructor_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- Insert data into place table
INSERT INTO place (building)
VALUES
('Building A'),
('Building B'),
('Building C'),
('Building D'),
('Building E'),
('Building F'),
('Building G'),
('Building H'),
('Building I'),
('Building J'),
('Building K'),
('Building L'),
('Building M'),
('Building N'),
('Building O'),
('Building P'),
('Building Q'),
('Building R'),
('Building S'),
('Building T'),
('Building U'),
('Building V'),
('Building X'),
('Building Y'),
('Building Z'),
('Building Å');

-- Insert data into price_scheme table
INSERT INTO price_scheme (price_skill_level, discount, type_of_lesson_price, lesson_cost)
VALUES
('Intermediate', '10%', 'Individual', 50),
('Beginner', '10%', 'Individual', 45),
('Advanced', '10%', 'Individual', 55),
('Beginner', '5%', 'Group', 20),
('Intermediate', '5%', 'Group', 20),
('Advanced', '5%', 'Group', 20),
('Ensamble', '5%', 'Ensamble', 25);

-- Insert data into rentable_instruments table
INSERT INTO rentable_instruments (price, brand, type_of_instrument)
VALUES
('500', 'BrandX', 'Piano'),
('300', 'BrandY', 'Guitar');

-- Insert data into salary_scheme table
INSERT INTO salary_scheme (lesson_type, skill_level, salary_price)
VALUES
('Group', 'Beginner', 90),
('Group', 'Intermediate', 95),
('Group', 'Advanced', 100),
('Individual', 'Beginner', 65),
('Individual', 'Intermediate', 70),
('Individual', 'Advanced', 75),
('Ensamble', 'Advanced', 80);




-- Insert data into lesson table
INSERT INTO lesson (start_time, student_id, instructor_id, place_id, price_scheme_id, salary_scheme_id)
VALUES
('2023-01-15 14:00:00', 1, 1, 1, 1, 5),
('2023-01-20 16:30:00', 1, 2, 2, 2, 4),
('2023-02-20 16:30:00', 1, 3, 2, 3, 6),
('2023-03-22 16:30:00', 1, 3, 2, 4, 1),
('2023-03-23 16:30:00', 1, 3, 2, 5, 2),
('2023-03-24 16:30:00', 1, 2, 2, 6, 3),
('2023-04-20 16:30:00', 1, 1, 2, 7, 7),
('2023-05-20 16:30:00', 1, 4, 2, 1, 5),
('2023-05-22 16:30:00', 1, 5, 2, 1, 5),
('2023-05-24 16:30:00', 1, 5, 2, 1, 5),
('2023-06-20 16:30:00', 1, 1, 2, 2, 4),
('2023-07-20 16:30:00', 1, 1, 2, 2, 4),
('2023-08-20 16:30:00', 1, 2, 2, 2, 4),
('2023-08-23 16:30:00', 1, 2, 2, 4, 1),
('2023-09-20 16:30:00', 1, 4, 2, 4, 1),
('2023-10-20 16:30:00', 1, 3, 2, 4, 1),
('2023-11-20 16:30:00', 1, 5, 2, 4, 1),
('2023-11-21 16:30:00', 1, 2, 2, 5, 2),
('2023-11-22 16:30:00', 1, 3, 2, 6, 3),
('2023-11-24 16:30:00', 1, 3, 2, 2, 4),
('2023-11-25 16:30:00', 1, 1, 2, 2, 4),
('2023-12-21 16:30:00', 1, 1, 2, 2, 4),
('2023-12-22 16:30:00', 1, 4, 2, 7, 7),
('2023-12-23 16:30:00', 1, 4, 2, 7, 7),
('2023-12-05 16:30:00', 1, 4, 2, 7, 7),
('2023-12-06 16:30:00', 1, 3, 2, 7, 7),
('2023-12-07 16:30:00', 1, 3, 2, 7, 7),
('2023-12-08 16:30:00', 1, 1, 2, 7, 7),
('2023-12-11 16:30:00', 1, 4, 2, 7, 7),
('2023-12-13 16:30:00', 1, 3, 2, 7, 7),
('2023-12-14 16:30:00', 1, 3, 2, 7, 7),
('2023-12-15 16:30:00', 1, 1, 2, 7, 7);





-- Insert data into renting_instruments table
INSERT INTO renting_instruments (expired, rent_start_time, student_id, rentable_instruments_id)
VALUES
(NULL, '2023-01-15 12:00:00', 1, 1),
('2023-02-01 10:00:00', '2023-01-10 14:00:00', 2, 2);

-- Insert data into sibling table
INSERT INTO sibling (student_id, student_id2)
VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 5),
(5, 4),
(6, 7),
(6, 8),
(7, 6),
(7, 8),
(8, 6),
(8, 7),
(10, 11),
(11, 10);



-- Insert data into ensemble table
INSERT INTO ensamble (lesson_id, amount_of_students, min_students, max_students, genre)
VALUES
(7, '10', '5', '20', 'Classical'),
(23, '12', '5', '20', 'Pop'),
(24, '14', '5', '20', 'Rock'),
(25, '6', '5', '20', 'Gospel'),
(26, '7', '5', '20', 'Punk'),
(27, '19', '5', '20', 'Classical'),
(28, '20', '5', '20', 'Classical'),
(29, '9', '5', '20', 'Rock'),
(30, '10', '5', '20', 'Pop'),
(31, '11', '5', '20', 'Classical'),
(32, '17', '5', '20', 'Classical');

-- Insert data into group_lesson table
INSERT INTO group_lesson (lesson_id, min_students, amount_of_students, instrument_type, max_students, skill_level)
VALUES
(4, '5', '9', 'Piano', '23', 'Beginner'),
(5, '5', '12', 'Piano', '23', 'Intermediate'),
(6, '5', '21', 'Piano', '23', 'Advanced'),
(14, '5', '6', 'Piano', '23', 'Beginner'),
(15, '5', '14', 'Piano', '23', 'Beginner'),
(16, '5', '20', 'Piano', '23', 'Beginner'),
(17, '5', '9', 'Piano', '23', 'Beginner'),
(18, '5', '10', 'Piano', '23', 'Intermediate'),
(19, '5', '16', 'Guitar', '23', 'Advanced');

-- Insert data into individual_lessons table
INSERT INTO individual_lessons (lesson_id, instrument_type, skill_level)
VALUES
(1, 'Piano', 'Intermediate'),
(2, 'Piano', 'Beginner'),
(3, 'Piano', 'Advanced'),
(8, 'Piano', 'Intermediate'),
(9, 'Piano', 'Intermediate'),
(10, 'Piano', 'Intermediate'),
(11, 'Piano', 'Beginner'),
(12, 'Piano', 'Beginner'),
(13, 'Piano', 'Beginner'),
(20, 'Piano', 'Beginner'),
(21, 'Piano', 'Beginner'),
(22, 'Guitar', 'Beginner');