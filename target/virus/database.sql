CREATE DATABASE IF NOT EXISTS virus;
USE virus;
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	ContactNumber VARCHAR(20),
    City TEXT,
    Age INT,
    Gender VARCHAR(10),
    PastMedicalConditions TEXT,
    Password VARCHAR(255) NOT NULL,
    UserRole varchar(10)
);
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255),
    Address TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE Virus (
    VirusID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    TransmissionMode TEXT,
    IncubationPeriod TEXT,
    MortalityRate TEXT,
    Symptoms TEXT,
    PreventionMeasures TEXT,
    Treatment TEXT,
    Image varchar(200)
);
CREATE TABLE UserAppointmentDoctor (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Remarks TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
use virus;
CREATE USER 'virusservlet'@'localhost' IDENTIFIED BY '0000';
GRANT ALL ON virus.* TO 'virusservlet'@'localhost';
