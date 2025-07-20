-- Create a new database named 'demojoins'
CREATE DATABASE demojoins;

-- Use the newly created database for subsequent operations
USE demojoins;

-- Create a table named 'student' with an ID and name
CREATE TABLE student (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    student_name VARCHAR(50)    -- 'student_name' can hold up to 50 characters
);

-- Insert records into the 'student' table
INSERT INTO student VALUES 
(101, 'Kirti'),                -- ID 101 for student Kirti
(102, 'Ravi'),                 -- ID 102 for student Ravi
(103, 'Lavish'),               -- ID 103 for student Lavish
(104, 'Trisha');               -- ID 104 for student Trisha

-- Retrieve all records from the 'student' table
SELECT * FROM student;

-- Create a table named 'course' with an ID and course name
CREATE TABLE course (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    course_name VARCHAR(80)      -- 'course_name' can hold up to 80 characters
);

-- Insert records into the 'course' table
INSERT INTO course VALUES
(107, 'English'),              -- ID 107 for course English
(102, 'Python'),               -- ID 102 for course Python
(104, 'Hindi'),                -- ID 104 for course Hindi
(108, 'Maths');                -- ID 108 for course Maths

-- Retrieve all records from the 'course' table
SELECT * FROM course;


-- Inner Join (also known as Simple Join / Equi Join): 
-- retrieves records that have matching values in both tables involved in the join.
-- Retrieve records with matching IDs from both tables
SELECT student.id, student_name, course_name 
FROM student 
INNER JOIN course ON student.id = course.id;

select * from student;

-- Left Join (also known as Left Outer Join): 
-- retrieves all records from the left table and the matched records from the right table.
-- Retrieve all records from 'student' and matching records from 'course'
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id;

-- Right Join (also known as Right Outer Join): 
-- retrieves all records from the right table and the matched records from the left table.
-- Retrieve all records from 'course' and matching records from 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

SELECT student.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

-- Full Join (also known as Full Outer Join): 
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where 
-- there are no matches.
-- Retrieve all records from both tables, with NULLs where there are no matches
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
UNION
SELECT student.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
UNION
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.  
-- Retrieve records from 'student' that do not have matches in 'course'
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
WHERE course.id IS NULL;

-- Right Exclusive Join (also known as Right Anti Join): 
-- retrieves rows from the right table that do not have matching rows in the left table. 
-- Retrieve records from 'course' that do not have matches in 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id
WHERE student.id IS NULL;

-- Self Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Join)
-- Self Join is a special case of a join that allows a table to be joined with itself. 
-- Join the 'student' table with itself based on matching IDs
SELECT student.id, student_name, course_name 
FROM student, course 
WHERE student.id = course.id;

-- Cross Join:(also known as a Cartesian Join or Cartesian Product Join) 
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is 
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
SELECT student.id, student_name, course_name 
FROM student 
CROSS JOIN course;

-- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, 
faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 
'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 
'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 
'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D',
'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 
'Building E', 'eva.davis@example.com');


-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, 
department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 
'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);

