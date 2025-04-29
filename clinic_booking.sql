-- Create the database
CREATE DATABASE IF NOT EXISTS ClinicDB;
USE ClinicDB;

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Create the Doctors table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);

-- Create the Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

-- Create the Appointments table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Booked', 'Completed', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);

-- Sample Data

-- Departments
INSERT INTO Departments (DepartmentName) VALUES ('Cardiology'), ('Dermatology'), ('Neurology');

-- Doctors
INSERT INTO Doctors (Name, Specialty, DepartmentID)
VALUES 
('Dr. Smith', 'Cardiologist', 1),
('Dr. Alice', 'Dermatologist', 2),
('Dr. Bob', 'Neurologist', 3);

-- Patients
INSERT INTO Patients (FirstName, LastName, Email, Phone)
VALUES 
('John', 'Doe', 'john@example.com', '123456789'),
('Jane', 'Smith', 'jane@example.com', '987654321');

-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES 
(1, 1, '2025-05-10 10:00:00', 'Booked'),
(2, 2, '2025-05-11 14:00:00', 'Completed');
