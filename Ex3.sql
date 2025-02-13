CREATE DATABASE degreecollege;

show databases;

drop database degreecollege;

show databases;

create database degreecollege;
USE degreecollege;

CREATE TABLE students (
    stdid INT PRIMARY KEY,
    stdfirstname VARCHAR(100),
    stdlastname VARCHAR(100),
    stdphone VARCHAR(15),
    stdclass VARCHAR(20)
);
SELECT * FROM students;


CREATE TABLE fees (
    fee_id INT PRIMARY KEY,
    stdid INT,
    fee_due_date DATE,
    fee_paid_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM fees;

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    stdid INT,
    program_name VARCHAR(100),
    application_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM applications;

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    stdid INT,
    date DATE,
    status VARCHAR(10),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM attendance;

CREATE TABLE library (
    record_id INT PRIMARY KEY,
    stdid INT,
    book_title VARCHAR(200),
    borrow_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM library;


CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    subject VARCHAR(100),
    phone_number VARCHAR(15),
    hire_date DATE
);
SELECT * FROM faculty;


CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    location VARCHAR(100),
    coordinator_id INT,
    FOREIGN KEY (coordinator_id) REFERENCES faculty(faculty_id)
);
SELECT * FROM events;

CREATE TABLE hostel (
    room_id INT PRIMARY KEY,
    stdid INT,
    room_number VARCHAR(10),
    bed_number INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM hostel;


CREATE TABLE placements (
    placement_id INT PRIMARY KEY,
    stdid INT,
    company_name VARCHAR(100),
    offer_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);
SELECT * FROM placements;

INSERT INTO students (stdid, stdfirstname, stdlastname, stdphone, stdclass)
VALUES (102, 'John', 'Doe', '9876543210', '2A'),
       (103, 'Jane', 'Smith', '8765432109', '3B'),
       (104, 'Alice', 'Johnson', '7654321098', '4C');

INSERT INTO fees (fee_id, stdid, fee_due_date, fee_paid_date, status)
VALUES (1, 102, '2025-01-20', '2025-01-18', 'Paid'),
       (2, 103, '2025-01-20', NULL, 'Unpaid'),
       (3, 104, '2025-01-20', NULL, 'Unpaid');

INSERT INTO applications (application_id, stdid, program_name, application_date, status)
VALUES (1, 102, 'Science Fair', '2025-01-10', 'Approved'),
       (2, 103, 'Technology Workshop', '2025-01-12', 'Pending'),
       (3, 104, 'Sports Meet', '2025-01-15', 'Rejected');

INSERT INTO attendance (attendance_id, stdid, date, status)
VALUES (1, 102, '2025-01-10', 'Present'),
       (2, 103, '2025-01-10', 'Absent'),
       (3, 104, '2025-01-10', 'Present');

INSERT INTO library (record_id, stdid, book_title, borrow_date, return_date, status)
VALUES (1, 102, 'Physics 101', '2025-01-05', '2025-01-15', 'Returned'),
       (2, 103, 'Calculus Basics', '2025-01-10', NULL, 'Not Returned'),
       (3, 104, 'Chemistry Lab Manual', '2025-01-12', NULL, 'Not Returned');

INSERT INTO faculty (faculty_id, faculty_name, subject, phone_number, hire_date)
VALUES (1, 'Dr. Smith', 'Physics', '1234567890', '2015-06-01'),
       (2, 'Prof. Johnson', 'Mathematics', '0987654321', '2017-03-15'),
       (3, 'Dr. Williams', 'Chemistry', '9876543210', '2020-01-20');

INSERT INTO events (event_id, event_name, event_date, location, coordinator_id)
VALUES (1, 'Science Exhibition', '2025-02-15', 'Auditorium', 1),
       (2, 'Annual Day', '2025-03-01', 'Main Hall', 2),
       (3, 'Cultural Fest', '2025-04-10', 'Open Ground', 3);

INSERT INTO hostel (room_id, stdid, room_number, bed_number, check_in, check_out)
VALUES (1, 102, 'A101', 1, '2025-01-05', NULL),
       (2, 103, 'A102', 2, '2025-01-08', NULL),
       (3, 104, 'B201', 1, '2025-01-10', '2025-01-20');

INSERT INTO placements (placement_id, stdid, company_name, offer_date, status)
VALUES (1, 102, 'TechCorp', '2025-02-01', 'Accepted'),
       (2, 103, 'Innovate Inc', '2025-02-05', 'Pending'),
       (3, 104, 'StartUp Hub', '2025-02-10', 'Rejected');

ALTER TABLE library ADD author VARCHAR(100);

UPDATE library
SET author = 'Dr. Charles', book_title = CONCAT(book_title, ' by Dr. Charles')
WHERE record_id = 1;

ALTER TABLE faculty ADD email VARCHAR(100);

ALTER TABLE students 
DROP COLUMN stdemail;

UPDATE students 
SET stdemail = 'archana@gmail.com'
WHERE stdid = 103;


ALTER TABLE students 
RENAME COLUMN stdname TO stdfirstname;


ALTER TABLE events 
ADD duration_hours INT;

UPDATE events
SET duration_hours = 5
WHERE event_id = 1;

ALTER TABLE attendance
MODIFY COLUMN date DATETIME;

ALTER TABLE placements
MODIFY COLUMN company_name VARCHAR(150);

SET SQL_SAFE_UPDATES = 0;





SELECT students.stdid, students.stdfirstname, students.stdlastname, fees.fee_due_date, fees.fee_paid_date, fees.status AS fee_status
FROM students
INNER JOIN fees
ON students.stdid = fees.stdid;








