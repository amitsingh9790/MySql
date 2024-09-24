Create database DB;
use db;
-- Foreign Key
CREATE TABLE STUDENT (rollno INT PRIMARY KEY AUTO_INCREMENT , name VARCHAR(50), state VARCHAR(40)) ;
INSERT INTO Student VALUES(1, 'Sachin', 'mumbai');
INSERT INTO Student(name, state) VALUES('virat', 'banglore'), ('Dhoni', 'Chennai'), ('dhawan', 'punjab');
CREATE TABLE Course (course_id INT PRIMARY KEY AUTO_INCREMENT , course_name VARCHAR(50), rollno INT,
FOREIGN KEY(rollno) REFERENCES Student(rollno)) ;
INSERT INTO Course VALUES (101, 'java', 1) ;
INSERT INTO Course (course_name, rollno) VALUES ( 'python', 2) ;
INSERT INTO Course (course_name, rollno) VALUES ( 'c++', 3) ;
INSERT INTO Course (course_name, rollno) VALUES ( 'c++', 5) ;  -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails
-- * if rollno is not present in parent table i.e., Student table then we cannot add it in to Child Table

Delete from student where rollno = 1; -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
-- * If perticular rollno is present in Child then we cannot delete it from parent

INSERT INTO Student(name,state) values ('rohit','mumbai');
INSERT INTO Course(course_name,rollno) values('c',3);

Select student.name,course.course_name from student Inner Join course on student.rollno = course.rollno;

update student set rollno = 10 where rollno = 3; -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
-- * we cannot update in parent or child table data if that roll no is present in both
update student set name = 'Arun'
where rollno = 1; -- can update other data except primary key

drop table course;
-- Solution Of the above Problem: ON UPDATE CASCADE or ON DELETE CASCADE
CREATE TABLE Course (course_id INT primary key auto_increment, course_name varchar(50), rollno int,
foreign key(rollno) references Student(rollno)
ON DELETE CASCADE
ON UPDATE CASCADE
);

update student set rollno = 12
where rollno=3; -- * This will update in both the table and same with Delete
delete from student where rollno = 1; -- This will delete from both table
delete from course where rollno = 2; --  This will delete from Course table only

CREATE TABLE Course (course_id INT PRIMARY KEY AUTO_INCREMENT , course_name VARCHAR(50), rollno INT,
FOREIGN KEY(rollno) REFERENCES Student(rollno)
ON DELETE SET NULL --  this will set null value at that roll no and rest remain same, on delete the entire row
ON UPDATE SET NULL) ;

select * from course;
