-- 1) Ievietot ierakstus tā, lai saminieku tabulā būtu vismaz 5 ieraksti.

INSERT INTO PetOwner(OwnerName, OwnerLastName)
VALUES ('Aleksandrs', 'Lapa'),
('Elizabete', 'Klava'),
('Uldis', 'Ozols');

-- 2) Uztaisīt jaunu tabulu- "Address"
-- id, pilsēta,iela

CREATE TABLE Adress(
	AdressId INT PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(30) NOT NULL,
    Street VARCHAR(30)
);
-- 3) Izmainīt tabulu Owners, lai katram saimniekam būtu piesaistīta adrese. 

ALTER TABLE petowner
ADD AdressId INT;

ALTER TABLE petowner
ADD FOREIGN KEY (AdressId) REFERENCES Adress(AdressId);

INSERT INTO Adress (City, Street)
VALUES 
('Riga', 'Smilgu iela'),
('Riga', 'Slokas iela)'),
('Ventspils', 'Ezera iela'),
('Liepaja', 'Dzintaru iela');

UPDATE petowner
SET AdressId = 3
WHERE OwnerId = 3;

-- 4) Uztaisīt tā, lai 3 ierakstiem ir unikālas adreses, bet diviem ir vienāda. (jārediģē ieraksti tabula Owners)

UPDATE petowner
SET AdressId = 4
WHERE OwnerId = 4 OR OwnerId = 5;

SELECT petowner.ownerName, petowner.ownerLastName, adress.city, adress.street
FROM petowner, adress
WHERE petowner.adressid = adress.AdressId;

-- paradit dzivnieku vardus un dzivnieku saminieku vardus
SELECT pets.petname, petowner.ownerName
FROM pets
LEFT JOIN petownerpetownerpetowneradress
ON petowner.OwnerId = pets.OwnerId
WHERE pets.PetType = 'Kakis';

-- paradit visus dzivniekus un adreses, kur vini ir
SELECT pets.petname, adress.city, adress.street
FROM pets
INNER JOIN petowner
ON petowner.OwnerId = pets.OwnerId
INNER JOIN Adress
ON adress.AdressId = petowner.AdressId
WHERE pets.PetType = 'Kakis';

INSERT INTO Pets (PetName, PetType, PetBreed)
VALUES 
    ('Miks', 'Kakis', 'Persietis'),
    ('Muris', 'Kakis', 'N/A');
-- 8) Rediģēt vienam sunim vārdu uz "M


CREATE TABLE Regions(
	RegionId INT PRIMARY KEY AUTO_INCREMENT,
    RegionName VARCHAR(15) NOT NULL
);

-- -----------------MD 

ALTER TABLE adress
ADD RegionId INT;

ALTER TABLE adress
ADD FOREIGN KEY (RegionId) REFERENCES Regions(RegionId);

INSERT INTO Regions (RegionName)
VALUES ('Kurzeme'),
('Latgale'),
('Vidzeme'),
('Zemgale');

UPDATE adress
SET RegionId = 1
WHERE AdressId = 3 OR AdressId = 4;

UPDATE adress
SET RegionId = 3
WHERE AdressId = 1 OR AdressId = 2;


SELECT CONCAT(petowner.ownername, ' ' ,petowner.ownerlastname) AS 'Owner name', pets.petid, pets.petname, adress.city, regions.regionname
FROM pets
INNER JOIN petowner
ON petowner.OwnerId = pets.OwnerId
INNER JOIN Adress
ON adress.AdressId = petowner.AdressId
INNER JOIN regions
ON adress.regionid = regions.regionid
WHERE adress.street like '%Ezera%';


