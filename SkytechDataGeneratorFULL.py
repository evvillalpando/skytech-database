import numpy as np

np.random.seed(1)

models = ["Blaze 1", "Blaze 2", "Chronos", "Chronos Mini", "Archangel",
		"Archangel 3", "Shadow 3", "Prism",
		"Legacy 2", "Blaze 3", "Venus", "Shiva"]

build_team = ["Night", "Day", "Outsource"]

states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
          "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
          "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
          "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
          "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

def dateCreate():
	'''
	function for generating a random date between 2018 and 2020
	'''
	year = np.random.randint(2018, 2020)
	month = np.random.randint(1,12)
	if month in [1, 3, 5, 7, 8, 10, 12]:
		day = np.random.randint(1, 31)
	elif month != 2:
		day = np.random.randint(1, 30)
	else:
		day = np.random.randint(1, 28)
	if month < 10:
		month = '0' + str(month)
	if day < 10:
		day = '0' + str(day)
	date = str(year) + '-' + str(month) + '-' + str(day)
	return(date)

# create the sailors data
num_customers = 10000
'''
Customers (
  custID int NOT NULL,
  cname varchar(20) NOT NULL,
  addressLine1 varchar(20) NOT NULL,
  city varchar(20) NOT NULL,
  state varchar(20) NOT NULL,
  email varchar(20) NOT NULL,
  primary key (custID)
'''
outfile = open("data_customers","w")
for i in range(1,num_customers+1):
	outString = ''
	outString += str(i)   # custID
	outString += ','
	outString += 'Bob'
	outString += str(i)   # name
	outString += ','
	address = str( np.random.randint(1000, 9999)) + " Fake " + np.random.choice(["Ave", "St", "Blvd", "Dr" ])
	outString += address  # address
	outString += ','
	city = "Fake " + np.random.choice(["Town", "City", "Village"])
	outString += city   # city
	outString += ','
	state = np.random.choice(states)
	outString += state	# state
	outString += ','
	email = 'Bob' + str(i) + "@yeehaw.com"
	outString += email
	outString += "\n"
	outfile.write(outString)
outfile.close()

'''
Computers
  serialNumber int,
  modelName varchar(20) NOT NULL,
  buildDate date NOT NULL,
  builderID int,
  PRIMARY KEY (serialNumber)
  FOREIGN KEY (builderID)
'''
outfile = open("data_computers", "w")
for i in range(1, num_customers+1):
	outString = ''
	outString += str(i) #serialNumber
	outString += ','
	model = np.random.choice(models)
	outString += model #modelName
	outString += ','
	date = dateCreate()
	outString += date #buildDate
	outString += ','
	builderID = str(np.random.randint(1, 10)) #builderID
	outString += builderID
	outString += "\n"
	outfile.write(outString)
outfile.close()

available_serials = set(range(1,num_customers+1))
vendors = ["Amazon", "Newegg", "Google", "Best Buy", "EBay", "Wal-Mart", "Rent-a-Center"]

'''
Purchases
  serialNumber int,
  custID int,
  purchaseDate date,
  price float,
  vendorName varchar(20),
  PRIMARY KEY (serialNumber, custID),
  Foreign Key (serialNumber) references Computers(serialNumber),
  Foreign Key (custID) references Customers(custID),
  Foreign Key (vendorName) references Vendors(vendorName)
'''
outfile = open("data_purchases", "w")
for i in range(1, num_customers +1):
	outString = ''
	serialNumber = np.random.choice(tuple(available_serials))
	available_serials.remove(serialNumber)
	outString += str(serialNumber) #serialNumber
	outString += ','
	custID = np.random.randint(1,10001)
	outString += str(custID) #custID
	outString += ','
	purchaseDate = dateCreate()
	outString += str(purchaseDate) #purchaseDate
	outString += ','
	price = round(np.random.uniform(600.00, 4001.00), 2)
	outString += str(price) #price
	outString += ','
	vendor = np.random.choice(vendors)
	outString += vendor #vendorName
	outString += '\n'
	outfile.write(outString)
outfile.close()

'''
Vendors
	vendorName varchar(20) NOT NULL,
	PRIMARY KEY (vendorName)
'''
outfile = open("vendors_table", "w")
for i in vendors:
	outString = i +'\n'
	outfile.write(outString)
outfile.close()

'''
Builders
  builderID int,
  name varchar(20),
  buildTeam varchar(20),
  Primary Key (builderID)
'''
outfile = open("builders_table", "w")
for i in range(1,10):
	outString = str(i) #builderID
	outString += ','
	outString += 'Joe' + str(i) #name
	outString += ','
	outString += np.random.choice(build_team) #buildTeam
	outString += '\n'
	outfile.write(outString)
outfile.close()
