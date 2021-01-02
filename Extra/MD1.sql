-- 1) Uztaisīt jaunu datubāzi (schema)- PetShop

-- 2) Uztaisīt tabulu Pets ar kolonnām - Id, vāŗds, tips (piem. suns vai kaķis, vai putns utt), sķirne (piem. vācu aitu suns, bez šķirnes, siāmietis utt)
-- id ir Int ar automātisku skaitīšanu, pārējās kolonnas ir NOT NULL

CREATE TABLE Pets (
	PetId INT PRIMARY KEY AUTO_INCREMENT,
    PetName VARCHAR(20) NOT NULL,
    PetType VARCHAR(20) NOT NULL,
    PetBreed VARCHAR(20) NOT NULL
);

-- 3) Ar insert into ievietot datus brīvā formā. (paši izdomājat) 6 ierakstus(3 dzīvnieku tipiem)
INSERT INTO Pets (PetName, PetType, PetBreed)
VALUES 
	('Reksis', 'Suns', 'VAS'),
	('Lesija', 'Suns', 'Kollijs'),
    ('Muris', 'Kakis', 'Siamietis'),
    ('Kuzja', 'Kakis', 'N/A'),
    ('Pollija', 'Papagailis', 'N/A'),
    ('Viktors', 'Papagailis', 'N/A');
-- 4) Ar select parādīt visus ierakstus

SELECT * FROM Pets;

-- 5) Parādīt visus ierakstus, bet nerādīt kolonnas id un šķirne

SELECT PetName, PetType FROM Pets;

-- 6) Izdzēst visus kaķus

DELETE FROM Pets 
WHERE PetId = 21 OR PetId = 22;


-- 7) Ievietot ierakstus no jauna
INSERT INTO Pets (PetName, PetType, PetBreed)
VALUES 
    ('Muris', 'Kakis', 'Siamietis'),
    ('Kuzja', 'Kakis', 'N/A');
-- 8) Rediģēt vienam sunim vārdu uz "Muhtars"
UPDATE Pets
SET PetName = 'Muhtars'
WHERE PetId = 19;




CREATE TABLE PetOwner(
	OwnerId INT PRIMARY KEY AUTO_INCREMENT,
    OwnerName VARCHAR(20) NOT NULL,
    OwnerLastName VARCHAR(20) NOT NULL
);

INSERT INTO PetOwner(OwnerName, OwnerLastName)
VALUES ('Janis', 'Berzins'),
('Anna', 'Klava');

SELECT * FROM PetOwner;

ALTER TABLE Pets
ADD OwnerId INT;

ALTER TABLE Pets
ADD FOREIGN KEY (OwnerId) REFERENCES PetOwner(OwnerId);

UPDATE Pets 
SET OwnerId = 1
WHERE PetId = 19 OR PetId = 25;

UPDATE Pets 
SET OwnerId = 2
WHERE PetId = 20 OR PetId = 23;

SELECT PetName, PetType, OwnerName, OwnerLastName FROM Pets, PetOwner
WHERE Pets.OwnerId = PetOwner.OwnerId;

SELECT PetName, PetType, OwnerName, OwnerLastName FROM Pets, PetOwner
WHERE Pets.OwnerId = PetOwner.OwnerId AND PetOwnerId = 1;
