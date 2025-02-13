CREATE DATABASE degreecollege;
SHOW DATABASES;

DROP DATABASE degreecollege;
SHOW DATABASES;

CREATE DATABASE degreecollege;

USE degreecollege;
    CREATE TABLE students (
    stdid INT PRIMARY KEY,
    stdname VARCHAR(100),
    stdlastname VARCHAR(100),
	stdphone VARCHAR(15),
    stdclass VARCHAR(20)
);

CREATE TABLE fees (
    fee_id INT PRIMARY KEY,
    stdid INT,
    fee_due_date DATE,
    fee_paid_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    stdid INT,
    program_name VARCHAR(100),
    application_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    stdid INT,
    date DATE,
    status VARCHAR(10),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);

CREATE TABLE library (
    record_id INT PRIMARY KEY,
    stdid INT,
    book_title VARCHAR(200),
    borrow_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (stdid) REFERENCES students(stdid)
);

SELECT * FROM students;

INSERT INTO students(stdid, stdname, stdlastname, stdphone, stdclass)
    VALUES(102, 'yasaswini', 'archana', 234569090, '2'),
          (103, 'thanu', 'yashu', 345678, '3'),
          (104, 'yat', 'yash', 345678, '4'),
          (105, 'than', 'ya', 345678, '5');

INSERT INTO fees(fee_id, stdid,  fee_due_date, fee_paid_date, status)
    VALUES(1, 102,  '2025-01-15', '2025-01-10', 'Paid'),
          (2, 103,  '2025-01-15', '2025-01-14', 'Paid'),
          (3, 104,  '2025-01-15', NULL, 'Unpaid'),
          (4, 105,  '2025-01-15', NULL, 'Unpaid');

INSERT INTO applications(application_id, stdid, program_name, application_date, status)
    VALUES(1, 102, 'Science Fair', '2025-01-10', 'Approved'),
          (2, 103, 'Technology Workshop', '2025-01-12', 'Pending'),
          (3, 104, 'Sports Meet', '2025-01-15', 'Approved'),
          (4, 105, 'Cultural Event', '2025-01-17', 'Rejected');

INSERT INTO attendance(attendance_id, stdid, date, status)
    VALUES(1, 102, '2025-01-10', 'Present'),
          (2, 103, '2025-01-10', 'Absent'),
          (3, 104, '2025-01-10', 'Present'),
          (4, 105, '2025-01-10', 'Present');

INSERT INTO library(record_id, stdid, book_title, borrow_date, return_date, status)
    VALUES(1, 102, 'Physics 101', '2025-01-05', '2025-01-15', 'Returned'),
          (2, 103, 'Calculus for Beginners', '2025-01-08', NULL, 'Not Returned'),
          (3, 104, 'Chemistry Lab Manual', '2025-01-10', NULL, 'Not Returned'),
          (4, 105, 'History of India', '2025-01-12', '2025-01-20', 'Returned');

SELECT * FROM students;

UPDATE students 
SET stdphone = 56789
WHERE stdid = 102;

UPDATE students 
SET 
    stdname = 'satya',
    stdphone = 1234567
WHERE stdid = 105;

ALTER TABLE students 
ADD stdemail VARCHAR(255);

ALTER TABLE students 
DROP COLUMN stdemail;

UPDATE students 
SET stdemail = 'archana@gmail.com'
WHERE stdid = 103;

ALTER TABLE students 
RENAME COLUMN stdname TO stdfirstname;

ALTER TABLE students 
MODIFY COLUMN stdclass VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM students 
WHERE stdid IN (104, 105);


