CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10,2)
);

INSERT INTO employee (emp_id, first_name, last_name, department, salary)
VALUES
(1, 'John', 'Doe', 'HR', 50000),
(2, 'Jane', 'Smith', 'Finance', 60000),
(3, 'Bob', 'Johnson', 'IT', 70000),
(4, 'Alice', 'Brown', 'Finance', 65000),
(5, 'David', 'Wilson', 'IT', 72000);

SELECT department, AVG(salary) AS average_salary
FROM employee
GROUP BY department;

CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    email VARCHAR(255)
);

INSERT INTO student (StudentID, first_name, last_name, date_of_birth, email)
VALUES
(1, 'John', 'Doe', '2008-05-12', 'john@email.com'),
(2, 'Jane', 'Smith', '2010-07-18', 'jane@email.com'),
(3, 'Bob', 'Johnson', '2009-06-20', 'bob@email.com'),
(4, 'Alice', 'Taylor', '2011-03-15', 'alice@email.com');

SELECT *
FROM student
WHERE date_of_birth > '2009-06-16';

SELECT *
FROM student
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%';

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Age INT
);

INSERT INTO Person (PersonID, FirstName, LastName, Age)
VALUES 
(1, 'John', 'Doe', 30),
(2, 'Jane', 'Smith', 25),
(3, 'Bob', 'Johnson', 40);

CREATE TABLE Employee2 (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

INSERT INTO Employee2 (emp_id, first_name, last_name, age)
VALUES
(101, 'Alice', 'Brown', 28),
(102, 'David', 'Wilson', 35),
(103, 'Eve', 'Taylor', 29);

SELECT FirstName AS name, LastName AS surname, Age
FROM Person
UNION
SELECT first_name, last_name, age
FROM Employee2;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID VARCHAR(50)
);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(101, 1, 'MATH101'),
(102, 1, 'HIST201'),
(103, 2, 'PHYS301'),
(104, 3, 'CHEM401'),
(105, 4, 'ENG501');

SELECT s.StudentID, s.first_name, e.EnrollmentID, e.CourseID
FROM student s
RIGHT JOIN Enrollment e
ON s.StudentID = e.StudentID;

SELECT s.StudentID, s.first_name, s.email, e.EnrollmentID, e.CourseID
FROM student s
LEFT JOIN Enrollment e
ON s.StudentID = e.StudentID;

SELECT s.StudentID, s.first_name, e.EnrollmentID, e.CourseID
FROM student s
LEFT JOIN Enrollment e
ON s.StudentID = e.StudentID
UNION
SELECT s.StudentID, s.first_name, e.EnrollmentID, e.CourseID
FROM student s
RIGHT JOIN Enrollment e
ON s.StudentID = e.StudentID;
