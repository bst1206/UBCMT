CREATE TABLE IF NOT EXISTS CUSTOMER_TABLE 
( 
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	firstname			VARCHAR(30), 
	lastname			VARCHAR(30),
	companyName			VARCHAR(30),
	physicalAddrStreet	VARCHAR(100),
	physicalAddrCity	VARCHAR(50),
	physicalAddrState	VARCHAR(2),
	physicalAddrZip		VARCHAR(10),
	billingAddrStreet	VARCHAR(100),
	billingAddrCity		VARCHAR(50),
	billingAddrState	VARCHAR(2),
	billingAddrZip		VARCHAR(10),
	contactPhone		VARCHAR(15),
	workPhone			VARCHAR(15),
	email				VARCHAR(50),
	machineModelNum		VARCHAR(20),
	machineSerialNum	VARCHAR(20),
	lastUpdated			DATE,
	notes				VARCHAR(500)
);