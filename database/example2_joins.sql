
USE xyz_company;
CREATE DATABASE demo;
USE demo;
CREATE TABLE department(
d_id CHAR (20) PRIMARY KEY,
department VARCHAR (100) NOT NULL
);


CREATE TABLE employee (
e_id CHAR(20) PRIMARY KEY,
ename VARCHAR (20) NOT NULL,
city varchar (30),
salary int,
department char (20),
CONSTRAINT EMPLOYEE_DEPARTMENT FOREIGN KEY (department)
REFERENCES department (d_id)
);


INSERT INTO department VALUES ("D1","MARKETING"),
("D2","IT"),
("D3","human resources");
select * from  department;

INSERT INTO employee VALUES 
("E1","nikita","mumbai",67000,"D1"),
("E2","prajakta","pune",80000,"D1"),
("E3","manisha","banglore",20000,"D2"),
("E4","nilesh","mumbai",35400,"D3"),
("E5","monal","pune",34452,"D2");



SELECT * FROM employee;
-- select col_name1,..... from table_name;
SELECT e_id FROM employee;

SELECT ename,salary AS emp_salary  FROM employee;

DESC employee;

SELECT derpartment FROM department;

SELECT (10>7) AS answer;
-- -------------------------------------------------------------------------
-- WHERE Clause
SELECT * FROM employee WHERE e_id="E1";
SELECT ename,salary FROM employee WHERE e_id="E1";
SELECT department FROM employee WHERE e_id="E1";

SELECT * FROM employee WHERE city="Mumbai";

SELECT * FROM employee ;
SELECT * FROM employee WHERE salary<=20000 ;

SELECT * FROM employee WHERE city="mumbai" AND salary<50000;
SELECT * FROM employee WHERE city="mumbai" or city="banglore";
-- department D1 and salary should be less than 20000

-- pune d1
-- 11 12 13 14 ......20   value>=11 and value<=20

SELECT * FROM employee WHERE salary>=11000 and salary<=20000;



SELECT * FROM employee WHERE e_id="E1" or e_id="E2" or e_id="E3";
SELECT * FROM employee WHERE e_id IN("E1","E2","E3");

SELECT * FROM employee WHERE salary BETWEEN 20000 and 50000;
ALTER TABLE employee ADD COLUMN age INT;

select * from employee WHERE ename!="nikita";


UPDATE employee SET age=0;
UPDATE employee SET age=25 WHERE e_id="E1";
UPDATE employee SET age=23 WHERE e_id IN ("E2","E4");

UPDATE employee SET salary=salary+5000 WHERE e_id="E5";
-- -----------------------------------------------------------------

UPDATE employee SET city=null WHERE e_id IN("E1","E3");



SELECT * FROM employee WHERE city IS NULL;
SELECT * FROM employee WHERE city IS NOT NULL;



SELECT * FROM employee;
SELECT * FROM employee WHERE ename LIKE "n%";
SELECT * FROM employee WHERE ename LIKE "n%a";
SELECT * FROM employee WHERE ename LIKE "m_n%";
SELECT * FROM employee WHERE ename NOT  LIKE "m_n%";
SELECT * FROM employee WHERE ename LIKE "m%" AND city="Pune";





SELECT * FROM employee WHERE ename LIKE "%t_";

-- DELETE FROM <table_name> WHERE condition;


DELETE FROM employee WHERE e_id="E4";
SELECT * FROM employee;

DELETE FROM employee WHERE department="D1" AND age<26;

DELETE FROM employee;

-- TRUNCATE TABLE table-name
TRUNCATE TABLE employee;

-- Aggregate Functions
-- sum
-- count
-- min
-- max
-- avg    12+12+10/3


SELECT COUNT(*) AS number_of_employees FROM employee;
SELECT COUNT(*) AS number_of_departments FROM department;

SELECT DISTINCT city FROM employee;

INSERT INTO employee VALUES ("E6","Nisha",null,62300,"D1",24);

SELECT count( DISTINCT city) FROM employee;
select * from employee;

SELECT MIN(salary) FROM employee;
SELECt MAX(salary)FROM employee;
SELECT SUM(salary) FROM employee;
SELECT SUM(salary)*12 FROM employee;

SELECT AVG(salary) FROM employee;
SELECT AVG(age) FROM employee;


SELECt * FROM employee;
SELECt * FROM employee ORDER BY salary;
SELECt * FROM employee ORDER BY salary DESC;

SELECT * FROM employee ORDER BY ename DESC;

UPDATE employee SET salary=80000 WHERE e_id="E1";

SELECT * FROM employee ORDER BY salary DESC,age DESC;

USE xyz_company;
SELECT * FROM employee ORDER BY salary LIMIT 1;

SELECT * FROM employee 
ORDER BY 
salary DESC,age DESC 
LIMIT 3;

-- ----------------------------------------------------

SELECT * FROM employee ;

SELECT department,count(e_id) 
FROM employee
GROUP BY department;

-- ---------------------------------------------------

SELECT city,count(e_id) 
FROM employee 
GROUP BY city ;

-- ----------------------------------------

SELECT  department,
sum(salary) AS total_amount,
avg(salary) AS average_salary,
min(salary),
max(salary),
count(e_id)
FROM employee
GROUP BY  department HAVING average_salary<50000;
-- -----------------------------------------------------
SELECT * FROM employee;
ALTER TABLE employee ADD COLUMN gender CHAR(1);
UPDATE employee SET gender="M" WHERE e_id="E4";

SELECT gender,count(e_id) 
FROM employee GROUP BY gender HAVING gender="F" ;

SELECT count(*) FROM employee WHERE salary<50000 AND gender="F";

SELECT gender,count(e_id) FROM employee WHERE salary<50000
GROUP BY gender
HAVING gender="F";



SELECT department,avg(salary) AS average_salary
FROM employee 
GROUP BY department
HAVING average_salary<50000;

-- -----------------------------------------
SELECT department,avg(salary) AS average_salary
FROM employee 
GROUP BY department
ORDER BY average_salary DESC LIMIT 1; 


SELECT department,count(e_id)
FROM employee
GROUP BY department 
ORDER BY count(e_id) LIMIT 1;


SELECT department,sum(salary)
FROM employee
GROUP BY department ORDER BY sum(salary) LIMIT 1;


SELECT department,count(e_id)
FROM employee
GROUP BY department;





USE xyz_company;

-- Built in Functions

-- CONCAT("Hello","world") Helloworld


SELECT CONCAT("Amit"," ","Shukla");
SELECT * FROM employee;

-- E1-nikita
SELECT e_id,ename,CONCAT(e_id,"-",ename)  FROM employee;

-- email e1.ename@itvedant.com

select e_id,ename,CONCAT(e_id,".",ename,"@itvedant.com") AS email
FROM employee;

-- UPPER("sql")  SQL
SELECT UPPER("sql");
SELECT LOWER("ABC");

INSERT INTO employee VALUES
("E7","Ankita",lOWER("MUmbAI"),25900,"D1",26,UPPER("f"));


SELECT LENGTH("Hello");
SELECT LENGTH("He  llo");
--              5>20
SELECT LENGTH("Nisha")>20;

SELECT ename,LENGTH(ename) FROM employee;

--  H e l l o
--  1 2 3 4 5
SELECT substr("Hello",2,1);
SELECT substr("Hello",2,2);

SELECT substr("Anju",LENGTH("Anju"),1);

SELECT ename,UPPER(substr(ename,LENGTH(ename),1)) FROM employee;

-- nikita-A   pooja-A
-- ename - UPPER(substr(ename,LENGTH(ename),1))

SELECT CONCAT(ename,"-",UPPER(substr(ename,LENGTH(ename),1))) 
FROM employee;

-- nikiTa   Nikita
-- nikita        
-- N
-- nikita   2,5
-- Pooja    2,4
-- Om       2,1
SELECT UPPER(substr("janki",1,1));
SELECT substr("janki",2,LENGTH("janki")-1);


SELECT CONCAT(UPPER(substr(ename,1,1)),LOWER(substr(ename,2,LENGTH(ename)-1)))
FROM employee;

-- nikITA
-- NikitA
-- 2,4      2,3     2,5       2,5 
-- Nikita  Pooja   Netrali  Gurjeet


SELECT CONCAT(UPPER(substr(ename,1,1)),
SUBSTR(ename,2,LENGTH(ename)-2),UPPER(SUBSTR(ename,LENGTH(ename),1))) 
FROM employee;

USE xyz_company;

-- mod(m,n)

SELECT mod(71,3);
SELECT round(5.785,1);
SELECT CEIL(77.00);
SELECT FLOOR(45.89);
SELECT ROUND(sqrt(17));
SELECT SIGN(0);
SELECT TRUNCATE(5.67835455667,4);
SELECT ROUND(5.67835455667,4);
SELECT POW(5,2);

-- -------------------------------------------------------
DESC employee;

SELECT CEIL(AVG(salary)) as average_salary FROM employee;
-- Date related Functions
-- YYYY-MM-DD
SELECT curdate();
-- HH:MM:SS
SELECT curtime();
-- YYYY-MM-DD HH:MM:SS
SELECT NOW();

SELECT DATE("2024-11-05 07:25:20");
SELECT DATE(NOW());

SELECT DAY("2024-10-20");
SELECT MONTH(curdate());
SELECT MONTH("2024-10-20");
SELECT YEAR("2023-10-20");

DESC employee;
ALTER TABLE employee ADD COLUMN joining_date DATE;


SELECT * FROM employee;

UPDATE employee SET joining_date="2024-1-15"
WHERE e_id IN("E5");


SELECT e_id,ename,joining_date,YEAR(joining_date) FROM employee;

SELECT * FROM employee WHERE 
YEAR(joining_date)=2022 OR YEAR(joining_date)=2023;


SELECT YEAR(joining_date) as joining_year,COUNT(e_id) FROM employee 
GROUP BY YEAR(joining_date) 
HAVING joining_year=2022 ;

-- ---------------------------------------------------------


SELECT date_format("2024-11-21","%d-%m-%y");
SELECT date_format("2024-11-21","%D %M %Y");
-- %w is a week number 0-sun   1-mon
SELECT date_format("2024-07-28","%D %M %Y %w");
SELECT date_format("2024-07-28","%D %m %Y %W");
SELECT date_format(now(),"%b");
SELECT date_format("2024-01-28","%D %b %Y %W");


-- 
USE xyz_company;

DESC employee;
-- 30000 very les      60000 Average      High  90000
SELECT * FROM employee;
SELECT * FROM department;
-- --------------------------------------------------------------
SELECT ename,salary,
CASE
    WHEN salary<30000 THEN "very less"
    WHEN salary<60000 THEN "Average"
    WHEN salary<100000 THEN "VERY high"
    ELSE "-"
END AS salarydata,
CASE
     WHEN department="D1" THEN "Marketing"
	 WHEN department="D2" THEN "IT"
	 WHEN department="D3" THEN "HR"
     ELSE "-"
END AS department_name
FROM employee;

-- -----------------------------------------------------------------

desc employee;


SELECT e_id,ename,department,
CASE
     WHEN department="D1" THEN "Marketing"
	 WHEN department="D2" THEN "IT"
	 WHEN department="D3" THEN "HR"
     ELSE "-"
END AS department_name
FROM employee;
--  b.ename_e_id@itvedant.com
--  D1 2000   D2 1000   D3 2500  

SELECT * FROM employee;


-- UPDATE employee SET salary= Case;

UPDATE employee SET salary=
CASE
   WHEN department="D1" THEN salary+2000
   WHEN department="D2" THEN salary+1000
   WHEN department="D3" THEN salary+2500
   ELSE salary
END;


ALTER TABLE employee ADD COLUMN email VARCHAR(90);
SELECT * FROM employee;

--  b.ename_e_id@itvedant.com

SELECT SUBSTR(city,1,1);

UPDATE employee SET email=CONCAT(SUBSTR(city,1,1),".",ename,"_",LOWER(e_id),"@itvedant.com");


-- COALESCE

SELECT COALESCE( null,null,null,12,45,78);
SELECt coalesce();
select coalesce("NULL",11,null,10);

ALTER TABLE employee ADD COLUMN phoneno BIGINT;
DESC employee;
SELECt * FROM employee;


UPDATE employee SET phoneno=7895425412,email=null WHERE e_id IN ("E1","E2","E3");

SELECT ename,email,phoneno,coalesce(email,phoneno) FROM employee;

USE xyz_company;

SELECT ISNULL("joel");

SELECT datediff(curdate(),"2024-07-25");

SELECT ename,joining_date,datediff(curdate(),joining_date) as no_of_days 
FROM employee
WHERE datediff(curdate(),joining_date)>365;

-- date_add

SELECT date_add(curdate(),INTERVAL 100 day);
SELECT date_add(curdate(),INTERVAL 10 month);
SELECT date_add(curdate(),INTERVAL 10 YEAR);
-- ----------------------------------------------------------
SELECT *,
date_add(joining_date,INTERVAL 1 YEAR) as anniversary
FROM employee;

-- ----------------------------------------------
-- ---------------------------------------------

SELECT * FROM department;
SELECT * FROM employee;

UPDATE employee SET department=null WHERE e_id="E7";
INSERT INTO department VALUES("D4","Operations");


SELECT * FROM employee;
SELECT * FROM department;
select coalesce(null,"amit",null,null);

-- INNER JOIN


SELECT e.ename,d.d_id,d.department FROM employee  e
INNER JOIN department d
ON
e.department=d.d_id;

-- LEFT JOIN

SELECT * FROM employee e
LEFT JOIN department d
ON
e.department=d.d_id
ORDER BY e.salary DESC LIMIT 1;

SELECT * FROM employee;
INSERT INTO department VALUE("D4","Operations"),
("D5","Sales");
INSERT  INTO employee (e_id,ename,city,salary,age) VALUE 
 ("E7","Ankita","pune",50000,25);
 
-- RIGHT JOIN
SELECT * FROM employee e
RIGHT JOIN department d 
ON e.department=d.d_id
GROUP BY d.d_id
;

-- For Checking if column is null or not use IS ,dont use =
SELECT d.* FROM employee e
RIGHT JOIN department d 
ON e.department=d.d_id
WHERE e.department IS null
;

-- Cross JOIN (basically multiplication)

SELECT * FROM employee,department;

SELECT * FROM employee e,department d 
WHERE e.department=d.d_id AND e.department="D1";


SELECT * FROM department;
DESC department;


CREATE TABLE department_2(
d_id CHAR(2) PRIMARY KEY,
department_name VARCHAR(100),
city VARCHAR(150)
);

DESC department_2;

INSERT INTO department_2 VALUES
("D1","Marketing","Mumbai"),
("D2","Training","Pune");

DELETE FROM department_2 WHERE d_id="D2";
SELECT * FROM department_2;
INSERT INTO department_2 VALUE("D6","Training","Pune");

-- UNION JOIN (SHOWS ONLY DISTINCT VALUE NOT DUPLICATES)
-- Number of columns should match

SELECT d_id,department FROM department
UNION 
SELECT d_id,department_name FROM department_2;

-- UNION ALL (will also show repeated values)
SELECT d_id,department FROM department
UNION ALL
SELECT d_id,department_name FROM department_2;

