CREATE DATABASE HOSPITAL ;
USE hospital;
select * from patients;
select * from Treatment ;
select * from doctor ;
select * from hospital ;
describe Treatment ;
alter table Treatment 
add primary key (Diagnosis_Key);

ALTER TABLE Doctor
ADD PRIMARY KEY (Doctor_Key);
describe doctor;

ALTER TABLE Patient
ADD PRIMARY KEY (Patient_Key);
describe patient;

describe treatment;
SELECT
    Hospital_Key,
    COUNT(*) AS duplicate_count
FROM Hospital_clean
GROUP BY Hospital_Key
HAVING COUNT(*) > 1;

create table hospital_clean as select distinct * from Hospital ;
select * from hospital_clean;

alter table patient add foreign key (doctor_key) references doctor(doctor_key);
alter table patient add foreign key (hospital_key) references hospital(hospital_key);
alter table patient add foreign key (diagnosis_key) references diagnosis(diagnosis_key);

select * from treatment ;





