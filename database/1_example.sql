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
