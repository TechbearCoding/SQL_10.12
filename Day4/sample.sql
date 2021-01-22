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
INNER JOIN petowner
ON petowner.OwnerId = pets.OwnerId;


-- paradit visus dzivniekus un adreses, kur vini ir
SELECT pets.petname, adress.city, adress.street
FROM pets
INNER JOIN petowner
ON petowner.OwnerId = pets.OwnerId
INNER JOIN Adress
ON adress.AdressId = petowner.AdressId
WHERE pets.PetType = 'Suns';



