CREATE TABLE Students(
	studentId INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(20) NOT NULL,
    studentLastName VARCHAR(20) NOT NULL,
    courseId INT
);


CREATE TABLE Lecturers(
	lecturerId INT PRIMARY KEY AUTO_INCREMENT,
    lecturerName VARCHAR(20) NOT NULL,
    lecturerLastName VARCHAR(20) NOT NULL,
    courseId INT
);


CREATE TABLE Course(
	courseId INT PRIMARY KEY AUTO_INCREMENT,
    courseNr INT NOT NULL,
    facultyName VARCHAR(20) NOT NULL
);


ALTER TABLE Students
ADD FOREIGN KEY(courseId) REFERENCES Course(courseId);


ALTER TABLE Lecturers
ADD FOREIGN KEY(courseId) REFERENCES Course(courseId);


INSERT INTO Course(courseNr,facultyName)
VALUES
(1, 'Datorikas'),
(2, 'Datorikas'),
(1, 'Ekonomikas'),
(2, 'Ekonomikas'),
(1, 'Buvnieku'),
(2, 'Buvnieku');

INSERT INTO Students(studentName,StudentLastName,courseId)
VALUES
("test1", "test1", 1),
("test2", "test2", 1),
("test3", "test3", 1),
("test4", "test4", 2),
("test5", "test5", 2),
("test6", "test6", 2),
("test7", "test7", 3),
("test8", "test8", 3),
("test9", "test9", 3),
("test10", "test10", 4),
("test11", "test11", 4),
("test12", "test12", 4),
("test13", "test13", 5),
("test14", "test14", 5),
("test15", "test15", 5),
("test16", "test16", 6),
("test17", "test17", 6),
("test18", "test18", 6);


INSERT INTO Lecturers (lecturerName,lecturerLastName,courseId)
VALUES 
("teacher1", "teacher1", 1),
("teacher2", "teacher2", 2),
("teacher3", "teacher3", 3),
("teacher4", "teacher4", 4),
("teacher5", "teacher5", 5),
("teacher6", "teacher6", 6);


-- 1) Parādīt visus studentus
SELECT * FROM university.students;
-- 2) Parādīt visus studentus, kas mācās Datorikas fakultātē.
-- 3) Parādīt visus studentus, kas mācās Ekonomikas un būvnieku fakultātēs.
-- 4) Parādīt visus pasniedzējus, kas strādā Datorikas fakultātē.
-- 5) Parādīt visus studentus, fakultāti, kur viņi mācās un pasniedzēju, kas viņus māca.
-- 6) Parādīt studentu  vārdus un uzvārdus vienā laukā, fakultāti, kur viņi mācas, un pasniedzēju, kas viņus māca. Nerādīt 2. kursa studentus.

