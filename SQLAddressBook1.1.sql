--Create AddressBook Table
CREATE TABLE AddressBook(
	AddressBookId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookName VARCHAR(30)
)
--Create Persons Table
CREATE TABLE PersonTypes(
	PersonTypeId INT IDENTITY(1,1) PRIMARY KEY,
	PersonType varchar(50),
	--PersonId INT  FOREIGN KEY REFERENCES Person(PersonId)
)


--Create Table Persons
CREATE TABLE Person(
	PersonId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookId INT FOREIGN KEY REFERENCES AddressBook(AddressBookId),
	FirstName varchar(30),
	LastName varchar(30),
	Address varchar(30),
	City varchar(30),
	StateName varchar(30),
	ZipCode int,
	PhoneNumber bigint,
	EmailId varchar(30)
)

CREATE TABLE PersonTypesMap(
	PersonId INT FOREIGN KEY REFERENCES Person(PersonId),
	PersonTypeId INT FOREIGN KEY REFERENCES PersonTypes(PersonTypeId)
)



--------------------------------------------------------
--Insert Values into address books
INSERT INTO AddressBook VALUES ('satyam'),('shubham')

SELECT * FROM AddressBook

--Insert values in persons type
INSERT INTO PersonTypes VALUES ('Family'),('Friend'),('Profession')
SELECT * FROM PersonTypes


---Insert Values into Persons
INSERT INTO Person VALUES (1,'sagar','shinde','RAJComplex','pune','Maharshtra',455001,9876543210,'asdf@asf.com')
INSERT INTO Person VALUES (1,'sayali','thakur','baner','pune','Maharshtra',455780,9985543210,'qwer@asf.com'),(2,'viraj','ramoshi','akurdi','nashik','Maharshtra',411056,9985595210,'viraj@asf.com')
INSERT INTO Person VALUES (1,'Rajiv','Ranjit','Parel','Mumbai','Kerala',452536,9985543210,'rajiv@asf.com')
SELECT * FROM Person



--Insert into persons type map tables
INSERT INTO PersonTypesMap VALUES (1,1),(2,2),(3,3),(4,1)
SELECT * FROM PersonTypesMap

-----------------------------------------------------------------------------
--Retrive All Data---
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId;

-------------------------------------------------------------------
--Retrieve based on city and state--
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId AND (p.City='Chennai' OR p.StateName='Tn')
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId

-------------------------------------------------------------------------
--Count based on city---
Select Count(*) As Count,StateName,City from Person group by StateName,City;

---------------------------------------------------------------------------
--Sort based on first name
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId ORDER BY p.FirstName ;
------------------------------------------------------------------------------
--Retreive based on person types---
SELECT COUNT(ptm.PersonTypeId) as Relations,pt.PersonType FROM
PersonTypesMap AS ptm 
INNER JOIN PersonTypes as pt On pt.PersonTypeId = ptm.PersonTypeId
INNER JOIN Person as p ON p.PersonId = ptm.PersonId GROUP BY Ptm.PersonTypeId,pt.PersonType;



  






