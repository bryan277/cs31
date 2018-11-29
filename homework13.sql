DROP DATABASE IF EXISTS test_hw13;
CREATE DATABASE test_hw13;
USE test_hw13;

CREATE TABLE player (
    player_id INT NOT NULL,
    player_name CHAR(50) NOT NULL,
    success INT NOT NULL,
    attempt INT NOT NULL,
	perc_success DECIMAL (4, 3) NULL,
    CONSTRAINT player_pk PRIMARY KEY (player_id)
    );

-- 1. CREATE calc_perc TRIGGER here.
--    This TRIGGER should calculate and modify the perc_success
--    column based on the values of the success and attempt columns.
DROP TRIGGER IF EXISTS ins_ext_succes;
DROP TRIGGER IF EXISTS log_deletes;

CREATE TRIGGER ins_ext_succes
BEFORE INSERT ON player
FOR EACH ROW
	SET NEW.perc_success = NEW.success/NEW.attempt;
	
INSERT INTO player (player_id, player_name, success, attempt) VALUES
    (1, 'Player 1', 1, 10), (2, 'Player 2', 2, 10), (3, 'Player 3', 3, 10), (4, 'Player 4', 4, 10),
	(5, 'Player 5', 5, 10), (6, 'Player 6', 6, 10), (7, 'Player 7', 7, 10), (8, 'Player 8', 8, 10),
	(9, 'Player 9', 9, 10), (10, 'Player 10', 10, 10);

CREATE TABLE student (
    student_id INT NOT NULL,
	student_name CHAR(35) NOT NULL,
	student_email CHAR(35) NOT NULL,
	CONSTRAINT student_pk PRIMARY KEY (student_id)
	);

CREATE TABLE course (
    course_id INT NOT NULL,
	course_name CHAR(35) NOT NULL,
	schedule CHAR(35) NOT NULL,
	CONSTRAINT course_pk PRIMARY KEY (course_id)
	);

CREATE TABLE enroll (
    student_id INT NOT NULL,
	course_id INT NOT NULL,
	grade CHAR(1) NULL,
	CONSTRAINT enroll_pk PRIMARY KEY (student_id, course_id),
	CONSTRAINT student_fk FOREIGN KEY (student_id)
	    REFERENCES student (student_id),
    CONSTRAINT course_fk FOREIGN KEY (course_id)
	    REFERENCES course (course_id)
	);

INSERT INTO student VALUES
    (1, 'Student 1', 'student1@college.edu'),
	(2, 'Student 2', 'student2@college.edu');

INSERT INTO course VALUES
    (1, 'Course 1', 'MW 9-10'),
	(2, 'Course 2', 'MW 11-12'),
	(3, 'Course 3', 'MW 1-2'),
	(4, 'Course 4', 'MW 3-4'),
	(5, 'Course 5', 'MW 5-6'),
	(6, 'Course 6', 'MW 7-8');

INSERT INTO enroll(student_id, course_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
	(2, 1), (2, 2), (2, 3), (2, 4);

DELIMITER //

CREATE PROCEDURE enroll_student (IN var_student_id INT, IN var_course_id INT)
BEGIN
    DECLARE num_courses INT DEFAULT 0;

	-- 2. Complete the PROCEDURE here.
    --    Execute the INSERT statement below only if the student is currently enrolled
    --    in less than 5 courses.
    START TRANSACTION;
		INSERT INTO enroll(student_id, course_id) 
        VALUES (var_student_id, var_course_id);
        

END //

DELIMITER ;

CALL enroll_student(1, 6); -- This call should not execute the INSERT statement in the PROCEDURE
CALL enroll_student(2, 6); -- This call should execute the INSERT statement in the PROCEDURE
