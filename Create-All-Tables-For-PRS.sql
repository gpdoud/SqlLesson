use master;
go
drop database if exists prssql;
go
create database prssql;
go
use prssql;
go
create table [User] (
	Id int not null primary key identity(1,1),
	Username nvarchar(30) not null,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(255) not null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Active bit not null default 1
);
go
create unique index uix_username on [User](Username);
go
create table Vendor(
Id  INT not null Primary key Identity(1,1),
Code  NVARCHAR(30) NOT NULL,
Name  NVARCHAR(255) NOT NULL,
Address NVARCHAR(255) NOT NULL,
City  NVARCHAR(255) NOT NULL,
State NVARCHAR(2) NOT NULL,
Zip NVARCHAR(5) NOT NULL,
Phone NVARCHAR(12) NOT NULL,
Email NVARCHAR(255) NOT NULL,
IsPreApproved BIT,
Active  BIT
);
go
Create Unique Index uix_code on Vendor(code);
go
Create Table Product (
Id  INT not null Primary Key Identity(1,1),
VendorId  INT NOT NULL Foreign Key references Vendor(Id),
PartNumber  NVARCHAR(50) NOT NULL,
Name  NVARCHAR(150) not null,
Price DECIMAL(10,2) not null default 10,
Unit  NVARCHAR(25) not null default 'Each',
PhotoPath NVARCHAR(255),
Active  BIT not null default 1
);
go
create unique index uix_PartNumber on Product(PartNumber);
go
CREATE TABLE PurchaseRequest (
Id  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
UserId  INT not null foreign key references [user](id),
Description NVARCHAR(100) NOT NULL,
Justification NVARCHAR(255),
DeliveryMode  NVARCHAR(25) NOT NULL,
Status  NVARCHAR(10) not null DEFAULT 'NEW',
Total DECIMAL(10,2) NOT NULL DEFAULT 0,
Active  BIT not null DEFAULT 1,
ReasonForRejection  NVARCHAR(100)
);
go
create table PurchaseRequestLineitem (
Id  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
PurchaseRequestId INT FOREIGN KEY REFERENCES PURCHASEREQUEST(Id) NOT NULL,
ProductId INT FOREIGN KEY REFERENCES PRODUCT(id) NOT NULL,
Quantity  INT not null default 1,
Active  BIT not null default 1
);
go