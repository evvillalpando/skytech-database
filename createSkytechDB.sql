drop database if exists skytechdb;
create database skytechdb;
use skytechdb;

create table Customers (
  custID int NOT NULL,
  cname varchar(20) NOT NULL,
  addressLine1 varchar(20) NOT NULL,
  city varchar(20) NOT NULL,
  state varchar(20) NOT NULL,
  email varchar(20) NOT NULL,
  primary key (custID)
);

create table Builders (
  builderID int,
  name varchar(20),
  buildTeam varchar(20),
  Primary Key (builderID)
);

create table Vendors(
vendorName varchar(20) NOT NULL,
PRIMARY KEY (vendorName)
);

create table RMADepartment (
  rmaEmployeeID int,
  name varchar(20),
  Primary Key (rmaEmployeeID)
);

create table Computers (
  serialNumber int,
  modelName varchar(20) NOT NULL,
  buildDate date NOT NULL,
  builderID int,
  PRIMARY KEY (serialNumber),
  FOREIGN KEY (builderID) references Builders(builderID)
);

create table Purchases (
  serialNumber int,
  custID int,
  purchaseDate date,
  price float,
  vendorName varchar(20),
  PRIMARY KEY (serialNumber, custID),
  Foreign Key (serialNumber) references Computers(serialNumber),
  Foreign Key (custID) references Customers(custID),
  Foreign Key (vendorName) references Vendors(vendorName)
);

create table RefundsAndRepairs (
  serialNumber int,
  rmaType varchar(10),
  rmaEmployeeID int,
  dateProcessed date,
  Primary Key (serialNumber, rmaType),
  Foreign Key (serialNumber) references Computers(serialNumber),
  Foreign Key (rmaEmployeeID) references RMADepartment(rmaEmployeeID)
);
