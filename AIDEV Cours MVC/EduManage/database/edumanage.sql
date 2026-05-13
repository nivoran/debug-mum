CREATE DATABASE edumanage;

USE edumanage;

-- =========================
-- TABLE USERS
-- =========================

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

-- =========================
-- TABLE STUDENTS
-- =========================

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    birthdate DATE,
    photo VARCHAR(255)
);

-- =========================
-- TABLE COURSES
-- =========================

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    description TEXT,
    duration VARCHAR(50),
    level VARCHAR(50)
);

-- =========================
-- TABLE ENROLLMENTS
-- =========================

CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,

    student_id INT,
    course_id INT,

    enrollment_date DATE,

    status VARCHAR(50),

    FOREIGN KEY(student_id)
        REFERENCES students(id),

    FOREIGN KEY(course_id)
        REFERENCES courses(id)
);