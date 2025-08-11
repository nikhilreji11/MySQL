-- Employee Database Operations
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Employee VALUES
(1, 'John', 'Doe', 32, 'john.doe@company.com'),
(2, 'Jane', 'Smith', 28, 'jane.smith@company.com'),
(3, 'Michael', 'Johnson', 35, 'michael.j@company.com'),
(4, 'Emily', 'Williams', 29, 'emily.w@company.com'),
(5, 'David', 'Brown', 45, 'david.b@company.com');

SELECT first_name, last_name FROM Employee;
SELECT first_name, last_name, age FROM Employee WHERE age > 30;
UPDATE Employee SET age = age + 1 WHERE age > 25;

-- Hospital Database Normalization
CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) NOT NULL,
    disease VARCHAR(100) NOT NULL,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE EmergencyContact (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    contact_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

INSERT INTO Doctor (doctor_name) VALUES 
('Dr. Brown'),
('Dr. Green');

INSERT INTO Patient VALUES
(101, 'Alice Smith', 29, 'F', 'Diabetes', 1),
(102, 'Mark Davis', 40, 'M', 'Hypertension', 2);

INSERT INTO EmergencyContact (patient_id, contact_name, relationship, phone, email) VALUES
(101, 'John Smith', 'Husband', '111111', 'john@example.com'),
(101, 'Sarah White', 'Sister', '222222', 'sarah@example.com'),
(102, 'Lisa Davis', 'Wife', '333333', 'lisa@example.com');

SELECT 
    p.patient_id,
    p.patient_name,
    p.age,
    p.gender,
    p.disease,
    d.doctor_name,
    ec.contact_name,
    ec.relationship,
    ec.phone,
    ec.email
FROM 
    Patient p
JOIN 
    Doctor d ON p.doctor_id = d.doctor_id
LEFT JOIN 
    EmergencyContact ec ON p.patient_id = ec.patient_id
ORDER BY 
    p.patient_id, ec.contact_id;