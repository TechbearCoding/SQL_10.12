CREATE TABLE StudentInfo(
	studentId INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(30) NOT NULL,
    studentLastName VARCHAR(30) NOT NULL,
    course INT
);

INSERT INTO StudentInfo(studentName, studentLastName, course)
VALUES 
('Karlis', 'Berzins', 3);

INSERT INTO StudentInfo(studentName, studentLastName, course)
VALUES 
('Janis', 'Berzins', 3),
('Zane', 'Klava', 1),
('Juris', 'Zibens', 1);


INSERT INTO StudentInfo(studentName, studentLastName)
VALUES ('Armands', 'Abele');


-- > < >= <= =
SELECT * FROM StudentInfo
WHERE studentId > 5;

DELETE FROM StudentInfo
WHERE studentId > 5;

SELECT * FROM StudentInfo;

