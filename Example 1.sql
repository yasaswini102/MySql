create database degreecollege;

show databases;

drop database degreecollege;

show databases;

create database degreecollege;
USE `degreecollege`;

create table students(stdid int primary key,
					 stdfirstname varchar(100),
                     stdlastname varchar(100),
                     stdphone integer,
                     stdclass varchar(20));
select * from students;

insert into students(stdid, stdfirstname, stdlastname, stdphone, stdclass)
		values(102, 'yasaswini', 'archana', 234569090, 2),
               (103, 'thanu', 'yashu', 345678, 3),
                (104, 'yat', 'yash', 345678, 4),
                (105, 'than', 'ya', 345678, 5);

update students set stdphone = 56789
WHERE stdid = 102;

UPDATE students
SET
stdfirstname = 'satya',
stdphone = 1234567
WHERE stdid = 105;

ALTER TABLE students
ADD stdemail varchar(255);

ALTER TABLE  students
DROP COLUMN stdemail;

UPDATE students
SET
stdemail = 'archana@gmail.com'
WHERE stdid = 103;

ALTER TABLE students 
RENAME COLUMN stdfirstname to stdname;

ALTER TABLE students 
MODIFY COLUMN stdclass int;

SET SQL_SAFE_UPDATES =0;

delete from students where stdid in(104,105);








