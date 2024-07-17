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

