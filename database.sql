CREATE USER tshwarelo@localhost IDENTIFIED BY Ttmokoane7;
GRANT ALL PRIVILEGES ON *.* TO tshwarelo@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;

# creating data base named  "student records"

CREATE DATABASE student_records;

# switching to student records

USE student_records;

# creating a table 
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    course VARCHAR(255) NOT NULL
);
# sample

INSERT INTO students (name, age, gender, course)
VALUES
('Happy Taba', 20, 'Male', 'Computer Science'),
('Lucas Makua', 22, 'Female', 'Fashion'),
('Karabo /malome', 19, 'Male', 'Financial Systems');

# diplay

SELECT * FROM students;
