SET GLOBAL local_infile=1;

use SkytechDB

load data local infile
'/Users/villalpando/Documents/AirDocs/Fall2020/Week5/HWDB/vendors_table' into table Vendors
fields terminated by ',' #column entries by ','
lines terminated by '\n' #newlines determine rows
;

load data local infile
'/Users/villalpando/Documents/AirDocs/Fall2020/Week5/HWDB/builders_table' into table Builders
fields terminated by ',' #column entries by ','
lines terminated by '\n' #newlines determine rows
;

load data local infile
'/Users/villalpando/Documents/AirDocs/Fall2020/Week5/HWDB/data_customers' into table Customers
fields terminated by ',' #column entries by ','
lines terminated by '\n' #newlines determine rows
;

load data local infile
'/Users/villalpando/Documents/AirDocs/Fall2020/Week5/HWDB/data_computers' into table Computers
fields terminated by ',' #column entries by ','
lines terminated by '\n' #newlines determine rows
;

load data local infile
'/Users/villalpando/Documents/AirDocs/Fall2020/Week5/HWDB/data_purchases' into table Purchases
fields terminated by ',' #column entries by ','
lines terminated by '\n' #newlines determine rows
;
