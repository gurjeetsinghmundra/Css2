create database java_student_management; 
  
use java_student_management; 
  
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    DateOfBirth DATE, 
    GradeLevel INT 
); 
  
CREATE TABLE Teachers ( 
    TeacherID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Subject VARCHAR(255) 
); 
  
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(255), 
    TeacherID INT, 
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID) 
); 
  
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollmentDate DATE, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
  
  
  
INSERT INTO Students (StudentID, Name, DateOfBirth, GradeLevel) VALUES 
    (1, 'Alice Johnson', '2005-03-15', 9), 
    (2, 'Bob Smith', '2004-08-22', 10), 
    (3, 'Charlie Brown', '2006-05-10', 8), 
     (4, 'Van Johnson', '2005-03-15', 9), 
    (5, 'Smith hen', '2004-08-22', 10), 
    (6, ' Brown', '2006-05-10', 8); 

  
INSERT INTO Teachers (TeacherID, Name, Subject) VALUES 
    (1, 'Ms. Davis', 'Math'), 
    (2, 'Mr. Johnson', 'English'), 
    (3, 'Mrs. Smith', 'Science'); 
  
INSERT INTO Courses (CourseID, CourseName, TeacherID) VALUES 
    (101, 'Algebra', 1), 
    (102, 'Literature', 2), 
    (103, 'Biology', 3), 
     (104, 'Geomentry', 1), 
    (105, 'Zoology', 3); 
  
  
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
    (1001, 1, 101, '2023-01-15'), 
    (1002, 2, 102, '2023-02-20'), 
    (1003, 3, 103, '2023-03-25'); 
    
SELECT avg(gradelevel) FROM students;

SELECT name FROM teachers;

-- Group by me joh be likhoge wohi cheez aggregate function ke sath likho
SELECT teacherid,count(courseid) FROM courses GROUP BY teacherid;

SELECT t.name,count(courseid) FROM teachers t
LEFT JOIN courses c
ON t.teacherid=c.teacherid
GROUP BY t.name;

SELECT * FROM Teachers t
LEFT JOIN Courses c
USING(teacherid);

CREATE VIEW student_teacher_names AS
SELECT s.name,t.name AS teacher_name FROM students s
LEFT JOIN enrollments e
USING(studentid)
LEFT JOIN courses c
USING (courseid)
LEFT JOIN teachers t
USING(teacherid);

SELECT * FROM student_teacher_names;

