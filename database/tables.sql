CREATE DATABASE homework;
USE homework;

CREATE TABLE bookmyshow(
 Location VARCHAR(60),
 Show_name VARCHAR(60),
 Movie_timing TIME,
 Seat_no INT
);

DESC bookmyshow;

CREATE TABLE instagram(
 username VARCHAR(60),
 Insta_password VARCHAR(60),
 total_post INT(100) 
);

DESC instagram;

CREATE TABLE Persons (
Person_ID int,
LastName varchar(60),
FirstName varchar(60),
Address varchar(250),
City varchar(25)
);

DESC persons;

Create TABLE employee(
employee_id INT,
employee_name VARCHAR(70),
employee_age INT
);

DESC employee;


CREATE TABLE course(
course_id INT,
course_name VARCHAR(50),
student_name VARCHAR(50),
student_fees INT
);

DESC course;

SHOW TABLES;