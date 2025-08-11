-- Create and use the database
DROP DATABASE IF EXISTS Anudip;
CREATE DATABASE Anudip;
USE Anudip;

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseTitle VARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);

-- Create Instructor table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    EnrollmentDate DATE NOT NULL,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Create Score table
CREATE TABLE Score (
    ScoreID INT PRIMARY KEY,
    CourseID INT,
    StudentID INT,
    DateOfExam DATE NOT NULL,
    CreditObtained DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    StudentID INT,
    Date DATE NOT NULL,
    InstructorName VARCHAR(100) NOT NULL,
    Feedback TEXT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Insert sample data into Student
INSERT INTO Student VALUES
(1, 'Rahul', 'Sharma', '2000-05-15', 'Male', 'rahul.s@email.com', '9876543210'),
(2, 'Priya', 'Patel', '2001-08-21', 'Female', 'priya.p@email.com', '8765432109'),
(3, 'Amit', 'Singh', '1999-02-10', 'Male', 'amit.s@email.com', '7654321098'),
(4, 'Neha', 'Gupta', '2000-11-30', 'Female', 'neha.g@email.com', '6543210987'),
(5, 'Vikram', 'Joshi', '1999-07-04', 'Male', 'vikram.j@email.com', '5432109876');

-- Insert sample data into Course
INSERT INTO Course VALUES
(101, 'Computer Fundamentals', 4),
(102, 'Database Systems', 5),
(103, 'Web Technologies', 4),
(104, 'Data Structures', 5),
(105, 'Operating Systems', 4);

-- Insert sample data into Instructor
INSERT INTO Instructor VALUES
(201, 'Sanjay', 'Verma', 'sanjay.v@anudip.org'),
(202, 'Meena', 'Reddy', 'meena.r@anudip.org'),
(203, 'Arun', 'Kumar', 'arun.k@anudip.org'),
(204, 'Sunita', 'Desai', 'sunita.d@anudip.org'),
(205, 'Rajesh', 'Iyer', 'rajesh.i@anudip.org');

-- Insert sample data into Enrollment
INSERT INTO Enrollment VALUES
(301, '2023-09-10', 1, 101, 201),
(302, '2023-09-12', 2, 102, 202),
(303, '2023-09-15', 3, 103, 203),
(304, '2023-09-18', 4, 104, 204),
(305, '2023-09-20', 5, 105, 205);

-- Insert sample data into Score
INSERT INTO Score VALUES
(401, 101, 1, '2023-12-15', 85.5),
(402, 102, 2, '2023-12-16', 78.0),
(403, 103, 3, '2023-12-17', 92.5),
(404, 104, 4, '2023-12-18', 88.0),
(405, 105, 5, '2023-12-19', 76.5);

-- Insert sample data into Feedback
INSERT INTO Feedback VALUES
(501, 1, '2024-01-05', 'Sanjay Verma', 'Excellent teaching style and clear explanations'),
(502, 2, '2024-01-06', 'Meena Reddy', 'Very patient with students questions'),
(503, 3, '2024-01-07', 'Arun Kumar', 'Makes complex topics easy to understand'),
(504, 4, '2024-01-08', 'Sunita Desai', 'Provides practical examples for each concept'),
(505, 5, '2024-01-09', 'Rajesh Iyer', 'Well organized course material and lectures');

-- Verification queries
SELECT 'Student Table' AS TableName, COUNT(*) AS RecordCount FROM Student
UNION ALL
SELECT 'Course Table', COUNT(*) FROM Course
UNION ALL
SELECT 'Instructor Table', COUNT(*) FROM Instructor
UNION ALL
SELECT 'Enrollment Table', COUNT(*) FROM Enrollment
UNION ALL
SELECT 'Score Table', COUNT(*) FROM Score
UNION ALL
SELECT 'Feedback Table', COUNT(*) FROM Feedback;