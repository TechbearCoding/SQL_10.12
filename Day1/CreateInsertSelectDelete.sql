-- uztaisit tabulu

CREATE TABLE StudentInfo(
	studentId INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(30) NOT NULL,
    studentLastName VARCHAR(30) NOT NULL,
    course INT
);

-- ievietot datus

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


-- paradit datus

-- > < >= <= =
SELECT * FROM StudentInfo
WHERE studentId > 5;

SELECT * FROM StudentInfo;

SELECT studentName, studentLastName, course FROM StudentInfo
WHERE course = 3;

SELECT studentName, studentLastName
FROM StudentInfo
WHERE studentName = 'Janis';

-- = ir vienads
-- != nav vienads

SELECT studentName, studentLastName, course FROM StudentInfo
WHERE course IS NOT NULL;

SELECT studentName, studentLastName, course FROM StudentInfo
WHERE course IS NULL;


-- izdzest datus
DELETE FROM StudentInfo
WHERE studentId > 5;

-- rediget datus tabula
UPDATE StudentInfo
SET studentName = 'Alberts', studentLastName = 'Lapa'
WHERE studentId = 1

