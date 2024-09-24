-- Student
-- ● Attributes: StudentID (Primary Key) FirstName LastName DateOfBirth Gender Email Phone
-- ● Relationships: One Student can enroll in more than one Course (One-to-Many) Course

-- Course
-- ● Attributes: CourseID (Primary Key) CourseTitle Credits
-- ● Relationships: Many Course is taught by one Instructor (Many-to-One)

-- Instructor
-- ● Attributes: InstructorID (Primary Key) FirstName LastName Email
-- ● Relationships: One Instructor teaches many Courses (One-to-Many) One Instructor has 
-- many Students (One-to-Many) Enrollment

-- Enrollment
-- ● Attributes: EnrollmentID (Primary Key) EnrollmentDate StudentID(Foreign key) 
-- CourseID(Foreign Key) InstructorID(Foreign key)
-- ● Relationships: One Student maps to Many Enrolment ids (One-to-Many) Many Enrolment 
-- ids map to one Course (Many-to-One)

-- Score
-- ● Attributes: ScoreID (Primary Key) CourseID (Foreign key) StudentID (Foreign Key) 
-- DateOfExam CreditObtained
-- ● Relationships: Many ScoreIDs will map to one Student (Many-to-one) Many ScoresIDs 
-- will map to one Course (Many-to-one)

-- Feedback
-- ● Attributes: FeedbackID (Primary Key) StudentID (Foreign key) Date InstructorName
-- Feedback
-- ● Relationships: One Student will maps to Many Feedbacks (One-to-Many)

create database if not exists University;
use University;
CREATE TABLE Student ( StudentID VARCHAR(10) PRIMARY KEY, FirstName VARCHAR(25)
NOT NULL, LastName VARCHAR(25) NOT NULL,
DateOfBirth Date NOT NULL, Gender VARCHAR(25) NOT NULL, Email VARCHAR(30) UNIQUE
NOT NULL, Phone VARCHAR(25) NOT NULL );

drop table student;
INSERT INTO Student (StudentID, FirstName,LastName, DateOfBirth, Gender, Email,Phone)
VALUES
('S101','John', 'Doe','2000-10-10','M', 'john@example.com','9878457945'),
('S102','Jane', 'Smith','2013-08-08','M', 'jane@example.com','9977457745'),
('S103','Alice', 'Johnson','2011-09-08','F', 'alice@example.com','9876457845'),
('S104','Jim', 'Doe','2011-07-08','F', 'jim.doe@india.com','9876457845'),
('S105','Peter', 'Parker','2011-06-05','F', 'p_parker@example.com','9876457845') ;
SELECT * FROM Student ;

CREATE TABLE Course ( CourseID VARCHAR(10) PRIMARY KEY, CourseTitle
VARCHAR(30) NOT NULL, Credits INT NOT NULL );
DESC Course;
INSERT INTO Course (CourseID,CourseTitle,Credits) VALUES
('C101','Math101',12), ('C102','History101',13), ('C103','Computer
Science101',11);
SELECT * FROM Course;

CREATE TABLE Instructor ( InstructorID VARCHAR(10) PRIMARY KEY, Email
VARCHAR(30) UNIQUE NOT NULL, FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) );
DESC Instructor;
INSERT INTO Instructor
(InstructorID ,Email,FirstName,LastName) VALUES
('I101','sunil@example.com','Sunil','Rawat'),
('I102','nida@example.com','Nida','Fatima'),
('I103','shiv@example.com','Shiv','Kumar');
SELECT * FROM Instructor;

 CREATE TABLE Enrollment ( EnrollmentID VARCHAR(10) PRIMARY KEY,
StudentID VARCHAR(10) NOT NULL, CourseID VARCHAR(10) NOT NULL,
InstructorID VARCHAR(10) NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) );
desc Enrollment;
INSERT INTO Enrollment (EnrollmentID,StudentID, CourseID,InstructorID)
VALUES ('E1001','S101','C101','I101'), ('E1002','S102','C101', 'I101'),
('E1003','S103','C102','I102');
SELECT * FROM Enrollment;

Create TABLE Score( ScoreID VARCHAR(10) PRIMARY KEY, StudentID 
VARCHAR(10) NOT NULL, CourseID VARCHAR(10) NOT NULL, 
FOREIGN KEY (StudentID) REFERENCES Student(StudentID), 
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
CreditObtained VARCHAR(10) NOT NULL, 
DateOfExam DateTime NOT NULL );
DESC Score;
INSERT INTO Score
(ScoreID,StudentID,CourseID,CreditObtained,DateOfExam)VALUES
('SC101','S101','C101','12','2022-10-10'), 
('SC102','S102','C101','10','2022-10-10'), 
('SC103','S104','C102',11,'2023-09-10');
SELECT * FROM Score;

CREATE TABLE Feedback ( FeedbackID VARCHAR(10) primary key, StudentID VARCHAR(10) ,
 Date_ date, InstructorName varchar(25), Feedback varchar(25),
foreign key(StudentID) references Student(StudentID) );
DESC Feedback;
INSERT INTO Feedback
(FeedbackID,StudentID,Date_,InstructorName,Feedback)VALUES
('FC101','S101','2022-10-10','Arun Kumar Sharma','Nice Teacher'), 
('FC102','S102','2022-10-10','Ajay Kumar Singh','Good Teacher'), 
('FC103','S104','2023-09-10','Alok Singh','Moderate');
SELECT * FROM Feedback;

-- Type of JOIN
CREATE TABLE Customer (customer_id INT, name VARCHAR(50), Address VARCHAR(50)) ;
INSERT INTO Customer VALUES
(101, 'saurabh', 'abc'),
(102, 'anil', 'def'),
(103, 'aparana', 'xyz');
SELECT * FROM Customer ;
CREATE TABLE Payment (payment_id INT, customer_id INT, amount VARCHAR(50),
modeofpayment VARCHAR(50)) ;
INSERT INTO Payment VALUES
(1, 101, '5000', 'Debit Card'),
(1, 102, '3000', 'Credit Card');
INSERT INTO Payment VALUES
(5, 108, '1000', 'UPI'),
(6, 107, '2000', 'Cash');
SELECT * FROM Payment ;

SELECT * FROM Customer AS c
INNER JOIN Payment AS p
ON c.customer_id = p.customer_id ;
SELECT * FROM Customer AS c
LEFT JOIN Payment AS p
ON c.customer_id = p.customer_id ;
SELECT * FROM Customer AS c
RIGHT JOIN Payment AS p
ON c.customer_id = p.customer_id ;

CREATE TABLE EmployeeTable (emp_id INT PRIMARY KEY, name
VARCHAR(50), manager_id INT) ;
INSERT INTO EmployeeTable VALUES
(1,'munna', 2),
(2,'divya', 3),
(3,'ashish', 4),
(4,'anil', 4) ;
SELECT * FROM EmployeeTable ;
SELECT Table1.name AS EmpName, Table2.name AS ManagerName
FROM EmployeeTable As Table1
JOIN EmployeeTable AS Table2
ON Table1.manager_id = Table2.emp_id ;
