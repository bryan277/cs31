DROP DATABASE IF EXISTS gp_tables;

CREATE DATABASE gp_tables;

USE gp_tables;

CREATE TABLE EMPLOYEE (
	EmployyeeID	       	Integer 	    	NOT NULL,
	EmployyeeName       Varchar	(255) 	    NOT NULL,	-- Name to EmployyeeName
	EmpPosition	        Varchar (255)       NOT NULL,	-- Position to EmpPosition
	Manager    	  		Varchar (255) 	    NOT NULL,   
	YearsOfService     	Datetime 	    	NOT NULL,   -- I entered the starting date.
	SocialSecurity   	Varchar (9)    		NOT NULL,
    Salary				Float				NOT NULL,
    Bonus				Float				NULL,
	CONSTRAINT 		    EMPLOYYEE_PK 		PRIMARY KEY (EmployyeeID)
	);
    
CREATE TABLE BADGE (
	BadgeID	       	Integer 	    	NOT NULL,
    EmployyeeID		Integer				NOT NULL,
    Clearance		Varchar (45)		NOT NULL,
    CONSTRAINT		BADGE_PK			PRIMARY KEY (EmployyeeID, BadgeID),
    CONSTRAINT 		BADGE_EMP_FK 		FOREIGN KEY (EmployyeeID)
							REFERENCES  EMPLOYEE (EmployyeeID)
	);
    
CREATE TABLE INSURANCE (
	InsuranceNo	       	Integer 	    	NOT NULL,
    Vin					Varchar (17)		NOT NULL,
    InvoiceNo			Integer 			NOT NULL, -- There is no primary key for InvoiceNO?
    CarCondition		Varchar (255) 		NOT NULL, 
    RepairType			Varchar (255) 		NOT NULL,
    CONSTRAINT			INSURANCE_PK		PRIMARY KEY (Vin, InsuranceNo)
);
    

CREATE TABLE CAR (
	Vin       			Varchar (17) 	    NOT NULL,	-- Int to Varchar (17)
	Model       		Varchar (255) 	    NOT NULL,
	Make          		Varchar (255)       NOT NULL,
	Color    	  		Varchar (255) 	    NOT NULL,
	LicenseNumber     	Varchar (255) 	    NOT NULL,
	SizeType  	    	Varchar (255)    	NOT NULL,
    InsuranceNo			Integer     		NOT NULL,
    DateReserved		Datetime			NOT NULL,
	Availabe 			Tinyint (1)			NULL,
	CONSTRAINT 		    CAR_PK 				PRIMARY KEY (Vin),
	CONSTRAINT			CAR_INS_FK			FOREIGN KEY (Vin, InsuranceNo)
 								REFERENCES INSURANCE (Vin, InsuranceNo)
);

CREATE TABLE INVENTORY (
	ParkingSpaceNo	       	Integer 	    	NOT NULL,
    Vin						Varchar (17)		NOT NULL,
    DateUse					Datetime			NOT NULL,
    DateReturn				Datetime			NOT NULL,
    Available				Tinyint(1)			NULL,
    CONSTRAINT 				INVENTORY_PK		PRIMARY KEY (Vin, ParkingSpaceNo),
    CONSTRAINT				INVENTORY_VIN_FK	FOREIGN KEY	(Vin)
									REFERENCES CAR (Vin)
);

CREATE TABLE RENTALPRICE (
		SizeType 		Integer  			NOT NULL,
        Price			Float				NULL,
        Vin				Varchar (17)		NOT NULL,
        CONSTRAINT 		RENTAL_PK			PRIMARY KEY (Vin),
        CONSTRAINT		RENTAL_VIN_FK		FOREIGN KEY (Vin)
									REFERENCES CAR (Vin)
);

CREATE TABLE MAINTENANCE (
	MaintenanceNo 		Integer  			NOT NULL,
    DateOfService		Datetime			NOT NULL,
    Vin					Varchar (17) 		NOT NULL,
    Mileage				Integer			 	NULL,
    TypeOfService 		Varchar (255)		NOT NULL,
    MaintComment		Varchar (255)		NOT NULL,
    CONSTRAINT			MAINTENANCE_PK		PRIMARY KEY (Vin, MaintenanceNo),
	CONSTRAINT			MAINTENANCE_VIN_FK	FOREIGN KEY (Vin)
									REFERENCES CAR (Vin)
);

CREATE TABLE CUSTOMER (
	CustomerID			Integer 			NOT NULL,
    CustomerName		Varchar (255)		NOT NULL,	-- Name to customer
    Address 			Varchar (255)		NOT NULL,
    DriverLicense		Varchar (255)		NOT NULL,
    Phone				Varchar (12) 		NOT NULL,
    CONSTRAINT			CUSTOMER_PK			PRIMARY KEY (CustomerID)
);


CREATE TABLE INVOICE (
	InvoiceNo			Integer				NOT NULL,
    Price				Float				NULL,        -- int to float
    DateCheckout		Datetime			NOT NULL,
    Gas					Decimal				NULL,
    CustomerID			Integer				NOT NULL,
    InsuranceNo			Integer				NOT NULL,
    Vin					Varchar (17)		NOT NULL,
    EmployeeID			Integer				NOT NULL,
    CONSTRAINT			INVOICE_PK			PRIMARY KEY (InvoiceNo, CustomerID, InsuranceNo, Vin, EmployeeID),
    CONSTRAINT			INVOICE_CUS_FK		FOREIGN KEY (CustomerID)
									REFERENCES CUSTOMER (CustomerID),
    CONSTRAINT			INVOICE_INS_FK		FOREIGN KEY (Vin, InsuranceNo)
									REFERENCES INSURANCE (Vin, InsuranceNo),
	CONSTRAINT			INVOICE_VIN_FK		FOREIGN KEY (Vin)
									REFERENCES CAR (Vin),
	CONSTRAINT			INVOICE_EMP_FK		FOREIGN KEY (EmployeeID)
									REFERENCES EMPLOYEE (EmployyeeID)
);


INSERT INTO CAR VALUES (
	'5XYKWDA74EG536509', 'GT-R', 'Nissan', 'White', '7BZV628', 'Sedan', 12324, '2018-01-14 09:30:00
',1);

INSERT INTO CAR VALUES (
	'5FNYF3H23EB079746', 'ACURA', 'Tsx', 'Silver', '7BZV690', 'Sedan', 12433, '2018-01-14 09:35:00
',1);

INSERT INTO CAR VALUES (
	'5NPE34AF2FH023783', 'BMW', 'M3', 'Black', '7CSN910', 'Sedan', 69342, '2018-01-14 09:35:00
',2);

INSERT INTO CAR VALUES (
	'3GKEC16Z96G247342', 'Toyota', 'Tundra', 'White', '7BXP323', 'Truck', 23456, '2018-01-14 09:35:00
',1);

INSERT INTO CAR VALUES (
	'1GTEK14X75Z242025', 'Toyota', 'Tundra', 'Silver', '7CDK216', 'Truck', 86435, '2018-01-14 09:35:00
',1);



INSERT INTO EMPLOYEE VALUES (
	46, 'Arthur Morgan', 'Agent', 'No', '2015-01-14 09:30:00','558515277', 37000.00, null);
 
INSERT INTO EMPLOYEE VALUES (
	45, 'Bradley Vega', 'Agent', 'No', '2014-02-15 09:30:00','257423423', 35000.00, null);

INSERT INTO EMPLOYEE VALUES (
	23, 'Martin E. Mayes', 'Manager', 'Yes', '2010-03-1 09:30:00','517481234', 60000.00, null);

 
INSERT INTO BADGE VALUES (
	1, 46, 'No clearance required'
);
INSERT INTO BADGE VALUES (
	2, 45, 'No clearance required'
);
INSERT INTO BADGE VALUES (
	3, 23, 'No clearance required'
);



INSERT INTO INVENTORY VALUES ( 
	1, '5XYKWDA74EG536509', '2018-01-14 09:30:00', '2018-01-15 09:28:00', 1
);
INSERT INTO INVENTORY VALUES ( 
	2, '5FNYF3H23EB079746', '2018-01-14 09:30:00', '2018-01-15 09:28:00', 1
);
INSERT INTO INVENTORY VALUES ( 
	3, '5NPE34AF2FH023783', '2018-01-14 09:30:00', '2018-01-15 09:28:00', 1
);
INSERT INTO INVENTORY VALUES ( 
	4, '3GKEC16Z96G247342', '2018-01-14 09:30:00', '2018-01-15 09:28:00', 1
);
INSERT INTO INVENTORY VALUES ( 
	5, '1GTEK14X75Z242025', '2018-01-14 09:30:00', '2018-01-15 09:28:00', 1
);

CREATE TABLE INSURANCE (
	InsuranceNo	       	Integer 	    	NOT NULL,
    Vin					Varchar (17)		NOT NULL,
    InvoiceNo			Integer 			NOT NULL, -- There is no primary key for InvoiceNO?
    CarCondition		Varchar (255) 		NOT NULL, 
    RepairType			Varchar (255) 		NOT NULL,
    CONSTRAINT			INSURANCE_PK		PRIMARY KEY (Vin, InsuranceNo)
);


INSERT INTO INSURANCE VALUES (
	1876574569, '5XYKWDA74EG536509', 2, 'Flawless', 'No repairment required' 
);
INSERT INTO INSURANCE VALUES (
	1435645754, '5FNYF3H23EB079746', 2, 'Flawless', 'No repairment required' 
);
INSERT INTO INSURANCE VALUES (
	1875678452, '5NPE34AF2FH023783', 2, 'Flawless', 'No repairment required' 
);
INSERT INTO INSURANCE VALUES (
	1786758653, '3GKEC16Z96G247342', 2, 'Flawless', 'No repairment required' 
);
INSERT INTO INSURANCE VALUES (
	1987644532, '1GTEK14X75Z242025', 2, 'Flawless', 'No repairment required' 
);


INSERT INTO MAINTENANCE VALUES (
	1, '2018-01-01 09:30:00', '5XYKWDA74EG536509', 1001, 'No service required', 'No comment'
);
INSERT INTO MAINTENANCE VALUES (
	2, '2018-01-02 09:30:00', '5FNYF3H23EB079746', 14092, 'Oil change', 'No comment'
);
INSERT INTO MAINTENANCE VALUES (
	3, '2018-01-03 09:30:00', '5NPE34AF2FH023783', 11001, 'Oil change', 'No comment'
);
INSERT INTO MAINTENANCE VALUES (
	4, '2018-01-04 09:30:00', '3GKEC16Z96G247342', 1871, 'No service required', 'No comment'
);
INSERT INTO MAINTENANCE VALUES (
	5, '2018-01-05 09:30:00', '1GTEK14X75Z242025', 30005, 'Replaced brakes, oil change', 'New brake pads that should last for the next 40,000 miles'
);

INSERT INTO CUSTOMER VALUES (
	3543, 'Jason Bourne', '212 Castle St, Anaheim CA 92833', 'X9570908', '202-555-0153');

INSERT INTO CUSTOMER VALUES (
	2343, 'Frances Hawks', '4433 Goldie Lane, Anaheim CA 92823', 'O2590506', '513-463-7896');
 
 
 
-- CREATE TABLE INVOICE (
-- 	InvoiceNo			Integer				NOT NULL,
--     Price				Float				NULL,        -- int to float
--     DateCheckout		Datetime			NOT NULL,
--     Gas					Decimal				NULL,
--     CustomerID			Integer				NOT NULL,
--     InsuranceNo			Integer				NOT NULL,
--     Vin					Varchar (17)		NOT NULL,
--     EmployeeID			Integer				NOT NULL,
--     CONSTRAINT			INVOICE_PK			PRIMARY KEY (InvoiceNo, CustomerID, InsuranceNo, Vin, EmployeeID),
--     CONSTRAINT			INVOICE_CUS_FK		FOREIGN KEY (CustomerID)
-- 									REFERENCES CUSTOMER (CustomerID),
--     CONSTRAINT			INVOICE_INS_FK		FOREIGN KEY (Vin, InsuranceNo)
-- 									REFERENCES INSURANCE (Vin, InsuranceNo),
-- 	CONSTRAINT			INVOICE_VIN_FK		FOREIGN KEY (Vin)
-- 									REFERENCES CAR (Vin),
-- 	CONSTRAINT			INVOICE_EMP_FK		FOREIGN KEY (EmployeeID)
-- 									REFERENCES EMPLOYEE (EmployyeeID)
-- );


INSERT INTO INVOICE VALUES (
	1, 29.99, '2018-01-14 09:45:00', 35, 1, 1, '5XYKWDA74EG536509', 123
);
-- For error 1452. Create new sql file and type in SET FOREIGN_KEY_CHECKS=0;


