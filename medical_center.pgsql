DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER NOT NULL,
    years_as_doctor INTEGER NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    diag_name VARCHAR(25) NOT NULL,
    is_certain_death BOOLEAN default false,
    description TEXT
    
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER NOT NULL,
    is_healthy BOOLEAN DEFAULT true,
    has_insurance BOOLEAN DEFAULT false
);

CREATE TABLE patients_diagnosis (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    diag_id INTEGER REFERENCES diagnosis ON DELETE SET NULL,
    doc_id INTEGER REFERENCES doctors ON DELETE SET NULL
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doc_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

INSERT INTO doctors
    (name, birth_year, years_as_doctor)
VALUES 
('Dr Peter Parker', 1985, 5),
('Dr Harry Bradford', 1972, 18),
('Dr Sasha Brown', 1981, 8);

INSERT INTO diagnosis (diag_name)
VALUES
    ('Covid 19'),
    ('Cancer'),
    ('pneumonia'),
    ('rabies'),
    ('e.coli'),
    ('influenxa'),
    ('bubble guts');

INSERT INTO patients 
    (name, birth_year, is_healthy, has_insurance)
VALUES
    ('Billy Thornton', 1965, false, true),
    ('Kevin Bacon', 1970, true, true),
    ('Hey Arnold', 1992, false, false);

INSERT INTO patients_diagnosis
    (patient_id, diag_id, doc_id)
VALUES 
    (1, 5, 2),
    (3, 3, 1),
    (1, 1, 2),
    (2, 7, 3);

INSERT INTO doctors_patients 
    (doc_id, patient_id)
VALUES
    (2, 1),
    (1, 3),
    (3, 2);