create database guvizenclass;
use guvizenclass;
-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    date_of_birth DATE,
    address VARCHAR(255)
);

-- Create Mentors table
CREATE TABLE Mentors (
    mentor_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES Mentors(mentor_id)
);

-- Create Task table
CREATE TABLE Task (
    task_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(255),
    description TEXT,
    deadline DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Enrollments table 
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Submissions table
CREATE TABLE Submissions (
    submission_id INT PRIMARY KEY,
    task_id INT,
    student_id INT,
    submission_date DATE,
    grade DECIMAL(5, 2),
    FOREIGN KEY (task_id) REFERENCES Task(task_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);