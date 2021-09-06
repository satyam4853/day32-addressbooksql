--UC1 Create Databse AddressBook
Create Database AddressBook
use AddressBook


--UC2 Create AddressBook Table
create table Address_Book_Table(FirstName varchar(20) not null,
LastName varchar(20),
Address varchar(100),
City varchar(20),
StateName varchar(25),
ZipCode int,
Phonenum bigint,
EmailId varchar(20)
)


--UC3 Insert Contacts in Addressbook
Insert into Address_Book_Table values('Satyam','Vaishnav','Parvati,Pune','Pune','Maharshtra',414009,8446019597,'abc@gmail.com'),
('Shreyas','Shinde','kineticChowk','Ahmednagar','Maharashtra',414001,9863457815,'qwer@gmail.com'),
('Rushikesh','Badhe','townpark','amravti','Maharshtra',431550,9011519390,'rushi@gmail.com')
select * from Address_Book_Table


--UC4 Ability to edit existing contact person using their name
Update Address_Book_Table set City = 'Ahmednagar' where FirstName = 'Satyam'
Update Address_Book_Table set EmailId = 'shreyas@gmail.com' where FirstName = 'Shreyas'
Update Address_Book_Table set Phonenum = '8830753557' where FirstName = 'Rushikesh'
select * from Address_Book_Table


--U5 Ability to delete a person using person's name
delete from Address_Book_Table where FirstName = 'Shreyas'
select * from Address_Book_Table


--UC6 Ability to Retrieve Person belonging to a City or State from the Address Book
Select * from Address_Book_Table where City='Ahmednagar' or StateName='Maharshtra'


--UC7 Ability to understand the size of addressbook by City and State
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City


--UC8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city
Select * from Address_Book_Table city where city ='Ahmednagar' order by FirstName ASC
select * from Address_Book_Table


--UC9  Ability to identify each Address Book with name and Type.
Insert into Address_Book_Table values('Anmol','Munne','Katol','Katol','Maharshtra',434001,9876459588,'anmol@gmail.com') 
Insert into Address_Book_Table values('Krishna','Hedda','Pablepark','Usmanabaad','Maharshtra',434002,9889764455,'krishna@gmail.com') 
Insert into Address_Book_Table values('Akash','Bharsakle','LodhaAvenue','Mumbai','Maharshtra',434003,7788445566,'akash@gmail.com')
Insert into Address_Book_Table values('Rahul','jadhav','RadheApart','Sangli','Maharshtra',434052,9456978821,'rahul@gmail.com')
ALTER TABLE Address_Book_Table ADD 
AdressBookName varchar(50),AbType varchar(20);

ALTER TABLE Address_Book_Table ADD 
AdressBookName varchar(50) 

UPDATE  Address_Book_Table SET
AdressBookName='FamilyAddressBook' , AbType = 'Family' 
WHERE
FirstName ='Satyam' or FirstName='Anmol'

UPDATE  Address_Book_Table SET
AdressBookName='FriendAddressBook' , AbType = 'Friend' 
WHERE
FirstName ='Satyam' or FirstName='Rushikesh'
select * from Address_Book_Table 

UPDATE  Address_Book_Table SET
AdressBookName='ProfessionAddressBook' , AbType = 'Profession' 
WHERE
FirstName ='Rushikesh' or FirstName='Krishna'


--UC10 Ability to get number of contact persons
Select count(*)as CountAbType, AbType  from Address_Book_Table group by AbType
Select count(*)as CountAbNames, AdressBookName  from Address_Book_Table group by AdressBookName

--UC11 ability to add person in family and type 
Insert into Address_Book_Table values ('Ali','Tamboli','girechowk','narayangaon','Maharshtra',414334,8877994445,'ali@gmail.com','Family','FamilyAddressBook' )
select * from Address_Book_Table



