CREATE SCHEMA exam_system;

-- =========================
-- USERS TABLE
-- =========================

CREATE TABLE exam_system.users (
    user_id SERIAL PRIMARY KEY,
    
    full_name VARCHAR(100) NOT NULL,
    
    email VARCHAR(150) UNIQUE NOT NULL,
    
    password_hash TEXT NOT NULL,
    
    role VARCHAR(20) NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- DEPARTMENTS TABLE
-- =========================

CREATE TABLE exam_system.departments (
    department_id SERIAL PRIMARY KEY,
    
    department_name VARCHAR(100) UNIQUE NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- STUDENTS TABLE
-- =========================

CREATE TABLE exam_system.students (
    student_id SERIAL PRIMARY KEY,
    
    user_id INT UNIQUE NOT NULL,
    
    department_id INT NOT NULL,
    
    semester INT CHECK (semester BETWEEN 1 AND 8),
    
    enrollment_year INT NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id)
        REFERENCES exam_system.users(user_id),
        
    FOREIGN KEY (department_id)
        REFERENCES exam_system.departments(department_id)
);

-- =========================
-- TEACHERS TABLE
-- =========================

CREATE TABLE exam_system.teachers (
    teacher_id SERIAL PRIMARY KEY,
    
    user_id INT UNIQUE NOT NULL,
    
    department_id INT NOT NULL,
    
    specialization VARCHAR(100),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id)
        REFERENCES exam_system.users(user_id),
        
    FOREIGN KEY (department_id)
        REFERENCES exam_system.departments(department_id)
);

-- =========================
-- SUBJECTS TABLE
-- =========================

CREATE TABLE exam_system.subjects (
    subject_id SERIAL PRIMARY KEY,
    
    subject_name VARCHAR(100) UNIQUE NOT NULL,
    
    subject_code VARCHAR(20) UNIQUE NOT NULL,
    
    credits INT NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- EXAMS TABLE
-- =========================

CREATE TABLE exam_system.exams (
    exam_id SERIAL PRIMARY KEY,
    
    subject_id INT NOT NULL,
    
    teacher_id INT NOT NULL,
    
    exam_title VARCHAR(100) NOT NULL,
    
    exam_date DATE NOT NULL,
    
    total_marks INT NOT NULL,
    
    duration_minutes INT NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (subject_id)
        REFERENCES exam_system.subjects(subject_id),
        
    FOREIGN KEY (teacher_id)
        REFERENCES exam_system.teachers(teacher_id)
);

-- =========================
-- STUDENT EXAM ATTEMPTS TABLE
-- =========================

CREATE TABLE exam_system.student_exam_attempts (
    attempt_id SERIAL PRIMARY KEY,
    
    student_id INT NOT NULL,
    
    exam_id INT NOT NULL,
    
    score DECIMAL(5,2),
    
    status VARCHAR(20),
    
    attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id)
        REFERENCES exam_system.students(student_id),
        
    FOREIGN KEY (exam_id)
        REFERENCES exam_system.exams(exam_id)
);

-- =========================
-- INSERT USERS
-- =========================

INSERT INTO exam_system.users
(full_name, email, password_hash, role)
VALUES
('Arun Kumar', 'arun@gmail.com', 'hash123', 'STUDENT'),

('Priya Sharma', 'priya@gmail.com', 'hash456', 'STUDENT'),

('Rahul Verma', 'rahul@gmail.com', 'hash789', 'TEACHER'),

('Admin User', 'admin@gmail.com', 'adminhash', 'ADMIN');

-- =========================
-- INSERT DEPARTMENTS
-- =========================

INSERT INTO exam_system.departments
(department_name)
VALUES
('Computer Science'),
('Electronics'),
('Mechanical');

-- =========================
-- INSERT SUBJECTS
-- =========================

INSERT INTO exam_system.subjects
(subject_name, subject_code, credits)
VALUES
('Database Management System', 'CS101', 4),

('Python Programming', 'CS102', 3),

('Operating Systems', 'CS103', 4);

-- =========================
-- INSERT TEACHERS
-- =========================

INSERT INTO exam_system.teachers
(user_id, department_id, specialization)
VALUES
(3, 1, 'Database Systems');

-- =========================
-- INSERT STUDENTS
-- =========================

INSERT INTO exam_system.students
(user_id, department_id, semester, enrollment_year)
VALUES
(1, 1, 5, 2023),

(2, 1, 3, 2024);

-- =========================
-- INSERT EXAMS
-- =========================

INSERT INTO exam_system.exams
(subject_id, teacher_id, exam_title, exam_date, total_marks, duration_minutes)
VALUES
(1, 1, 'DBMS Mid Exam', '2025-09-15', 100, 90),

(2, 1, 'Python Basics Test', '2025-09-20', 50, 60);

-- =========================
-- INSERT STUDENT EXAM ATTEMPTS
-- =========================

INSERT INTO exam_system.student_exam_attempts
(student_id, exam_id, score, status)
VALUES
(1, 1, 85, 'PASSED'),

(2, 1, 78, 'PASSED'),

(1, 2, 45, 'PASSED');