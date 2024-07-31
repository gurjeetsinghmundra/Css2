-- To create database
CREATE DATABASE guru;

-- to see all databases
SHOW DATABASES;

-- to use database (USE db_name)
USE guru;

-- To see tables
SHOW TABLES;

-- To delete database (Drop Database db_name)
DROP DATABASE guru;

-- To Create table

CREATE TABLE employee(
 employee_id INT,
 first_name VARCHAR(60),
 last_name VARCHAR(60)
); 


-- 2nd table

CREATE TABLE student(
roll_no INT,
student_name VARCHAR(60),
age INT,
birth_date DATE
);


--  show info of table

DESC student;

-- To add column to existing table
-- Alter Table <table-name> ADD COLUMN <column-name> <data-type>

ALTER TABLE student ADD COLUMN address VARCHAR(60);

-- Alter Table <table-name> ADD COLUMN <column-name> <data-type> AFTER <existing_col_name>

ALTER TABLE student ADD COLUMN contact_number INT AFTER age;

-- Alter Table <table-name> ADD COLUMN <column-name> <data-type> FIRST <existing_col_name>

ALTER TABLE student ADD COLUMN college_name VARCHAR(50) FIRST; 

-- ALTER TABLE <table-name> DROP COLUMN <column-name>;

ALTER TABLE student DROP COLUMN contact_number;

DESC student;

DROP TABLE student;

Create Table library(
	library_name VARCHAR(50),
    library_id INT,
	teacher_name VARCHAR(60)
);


-- To rename column along with datatype
ALTER TABLE library CHANGE library_id l_id CHAR(4);

DESC library;

-- To rename table 
ALTER TABLE library RENAME TO college_library;

SHOW TABLES;
 

DESC college_library;

CREATE DATABASE xyz_company;

USE xyz_company;

CREATE TABLE department(
department_id CHAR(2),
department_name VARCHAR(50)
);

SHOW TABLES;

DESC department;

-- INSERT INTO <table-name> VALUES (v1,v2,v3....)

INSERT INTO department VALUES ("D1","IT");

SELECT * FROM department;

INSERT INTO department (department_id) VALUES ("D2");

INSERT INTO department VALUES ("D3","CS");

INSERT INTO department (department_name,department_id) VALUES ("AI","D4");

Create TABLE employee(
employee_id INT,
employee_name VARCHAR(70),
employee_age INT
);

DESC employee;

INSERT INTO employee VALUES ("1","ABC","18");
INSERT INTO employee (employee_id,employee_name) VALUES ("2","PQR");
INSERT INTO employee VALUES ("3","XYZ","21");

SELECT * FROM employee;

INSERT INTO employee VALUES
(4,"MNO",28),
(5,"EFG",24),
(6,"IJK",30);

INSERT INTO employee (employee_id,employee_name) VALUES
(7,"STU"),
(8,"WXY");

CREATE TABLE course(
course_id INT,
course_name VARCHAR(50),
student_name VARCHAR(50),
student_fees INT
);

INSERT INTO course VALUES 
(1,"Java FSD","Guru",148000),
(2,"Python FSD","Amit",148000),
(3,"Java FSD","Joel",150000),
(4,"Python FSD","Shriya",122000),
(5,"Java FSD","Rayyan",115000),
(6,"Java FSD","Netrali",148000);

SELECT * FROM course;

INSERT INTO course (course_id,course_name,student_name) VALUES 
(7,"Python FSD","Hamza"),
(8,"Java FSD","Faizan");

DROP  TABLE department;

CREATE TABLE department(
department_id INT UNIQUE NOT NULL,
department_name VARCHAR(50) NOT NULL
);

SHOW TABLES;
DESC department;

INSERT INTO department VALUES(101,"GURU");
SELECT * FROM department;

INSERT INTO department VALUES(101,"xyz");
INSERT INTO department VALUES(102,null);


DROP TABLE employee;

CREATE TABLE employee(
employee_id CHAR(2) PRIMARY KEY,
employee_name VARCHAR(60) NOT NULL,
employee_email VARCHAR(60) UNIQUE NOT NULL
);

DESC employee;

-- To add Not null constraint
-- ALTER TABLE <table-name> MODIFY <col-name> <data-tyoe> NOT NULL;

-- TO remove not null constraint
-- Alter Table <table-name> MODIFY <col-name> <data-type>;

ALTER TABLE employee MODIFY employee_name VARCHAR(60); 

ALTER TABLE employee MODIFY employee_name VARCHAR(60) NOT NULL;

SHOW INDEXES FROM employee;

ALTER TABLE employee DROP INDEX employee_email;

ALTER TABLE employee ADD UNIQUE (employee_email);

ALTER TABLE employee DROP PRIMARY KEY;

DESC employee;




ALTER TABLE employee ADD PRIMARY KEY (employee_id);

ALTER TABLE employee ADD COLUMN employee_salary INT;
DESC employee;

ALTER TABLE employee ALTER employee_salary SET DEFAULT (40000);

SELECT * FROM employee;

DESC employee;
INSERT INTO employee (employee_id,employee_name,employee_email) VALUES 
("E2","Guru","g@gmail.com");


ALTER TABLE employee ALTER employee_salary DROP DEFAULT;

INSERT INTO employee VALUES 
("E3","G","g1@gmail.com",30000);

-- ALTER TABLE <table-name> ADD CONSTRAINT <constraint_name> CHECK (condition);
ALTER TABLE employee ADD CONSTRAINT check_salary CHECK (employee_salary>=0);
INSERT INTO employee VALUES 
("E4","G1","g2@gmail.com",10000);


-- ALTER TABLE <table-name> DROP CONSTRAINT check_salary;

ALTER TABLE employee DROP CONSTRAINT check_salary;


CREATE TABLE category(
c_id INT PRIMARY KEY,
name VARCHAR(60)
);

ALTER TABLE category MODIFY name VARCHAR(50) NOT NULL;

DESC category;


CREATE TABLE product( 
p_id INT PRIMARY KEY,
p_name VARCHAR(60) NOT NULL,
p_price INT DEFAULT 0 CHECK (p_price>=0),
c_id INT,
CONSTRAINT product_category FOREIGN KEY (c_id)
REFERENCES category(c_id)
);

DESC product;

INSERT INTO category VALUES (1,"Guru");
INSERT INTO category VALUES (2,"Electronics");

SELECT * FROM category;

INSERT INTO product VALUES(2,"Laptop",50000,2);

SELECT * FROM product;

DESC category;



CREATE TABLE school(
s_id INT PRIMARY KEY,
s_name VARCHAR(60) NOT NULL
);

DESC school;

CREATE TABLE student(
roll_no INT PRIMARY KEY,
st_name VARCHAR(60) NOT NULL,
Phone_no BIGINT,
s_id INT,
CONSTRAINT student_school FOREIGN KEY(s_id)
REFERENCES school(s_id)
);

DESC student;

INSERT INTO school VALUES(1,"Holy Cross High School"),
(2,"Khalsa");

SELECT * FROM school;

INSERT INTO student VALUES(111,"Gurjeet",348973247,1),
(222,"Guru",73247,2);


DROP TABLE school;
DROP TABLE student;


CREATE TABLE courses (
c_id INT PRIMARY KEY,
c_name VARCHAR(60) NOT NULL
);

CREATE TABLE teacher(
t_id INT PRIMARY KEY,
t_name VARCHAR(60),
t_num BIGINT,
c_id INT,
CONSTRAINT teacher_course FOREIGN KEY(c_id)
REFERENCES courses(c_id)
);

DROP TABLE teacher;

DESC courses;
DESC teacher;

-- Product & Category




-- Drop foreign key throught alter

ALTER TABLE product DROP FOREIGN KEY product_category;

DESC product;
INSERT INTO product VALUES(120,"tshirt",520,100);

SELECT * FROM product;

INSERT INTO category values(100,"Clothes");


-- Add foreign key throught alter

ALTER TABLE product ADD CONSTRAINT product_category
FOREIGN KEY (c_id) REFERENCES category(c_id);

USE xyz_company;

INSERT INTO product VALUES(130,"pants",600,100);

SELECT * FROM product;
DESC product;

--
select(100>45);
select(100<45); 
select(100=100);
select(100!=100);
select(500<=200);
select(60<=100);

-- and (ALL statements shoukd be true)

select(100=100 and 10=5 and 5<10);
select not(100=100 and 10>=5 and 7<10);

-- or (Atleast 1 statement need to be true)

select(100<200 or 200<=100);
select(100<200 or 500=500);
select not(200<1 or 1>=100);

-- like , between , In(in shortcut of or)

-- 

CREATE TABLE department1(
d_id INT PRIMARY KEY,
department VARCHAR(60) NOT NULL
);

CREATE TABLE employee1(
e_id INT PRIMARY KEY,
ename VARCHAR(60),
city VARCHAR(60),
salary BIGINT,
d_id INT,
CONSTRAINT employee_department FOREIGN KEY(d_id)
REFERENCES department1(d_id)
);

DESC department1;
DESC employee1;


INSERT INTO department1 VALUES(1,"Marketing"),
(2,"IT"),
(3,"Human Resource");

SELECT * FROM department1;

INSERT INTO employee1 VALUES(111,"Nikita","Mumbai",67000,1,23),
(112,"Prajakta","Pune",80000,1,25),
(113,"Manisha","Banglore",20000,2,29),
(114,"Nilesh","Mumbai",35469,3,22),
(115,"Monal","Pune",34452,2,20);

SELECT * FROM employee1;

-- SELECT col_name1,.... from table_name;

USE xyz_company;


SELECT e_id FROM employee1;
SELECT ename,salary AS emp_salary FROM employee1;
SELECT d_id FROM department1;

-- AS(Alias) is used to change column name temporarily

SELECT (10>7) AS answer;

-- ------------------------------------------------------------------------------------------------------------------
-- WHERE Clause 

SELECT * FROM employee1 WHERE e_id="111";

SELECT ename,salary FROM employee1 WHERE e_id="111";

SELECT d_id FROM employee1 WHERE e_id="111";

SELECT * FROM employee1 WHERE city="mumbai";

SELECT * FROM employee1 WHERE salary<50000;

SELECT * FROM employee1 WHERE salary<50000 AND city="mumbai";

SELECT * FROM employee1 WHERE city="mumbai" OR city="banglore";

SELECT * FROM employee1 WHERE salary between 10000 and 50000;

SELECT * FROM employee1 WHERE salary>=10000 and salary<=70000;

SELECT * FROM employee1 WHERE d_id="1" and salary<=20000;

SELECT * FROM employee1 WHERE d_id="1" and city="pune";

SELECT * FROM employee1 WHERE e_id="111" OR e_id="112" OR e_id="113";
SELECT * FROM employee1 WHERE e_id IN(111,112,113);

SELECT * FROM employee1 WHERE city IN("mumbai","pune","banglore");

-- BETWEEN 
SELECT * FROM employee1 WHERE salary BETWEEN 20000 AND 50000;


ALTER TABLE employee1 ADD COLUMN age INT;
DESC employee1;

SELECT * FROM employee1;

UPDATE employee1 set age=0;
UPDATE employee1 set age=25 WHERE e_id="111";
UPDATE employee1 set age=30 WHERE e_id="112";
UPDATE employee1 set age=27 WHERE e_id="113";
UPDATE employee1 set age=22 WHERE e_id="114" OR e_id="115";

UPDATE employee1 set city="Pune" WHERE e_id="111";
UPDATE employee1 set city="Mumbai" WHERE e_id="112";

UPDATE employee1 set salary=salary+5000 WHERE e_id="115";

UPDATE employee1 set age=age+2;

UPDATE employee1 set salary=salary-2000 WHERE d_id="1";


UPDATE employee1 set city=null WHERE e_id IN(111,113);

-- IS
SELECT * FROM employee1 WHERE city IS NULL;
SELECT * FROM employee1 WHERE city IS NOT NULL;


SELECT * FROM employee1;

SELECT * FROM employee1 WHERE e_id IN(112,113,114,115);
SELECT * FROM employee1 WHERE e_id!=111;
SELECT * FROM employee1 WHERE ename!="nikita";

use xyz_company;

-- LIKE

SELECT * FROM employee1 WHERE ename LIKE "n%";
SELECT * FROM employee1 WHERE ename LIKE "n%a";
SELECT * FROM employee1 WHERE ename LIKE "m_n%";
SELECT * FROM employee1 WHERE ename LIKE "m_n_s%";
SELECT * FROM employee1 WHERE ename NOT LIKE "m_n%";
SELECT * FROM employee1 WHERE ename LIKE "%n%";
SELECT * FROM employee1 WHERE ename NOT LIKE "m%";
SELECT * FROM employee1 WHERE ename LIKE "%ta";
SELECT ename FROM employee1 WHERE city LIKE "m%" AND ename LIKE "p%";
SELECT * FROM employee1 WHERE ename LIKE "%t_";

-- DELETE FROM <table-name> WHERE condition;

DELETE FROM employee1 WHERE e_id="114";
DELETE FROM employee1 WHERE d_id="1" AND age<30;
DELETE FROM employee1 WHERE ename LIKE "%l";
DELETE FROM employee1;

-- truncate and delete will delete  records in tables and drop will  delete table.
-- delete is mostly used with where clause

TRUNCATE TABLE employee1;
SELECT * FROM employee1;

-- Aggregate functions
-- function is build-in logic (joh phele se he bana hai)-- 

-- sum
-- count
-- min
-- max
-- avg   12+12+10/3

SELECT COUNT(*) AS no_of_employees FROM employee1; 
SELECT * FROM employee1;
SELECT COUNT(*) AS no_of_departments FROM department1;

-- DISTINCT will not show repeated values
SELECT DISTINCT city FROM employee1;
SELECT * FROM department1;

INSERT INTO employee1 VALUES(116,"Guru",null,90000,1,20);

SELECT COUNT(DISTINCT city) FROM employee1;

SELECT COUNT(DISTINCT d_id) FROM employee1;

-- min & max
SELECT MIN(salary) FROM employee1;
SELECT MIN(age) FROM employee1;

SELECT MAX(salary) FROM employee1;

-- sum
SELECT SUM(salary) FROM employee1;
SELECT SUM(salary*12) FROM employee1;

SELECT SUM(salary)*12 FROM employee1; 

-- avg

SELECT AVG(salary) FROM employee1;
SELECT AVG(age) FROM employee1;

-- order by (ASC by default & DESC)
SELECT * FROM employee1 ORDER BY salary;
SELECT * FROM employee1 ORDER BY salary DESC;

SELECT * FROM employee1 ORDER BY age;
SELECT * FROM employee1 ORDER BY age DESC;

SELECT * FROM employee1 ORDER BY ename;

UPDATE employee1 set salary=80000 WHERE e_id="111";


SELECT * FROM employee1;

SELECT * FROM employee1 ORDER BY salary DESC,age DESC;

use xyz_company;
-- 

SELECT * FROM employee1 ORDER BY salary LIMIT 1;
SELECT * FROM employee1 ORDER BY salary DESC,age DESC LIMIT 3;
SELECT * FROM employee1 ORDER BY age LIMIT 1;
SELECT * FROM employee1 ORDER BY age DESC LIMIT 1;

-- Group BY

SELECT d_id,count(e_id) FROM employee1
GROUP BY d_id;

SELECT city,count(e_id) FROM employee1
GROUP BY city;

SELECT city,sum(salary),avg(salary),min(salary),max(salary),count(e_id)
FROM employee1 GROUP BY city;

SELECT d_id,
sum(salary) AS total_salary,
avg(salary) AS avg_salary,
min(salary) AS min_salary,
max(salary) AS max_salary,
count(e_id) AS Total_count
FROM employee1
GROUP BY d_id;

SELECT * FROM employee1;

-- add column
ALTER TABLE employee1 ADD COLUMN gender VARCHAR(60);

-- add or update values in column
UPDATE employee1 set gender="F";
UPDATE employee1 set gender=null WHERE e_id="113" ;
UPDATE employee1 set gender="M" WHERE e_id="114" ;

SELECT gender,count(e_id) AS total_count FROM employee1 
GROUP BY gender;

-- you cant use WHERE clause after applying GROUP BY so instead we use HAVING
SELECT gender,count(e_id)
FROM employee1 GROUP BY gender HAVING gender="F";

-- kitne females ki salary means group by 

SELECT count(*) FROM employee1 WHERE salary<50000 AND gender="F";

SELECT gender ,count(e_id) FROM employee1  WHERE salary<50000 
GROUP BY gender HAVING gender="F";

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 WHERE salary<50000
GROUP BY d_id;

-- same

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id HAVING avg(salary)<50000 OR salary_avg<50000;

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id ORDER BY salary_avg LIMIT 1;

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id ORDER BY salary_avg DESC LIMIT 1;

SELECT d_id,count(e_id) AS total_emp
FROM employee1
GROUP BY d_id ORDER BY total_emp LIMIT 1;

SELECT d_id,sum(salary)
FROM employee1
GROUP BY d_id
ORDER BY sum(salary) LIMIT 1;


use xyz_company;

SELECT CONCAT ("Gurjeet","","Singh") AS name1;

SELECT * FROM employee1;

-- E1-Nikita
SELECT e_id,ename,concat(e_id,"-",ename) AS employee_details FROM employee1;

-- email e1.ename@itvedant.com

SELECT e_id,ename,concat(e_id,".",ename,"@itvedant.com") AS email FROM employee1;

-- UPPER("sql") SQL
-- used while taking input from user  

SELECT UPPER("sql");
SELECT LOWER("ABC");

INSERT INTO employee1 VALUES
("117","Ankita",LOWER("MUmbAi"),25900,1,26,UPPER("f"));

-- Length - Spaces are also included

SELECT LENGTH("  HELLO");
SELECT LENGTH("Nisha")>20;

SELECT ename,LENGTH(ename) FROM employee1;

-- H e l l o
-- 1 2 3 4 5
--                   starting point,how much characters you want to count  
SELECT substr("Hello",2,4);
SELECT substr("Hello",3,2);
SELECT substr("Hello",5,1);
SELECT substr("Gurjeet afsaf",LENGTH("Gurjeet afsaf"),1);

SELECT ename,substr(ename,Length(ename),1) AS last_char FROM employee1;


-- Flow will be length,substr,upper
SELECT ename,substr(UPPER(ename),Length(ename),1) AS last_char FROM employee1;

SELECT ename,concat(ename,"-",substr(UPPER(ename),Length(ename),1)) AS last_char FROM employee1;

SELECT ename,substr(lower(ename),1,1) FROM employee1;

SELECT ename,concat(substr(lower(ename),1,1),substr(Upper(ename),2,length(ename)-1)) AS change_letter FROM employee1;

--  2,4    2,3    2,5     2,5
--  Nikita Pooja Netrali Gurjeet 

SELECT ename,concat(substr(lower(ename),1,1),
substr(Upper(ename),2,length(ename)-2),
substr(lower(ename),length(ename),1))
AS change_alphabet FROM employee1;


-- mod(m,n)
-- mod means remainder

SELECT mod(71,3);
SELECT round(5.785,2);
SELECT CEIL(7.50);
SELECT FLOOR(12.75);
SELECT sqrt(17);

SELECT round(sqrt(17),4);

SELECT SIGN(-80);
SELECT SIGN(4);
SELECT SIGN(0);

SELECT TRUNCATE(5.6723478943,4);
SELECT ROUND(5.4729478943,3);

SELECT POW(5,3);

-- ----------------------------------------------------------------------------------------------------------

USE xyz_company;

SELECT round(AVG(salary)) AS avg_salary FROM employee1;

-- Date Related Functions
-- YYYY-MM-DD
SELECT curdate();
-- HH:MM:SS
SELECT curtime();
-- YYYY-MM-DD HH:MM:SS
SELECT NOW();

SELECT DATE("2024-10-10 07:25:20");
SELECT DATE(NOW());

SELECT DAY("2024-10-20");
SELECT YEAR("2024-10-20");

SELECT MONTH(curdate());

-- 
DESC employee1;
ALTER TABLE employee1 ADD COLUMN joining_date DATE;

SELECT * FROM employee1;

UPDATE employee1 SET joining_date="2023-04-02" WHERE e_id="111";
UPDATE employee1 SET joining_date="2024-01-24" WHERE e_id="112";
UPDATE employee1 SET joining_date="2021-05-17" WHERE e_id="113";
UPDATE employee1 SET joining_date="2024-01-30" WHERE e_id="114";
UPDATE employee1 SET joining_date="2020-12-15" WHERE e_id="115";
UPDATE employee1 SET joining_date="2022-10-10" WHERE e_id="117";

SELECT e_id,ename,joining_date,YEAR(joining_date) FROM employee1;


SELECT e_id,ename FROM employee1 WHERE YEAR(joining_date) IN ("2022","2023");

SELECT YEAR(joining_date)  AS joining_year,COUNT(e_id) AS totaL_emp
FROM employee1 GROUP BY YEAR(joining_date) HAVING joining_year=2024;

-- ---------------------------------------------------------------------

-- These Are placeholders
SELECT date_format("2024-11-21","%d-%m-%y");
SELECT date_format("2024-11-21","%d***%m-%y");

SELECT date_format("2024-11-21","%D-%M-%Y");

--  %w is a week number 0-sunday 1-momday 2-tues ....

SELECT date_format("2024-07-28","%D %M %Y %w");
SELECT date_format("2024-07-28","%D %M %Y %W");
SELECT date_format(now(),"%D %M %Y %H::%i::%s");

SELECT date_format(now(),"%D %b %Y %H::%i::%s");
SELECT date_format("2024-07-28","%D %M %Y %W");

-- if first condition is true it doesnt check next condition but if it's false then it goes to next condition

USE xyz_company;
SELECT * FROM employee1;

SELECT ename,salary,
CASE
	WHEN salary<30000 THEN "Very Less"
	WHEN salary<60000 THEN "Average"
    WHEN salary<100000 THEN "Very High"
    ELSE"-"
END AS salary_data
FROM employee1;

SELECT * FROM department1;

SELECT ename,
CASE
	WHEN d_id=1 THEN "Marketing"
	WHEN d_id=2 THEN "IT"
    WHEN d_id=3 THEN "Human Resource"
    ELSE"-"
END AS department_details
FROM employee1;

