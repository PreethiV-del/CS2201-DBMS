CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Doctors
( doctor_id int PRIMARY KEY,
  doctor_name char(30),
  specialization char(20));
  
CREATE TABLE Patients
( patient_id int PRIMARY KEY,
  patient_name char(30),
  gender char(10),
  hospital char(30),
  doctor_id int,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
  city char(20));
  
  CREATE TABLE Appointments
( Apt_id int PRIMARY KEY,
  doctor_id int,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
  patient_id int,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  Status char(30));
  
  
  INSERT INTO Doctors(doctor_id,doctor_name,Specialization) VALUES
  (101 , 'Dr.Sujatha','Cardiologist'),
  (102 , 'Dr. Ganesh','Physiotherapist'),
  (103 , 'Dr. Venkatesh', 'Paediatrician');
  
  SELECT * FROM Doctors;
  
  INSERT INTO Patients(patient_id,patient_name,gender,hospital,doctor_id,city) VALUES
  (201, 'Meher' , 'Female', 'Sparsh Hospital' , 101, 'Bangalore'),
  (202 , 'Himanyu', 'Male', 'SSNMC', 102, 'Mumbai'),
  (203, 'Nischal', 'Male', 'Jayadeva hospital', 103, 'Delhi');
  
  SELECT * FROM Patients;
  
  INSERT INTO Appointments(Apt_id,doctor_id,patient_id,status) VALUES
  (301, 101, 201, 'Scheduled'),
  (302, 102, 202, 'Completed'),
  (303, 103, 203, 'Completed');
  
  SELECT * FROM Appointments;
  
SELECT A.Apt_id,P.Patient_name,D.Doctor_name,D.Specialization,A.Status
FROM Appointments A
JOIN Patients P ON A.Patient_id = P.Patient_id
JOIN Doctors D ON A.Doctor_id = D.Doctor_id;

SELECT D.Doctor_name,P.Patient_name,A.Status
FROM Appointments A
JOIN Doctors D ON A.Doctor_id = D.Doctor_id
JOIN Patients P ON A.Patient_id = P.Patient_id
WHERE D.Doctor_name = 'Dr. Sujatha';

SELECT D.Doctor_name,
COUNT(A.Patient_id) AS TotalPatients
FROM Appointments A
JOIN Doctors D ON A.Doctor_id = D.Doctor_id
GROUP BY D.Doctor_name;

DELIMITER //
CREATE PROCEDURE AdAppointment(IN doc_id INT,IN pat_id INT,IN app_date DATE,IN app_status VARCHAR(20))
BEGIN
    INSERT INTO Appointments (apt_id,doctor_id, patient_id,Status)
    VALUES (doc_id, pat_id, app_date, app_status);
END //
DELIMITER ;

CALL AdAppointment(101, 201, '2025-10-30', 'Scheduled');

DELIMITER //
CREATE PROCEDURE UpdateAppointmentStatus(
    IN app_id INT,
    IN new_status VARCHAR(20)
)
BEGIN
    UPDATE Appointments
    SET Status = new_status
    WHERE Apt_id = app_id;
END //
DELIMITER ;

CALL UpdateAppointmentStatus(2, 'Completed');