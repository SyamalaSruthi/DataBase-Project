create table Branch (branchNo varchar(4) NOT NULL PRIMARY KEY, street varchar(25), city varchar(15),postcode varchar(8));

create table Staff (staffNo varchar(4) PRIMARY KEY,fName varchar(25),IName varchar(25),position varchar(25),sex varchar(1), DOB date, salary int, branchNo varchar(4), FOREIGN KEY (branchNo) REFERENCES Branch(branchNo));

create table PropertyForRent (propertyNo varchar(4) PRIMARY KEY,street varchar(25), city varchar(15), postcode varchar(8),type varchar(25), 
	rooms integer,rent integer, ownerNo varchar(4), staffNo varchar(4),branchNo varchar(4),
	FOREIGN KEY (ownerNo) REFERENCES PrivateOwner(ownerNo),
	FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
	FOREIGN KEY (branchNo) REFERENCES Branch(branchNo));

create table Client(clientNo varchar(4) PRIMARY KEY, fName varchar(25), lName varchar(25),telNo varchar(12), prefType varchar(25), maxRent integer, email varchar(25));

create table PrivateOwner (ownerNo varchar(4) PRIMARY KEY, fName varchar(25),IName varchar(25), address varchar(50),telNo varchar(12),eMail varchar(25),password varchar(25));

create table Viewing (clientNo varchar(4),propertyNo varchar(4), viewDate Date,comment varchar(25),FOREIGN KEY (clientNo) REFERENCES Client(clientNo),FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo));

create table Registration(clientNo varchar(4),branchNo varchar(4),staffNo varchar(4),dateJoined Date,FOREIGN KEY (clientNo) REFERENCES Client(clientNo),FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),FOREIGN KEY (staffNo) REFERENCES Staff(staffNo));




create table Branch1 (branchNo varchar(4) NOT NULL PRIMARY KEY, bCity varchar(15));

create table PropertyForRent1 (propertyNo varchar(4) PRIMARY KEY,pCity varchar(15));




PROJECT TABLES: 
create table Store (storeId  varchar(4) NOT NULL PRIMARY KEY,street varchar(25),city varchar(15),state varchar(15),zipcode int(8));

create table Employee (employeeId varchar(4) PRIMARY KEY,eName varchar(25),sex varchar(1),position varchar(25), ePhone varchar(12), esalary int,startDate Date,endDate Date,password varchar(25), storeId varchar(4), FOREIGN KEY (storeId) REFERENCES Store(storeId));

create table Category (categoryId varchar(4) PRIMARY KEY,categoryName varchar(25));

create table Items (itemId varchar(4) PRIMARY KEY, ItemName varchar(25), description varchar(25), iCost float(3,2),iPrice float(3,2),iTaxrate float(3,2), categoryId varchar(4),FOREIGN KEY (categoryId) REFERENCES Category(categoryId));

create table Customer (customerId varchar(4) PRIMARY KEY,customerName varchar(25),sex varchar(1),customerPhone varchar(12));

create table Checkout (checkoutId varchar(4) PRIMARY KEY,storeId varchar(4),customerId varchar(4),employeeId varchar(4),checkoutDate Date);

create table CheckoutDetail (checkoutId varchar(4),itemId varchar(4),quantity int);

