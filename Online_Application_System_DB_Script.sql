DROP DATABASE IF EXISTS online_application_system_db;

CREATE SCHEMA online_application_system_db;

USE online_application_system_db;

CREATE TABLE applicant(
	entry_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    id_number VARCHAR(13) NOT NULL UNIQUE,
    id_copy LONGBLOB NOT NULL
);