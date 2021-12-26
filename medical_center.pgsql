
DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    phone TEXT 
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    phone TEXT NOT NULL,
    address TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL
);


INSERT INTO doctors (name, phone) 
VALUES

('Jeff Williamson', '614-123-3444'),
('Dbrickishaw Ferguson', '128-321-1232'),
('Alanis Morsette', '543-445-5554');

INSERT INTO patients (name, phone) VALUES
('Joe Biden', 343-342-2344),
('Donny Trump', 543-345-3453),
('Elmo', 485-543-3453);

INSERT INTO diseases (name) VALUES
('Leopercy'),
('Rona'),
('Herpigonneacyphilytis');

INSERT INTO visits (patient_id, doctor_id, disease_id) VALUES
(1, 2, 3),
(1, 1, 2),
(2, 2, 3),
(3, 1, 1);