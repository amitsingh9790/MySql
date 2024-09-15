create Database if not exists ANP;
-- primary key is a unique key ,it is not null also
-- -- suppose you are not giving any primary key while inserting data so it will automatically insert a key form its
create table student( sutdentId int primary key, studentName varchar(25) , studentMarks int);
CREATE TABLE Employee (
  id INT PRIMARY KEY, 
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  pinocode INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);


INSERT INTO Employee (id, name, city, state, pinocode, department, salary)
VALUES
  (1, 'Rahul Sharma', 'New Delhi', 'Delhi', 110001, 'IT', 50000.00),
  (2, 'Priya Patel', 'Mumbai', 'Maharashtra', 400001, 'HR', 60000.00),
  (3, 'Rajesh Kumar', 'Bangalore', 'Karnataka', 560001, 'Sales', 70000.00),
  (4, 'Sonia Singh', 'Chennai', 'Tamil Nadu', 600001, 'Marketing', 55000.00),
  (5, 'Amit Jain', 'Hyderabad', 'Telangana', 500001, 'Finance', 65000.00),
  (6, 'Neha Gupta', 'Kolkata', 'West Bengal', 700001, 'Operations', 58000.00),
  (7, 'Vikram Singh', 'Pune', 'Maharashtra', 411001, 'IT', 52000.00),
  (8, 'Riya Patel', 'Ahmedabad', 'Gujarat', 380001, 'HR', 62000.00),
  (9, 'Sachin Kumar', 'Jaipur', 'Rajasthan', 302001, 'Sales', 68000.00),
  (10, 'Tanvi Jain', 'Lucknow', 'Uttar Pradesh', 226001, 'Marketing', 57000.00),
  (11, 'Aman Sharma', 'Noida', 'Uttar Pradesh', 201301, 'Finance', 63000.00),
  (12, 'Isha Singh', 'Gurgaon', 'Haryana', 122001, 'Operations', 59000.00),
  (13, 'Rohan Patel', 'Surat', 'Gujarat', 395001, 'IT', 51000.00),
  (14, 'Sneha Gupta', 'Vadodara', 'Gujarat', 390001, 'HR', 61000.00),
  (15, 'Kunal Kumar', 'Indore', 'Madhya Pradesh', 452001, 'Sales', 66000.00),
  (16, 'Rashmi Jain', 'Bhopal', 'Madhya Pradesh', 462001, 'Marketing', 58000.00),
  (17, 'Akhil Sharma', 'Chandigarh', 'Chandigarh', 160001, 'Finance', 64000.00),
  (18, 'Nisha Singh', 'Ludhiana', 'Punjab', 141001, 'Operations', 60000.00),
  (19, 'Rahul Patel', 'Nagpur', 'Maharashtra', 440001, 'IT', 53000.00),
  (20, 'Sonal Gupta', 'Kanpur', 'Uttar Pradesh', 208001, 'HR', 62000.00),
  (21, 'Vivek Kumar', 'Varanasi', 'Uttar Pradesh', 221001, 'Sales', 67000.00),
  (22, 'Tanmay Jain', 'Allahabad', 'Uttar Pradesh', 211001, 'Marketing', 59000.00),
  (23, 'Amit Singh', 'Ranchi', 'Jharkhand', 834001, 'Finance', 65000.00),
  (24, 'Neha Patel', 'Patna', 'Bihar', 800001, 'Operations', 61000.00),
  (25, 'Rohan Gupta', 'Raipur', 'Chhattisgarh', 492001, 'IT', 54000.00),
  (26, 'Sneha Kumar', 'Bhubaneswar', 'Odisha', 751001, 'HR', 63000.00),
  (27, 'Kunal Jain', 'Guwahati', 'Assam', 781001, 'Sales', 68000.00),
  (28, 'Rashmi Singh', 'Imphal', 'Manipur', 795001, 'Marketing', 60000.00),
  (29, 'Akhil Patel', 'Shillong', 'Meghalaya', 793001, 'Finance', 66000.00),
  (30, 'Nisha Gupta', 'Aizawl', 'Mizoram', 796001, 'Operations', 62000.00) ;
  
  select * from Employee;
  select * from Employee order by salary desc limit 1 offset 1;
  select distinct(state) from Employee;
  -- select -- max(salary),state from Employee group by state;
  select state, sum(salary) as TotalSalary from employee group by state having sum(salary) > 150000;
  -- please select that data whose state's total salary is greater than x amount
  select * from Employee where department != "it"; 
  select * from employee where state = "Maharashtra" or city in ("new delhi","noida");
  
  -- name start with a
  -- select * from Employee where name like 'a%' 
  
  -- name start with a and end with a
  -- select * from Employee where name like 'a%a'; 
  
  -- name sh bich me ho
 --  select * from Employee where name like '%sh%';
 
 -- second charactor start with a
-- select * from Employee where name like '_a%';



