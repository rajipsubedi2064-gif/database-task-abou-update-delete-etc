create database lms_db;
use lms_db;

-- 1 students
create table students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name varchar(30),
last_name varchar(30),
email varchar(30),
registration_date date,
country varchar(30)
);

-- 2 instructors

create table instructors(
 instructor_id INT AUTO_INCREMENT PRIMARY KEY,
 instructor_name varchar(30),
specialization  varchar(30)  ,
joining_date date

);

-- 3 Courses
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    course_fee DECIMAL(10,2),
    instructor_id INT,
    FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
);
-- 4 Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    completion_status VARCHAR(20),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

-- 5 Assignments
CREATE TABLE Assignments (
    assignment_id INT  AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    assignment_title VARCHAR(100),
    max_marks INT,
    due_date DATE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

-- 6 Assignment_Submissions
CREATE TABLE Assignment_Submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT,
    student_id INT,
    marks_obtained INT,
    submission_date DATE,
    FOREIGN KEY (assignment_id)
        REFERENCES Assignments(assignment_id),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);

-- 7 payments 
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);


INSERT INTO Students (first_name, last_name, email, registration_date, country)
VALUES
('Aarav', 'Shrestha', 'aarav@gmail.com', '2024-01-10', 'Nepal'),
('Sita', 'Karki', 'sita@gmail.com', '2024-02-15', 'Nepal'),
('Ramesh', 'Thapa', 'ramesh@gmail.com', '2024-03-05', 'India'),
('Anita', 'Gurung', 'anita@gmail.com', '2024-03-20', 'Nepal'),
('Kiran', 'Lama', 'kiran@gmail.com', '2024-04-01', 'Bhutan'),
('Mina', 'Rai', 'mina@gmail.com', '2024-04-10', 'Nepal'),
('Suresh', 'KC', 'suresh@gmail.com', '2024-05-01', 'Nepal'),
('Laxmi', 'Shah', 'laxmi@gmail.com', '2024-05-15', 'India'),
('Prakash', 'Joshi', 'prakash@gmail.com', '2024-06-01', 'Nepal'),
('Nisha', 'Adhikari', 'nisha@gmail.com', '2024-06-10', 'Nepal');


INSERT INTO Instructors (instructor_name, specialization, joining_date)
VALUES
('Ravi Sharma', 'Database', '2023-01-10'),
('Sunita Rai', 'Web Development', '2023-02-20'),
('Kamal Thapa', 'Networking', '2023-03-15'),
('Anju Karki', 'Python', '2023-04-01'),
('Deepak Shrestha', 'Java', '2023-04-20'),
('Sanjay Lama', 'AI', '2023-05-10'),
('Rita Gurung', 'Data Science', '2023-06-01'),
('Manish KC', 'Cybersecurity', '2023-06-15'),
('Bina Joshi', 'HTML/CSS', '2023-07-01'),
('Ramesh Adhikari', 'C Programming', '2023-07-20');


INSERT INTO Courses (course_name, category, course_fee, instructor_id)
VALUES
('MySQL Basics', 'Database', 1500.00, 1),
('Web Design', 'Web Development', 2000.00, 2),
('Network Fundamentals', 'Networking', 1800.00, 3),
('Python Programming', 'Programming', 2200.00, 4),
('Java Essentials', 'Programming', 2500.00, 5),
('AI Concepts', 'Artificial Intelligence', 3000.00, 6),
('Data Science Intro', 'Data Science', 2800.00, 7),
('Cybersecurity Basics', 'Security', 2600.00, 8),
('HTML & CSS', 'Web Development', 1200.00, 9),
('C Programming', 'Programming', 1700.00, 10);


INSERT INTO Enrollments (student_id, course_id, enrollment_date, completion_status)
VALUES
(1, 1, '2024-02-01', 'Completed'),
(2, 2, '2024-02-10', 'Ongoing'),
(3, 3, '2024-03-01', 'Completed'),
(4, 4, '2024-03-15', 'Ongoing'),
(5, 5, '2024-04-01', 'Completed'),
(6, 6, '2024-04-20', 'Ongoing'),
(7, 7, '2024-05-01', 'Completed'),
(8, 8, '2024-05-15', 'Ongoing'),
(9, 9, '2024-06-01', 'Completed'),
(10, 10, '2024-06-10', 'Ongoing');


INSERT INTO Assignments (course_id, assignment_title, max_marks, due_date)
VALUES
(1, 'SQL Queries Practice', 100, '2024-02-15'),
(2, 'HTML Layout Design', 100, '2024-02-25'),
(3, 'Network Diagram', 100, '2024-03-10'),
(4, 'Python Loops', 100, '2024-03-25'),
(5, 'Java Classes', 100, '2024-04-10'),
(6, 'AI Model Basics', 100, '2024-04-25'),
(7, 'Data Cleaning Task', 100, '2024-05-10'),
(8, 'Security Audit', 100, '2024-05-25'),
(9, 'CSS Styling', 100, '2024-06-05'),
(10, 'C Functions', 100, '2024-06-20');


INSERT INTO Assignment_Submissions (assignment_id, student_id, marks_obtained, submission_date)
VALUES
(1, 1, 90, '2024-02-14'),
(2, 2, 85, '2024-02-24'),
(3, 3, 88, '2024-03-09'),
(4, 4, 92, '2024-03-24'),
(5, 5, 95, '2024-04-09'),
(6, 6, 80, '2024-04-24'),
(7, 7, 89, '2024-05-09'),
(8, 8, 84, '2024-05-24'),
(9, 9, 91, '2024-06-04'),
(10, 10, 87, '2024-06-19');


INSERT INTO Payments (student_id, amount_paid, payment_date, payment_method)
VALUES
(1, 1500.00, '2024-02-01', 'Cash'),
(2, 2000.00, '2024-02-10', 'Card'),
(3, 1800.00, '2024-03-01', 'Online'),
(4, 2200.00, '2024-03-15', 'Cash'),
(5, 2500.00, '2024-04-01', 'Card'),
(6, 3000.00, '2024-04-20', 'Online'),
(7, 2800.00, '2024-05-01', 'Cash'),
(8, 2600.00, '2024-05-15', 'Card'),
(9, 1200.00, '2024-06-01', 'Online'),
(10, 1700.00, '2024-06-10', 'Cash');


-- 1 ===================================================

select s.first_name,last_name from students s
join Payments p on s.student_id=p.student_id
where p.amount_paid>(select avg(amount_paid) from Payments);

-- 2 ===================================================

select course_id ,course_name  from Courses
where course_fee>(select avg(course_fee) from Courses);

-- 3 ======================================================= 
select * from instructors i
join Courses c on i.instructor_id=c.instructor_id
where course_fee=(select max(course_fee) from Courses);

-- 4 ======================================================== 

SELECT course_fee,first_name  FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_fee = (SELECT MAX(course_fee) FROM Courses);


-- 5 ========================================================== 

SELECT assignment_id, assignment_title, max_marks
FROM Assignments
WHERE max_marks > (SELECT AVG(max_marks) FROM Assignments);

-- 6 ============================================================

SELECT DISTINCT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE s.student_id IN (SELECT student_id FROM Assignment_Submissions);

-- 7 ================================================================== 

SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE s.student_id NOT IN (SELECT student_id FROM Assignment_Submissions);

--  8 =============================================================================
SELECT c.course_id, c.course_name
FROM Courses c
WHERE c.course_id IN (SELECT course_id FROM Enrollments);

-- 9 ===================================================================== 
SELECT c.course_id, c.course_name
FROM Courses c
WHERE c.course_id  NOT IN (SELECT course_id FROM Enrollments);

-- 10 ============================================================= 
SELECT i.instructor_id, i.instructor_name
FROM Instructors i
WHERE i.instructor_id NOT IN (SELECT instructor_id FROM Courses);

-- 11 ===============================================================
select s.first_name,last_name from students s
join Payments p on s.student_id=p.student_id
where p.amount_paid>(select avg(amount_paid) from Payments);
