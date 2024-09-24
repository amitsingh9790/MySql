create database College;
use college;

-- create table student
-- (StudentID varchar(10), FirstName varchar(25) NOT NULL, LastName varchar(25) NOT NULL ,
-- -- DateOfBirth datetime NOT NULL, Gender varchar(25) NOT NULL, Email varchar(30) Not NULL,
-- -- Phone varchar(25) NOT NULL, primary key(StudentID));
-- drop table student;
desc student;

CREATE TABLE Test(first_name VARCHAR(20), last_name VARCHAR(20), age INT, email
VARCHAR(40) ,
state VARCHAR(20) , constraint primary_key PRIMARY KEY(age)) ;
DESC Test ;

INSERT INTO Test VALUES('Arun', 'Shamrma', 28, 'arunkumarkv29@gmail.com', 'Delhi') ;
INSERT INTO Test VALUES('sourav', 'kumar', 30, 'souravkumar@gmail.com', 'hyderabad') ;
INSERT INTO Test VALUES('Arun', 'kumar', 37, 'souravkumar@gmail.com', 'hyderabad') ;
INSERT INTO Test VALUES('Arun', 'Sharma', 24, 'souravkumar@gmail.com', 'hyderabad') ;
select * from Test;

alter table test
add primary key(age);
Alter table Test
drop primary key;

select first_name, last_name, age from test order by last_name ;

set SQL_SAFE_UPDATES = 0 ;
Update test
set first_name = "Amit" ,last_name = "Singh" where last_name="Sharma";

-- Aggreate Functions:
select count(*) from test where first_name= "Arun";
select sum(age) from test;
select avg(age) from test;
select max(age) from test;
select min(age) from test;
