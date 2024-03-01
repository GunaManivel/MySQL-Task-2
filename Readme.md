# Guvizenclass Database Schema

This database schema is designed for a classroom-like setting, where there are students, mentors, courses, tasks, enrollments, and submissions.

## Tables

- `Students`
   - `student_id` (INT) PRIMARY KEY
   - `name` (VARCHAR(255))
   - `email` (VARCHAR(255))
   - `phone_number` (VARCHAR(20))
   - `date_of_birth` (DATE)
   - `address` (VARCHAR(255))

- `Mentors`
   - `mentor_id` (INT) PRIMARY KEY
   - `name` (VARCHAR(255))
   - `email` (VARCHAR(255))
   - `phone_number` (VARCHAR(20))

- `Courses`
   - `course_id` (INT) PRIMARY KEY
   - `title` (VARCHAR(255))
   - `description` (TEXT)
   - `mentor_id` (INT) FOREIGN KEY REFERENCES Mentors(mentor_id)

- `Task`
   - `task_id` (INT) PRIMARY KEY
   - `course_id` (INT) FOREIGN KEY REFERENCES Courses(course_id)
   - `title` (VARCHAR(255))
   - `description` (TEXT)
   - `deadline` (DATE)

- `Enrollments`
   - `enrollment_id` (INT) PRIMARY KEY
   - `student_id` (INT) FOREIGN KEY REFERENCES Students(student_id)
   - `course_id` (INT) FOREIGN KEY REFERENCES Courses(course_id)

- `Submissions`
   - `submission_id` (INT) PRIMARY KEY
   - `task_id` (INT) FOREIGN KEY REFERENCES Task(task_id)
   - `student_id` (INT) FOREIGN KEY REFERENCES Students(student_id)
   - `submission_date` (DATE)
   - `grade` (DECIMAL(5, 2))

## Relationships

- A student can be enrolled in multiple courses, and a course can have multiple students enrolled (many-to-many relationship).
- A mentor can teach multiple courses, and a course can have only one mentor (one-to-many relationship).
- A course can have multiple tasks, and a task can be associated with only one course (one-to-many relationship).
- A student can submit multiple submissions, and a submission is associated with only one task and one student (many-to-one relationship).