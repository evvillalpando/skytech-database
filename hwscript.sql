drop database if exists skytechdb;
create database skytechdb;
use skytechdb;

create table Customers (
  custID varchar(20) NOT NULL,
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
  PRIMARY KEY (serialNumber)
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
  Foreign Key (vendor) references Vendors(vendorName)
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

insert into Computers values (001, "Blaze 2", "2020-10-04", 1);
insert into Computers values (002, "Chronos", "2020-02-23", 2);
insert into Computers values (003, "Archangel", "2020-05-14", 1);

insert into Builders values (1, "Mohammed", "Night Shift");
insert into Builders values (2, "John", "Morning Shift");
insert into Builders values (3, "Joe", "Outsource");

insert into Customers values(1, "Bob1", "123 Fake S", "Denver", "CO", "bob1@gmail.com");
insert into Customers values(2, "Bob2", "123 Fake Ave", "Los Angeles", "CA", "bob2@gmail.com");
insert into Customers values(3, "Bob3", "123 Fake Dr", "Seattle", "WA", "bob3@gmail.com");

insert into Vendors values(1, "Amazon");
insert into Vendors values(2, "Newegg");
insert into Vendors values(3, "Best Buy");

insert into Purchases values(001, 1, "2020-10-06", 600, 1);
insert into Purchases values(002, 1, "2020-10-06", 1200, 1);
insert into Purchases values(003, 2, "2020-08-24", 1500, 3);

insert into RMADepartment values(1, "Ray");
insert into RMADepartment values(2, "Orlando");
insert into RMADepartment values(3, "Richard");

insert into RefundsAndRepairs values(001, "Repair", 1, "2020-09-04");
insert into RefundsAndRepairs values(001, "Refund", 1, "2020-09-05");
insert into RefundsAndRepairs values(003, "Refund", 3, "2020-09-24");


select 'running statement 1 as: ' 'describe Customers';
describe Customers;

select 'running statement 2 as: ' 'describe Computers';
describe Computers;

select 'running statement 3 as: ' 'describe Vendors';
describe Vendors;

select 'running statement 4 as: ' 'describe Purchases';
describe Purchases;

select 'running statement 5 as: ' 'describe Purchases';
describe RefundsAndRepairs;

select 'running statement 6 as: ' 'describe Purchases';
describe RMADepartment;

select 'running statement 7 as: ' 'describe Builders';
describe Builders;


select 'running statement 8 as: ' 'select statements';
select * from Purchases;
select * from Computers;
select * from RefundsAndRepairs;
