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

INSERT INTO employee1 VALUES(111,"Nikita","Mumbai",67000,1),
(112,"Prajakta","Pune",80000,1),
(113,"Manisha","Banglore",20000,2),
(114,"Nilesh","Mumbai",35469,3),
(115,"Monal","Pune",34452,2);

SELECT * FROM employee1;

-- SELECT col_name1,.... from table_name;

USE xyz_company;


SELECT e_id FROM employee1;
SELECT ename,salary FROM employee1;
SELECT d_id FROM department1;