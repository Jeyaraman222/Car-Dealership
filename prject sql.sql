		-- CREATING DATABASE --
   
CREATE DATABASE CAR_PROJECT;
USE CAR_PROJECT;

		-- TABLE CREATING DEALERS,EMPLOYEES,CARS,CUSTOMERS,SALES,PAYMENTS,SERVICE DETAILS

CREATE TABLE DEALERS(
	DEALER_ID INT PRIMARY KEY,
    DEALER_NAME VARCHAR(40) NOT NULL,
    CONTACT_NUMBER VARCHAR(40),
	EMAIL VARCHAR(15),
    ADDRESS VARCHAR(100)
);

CREATE TABLE EMPLOYEES (
	EMP_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(40) NOT NULL,
    LAST_NAME VARCHAR(40) NOT NULL,
	POSITION VARCHAR (40),
    PHONE_NUMBER VARCHAR (15),
    EMAIL VARCHAR (40),
    DEALER_ID INT,
    FOREIGN KEY (DEALER_ID) REFERENCES DEALERS(DEALER_ID)
);

CREATE TABLE CARS (
	CAR_ID INT PRIMARY KEY,
    BRAND VARCHAR (40) NOT NULL,
    MODEL VARCHAR (40) NOT NULL,
    YEAR INT NOT NULL,
    PRICE  DECIMAL(10,2) NOT NULL,
    MILEAGE INT NOT NULL,
    DEALER_ID INT,
    FOREIGN KEY (DEALER_ID) REFERENCES DEALERS (DEALER_ID)
);

CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT PRIMARY KEY ,
    FIRST_NAME VARCHAR(40) NOT NULL,
    LAST_NAME VARCHAR(40) NOT NULL,
    EMAIL VARCHAR (50),
    PHONE_NUMBER VARCHAR (15),
    ADDRESS VARCHAR (100),
    CITY VARCHAR(50)
);

	
CREATE TABLE SALES (
	SALE_ID INT PRIMARY KEY ,
	SALE_DATE DATE NOT NULL,
    CUSTOMER_ID INT,
    CAR_ID INT,
    SALES_PERSON_ID INT,
    DEALER_ID INT ,
    SALE_PRICE DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (CAR_ID) REFERENCES CARS(CAR_ID),
    FOREIGN KEY (SALES_PERSON_ID) REFERENCES EMPLOYEES(EMP_ID),
    FOREIGN KEY (DEALER_ID) REFERENCES DEALERS(DEALER_ID)
);

CREATE TABLE PAYMENTS (
	PAYMENT_ID INT PRIMARY KEY,
    SALE_ID INT ,
    PAYMENT_AMOUNT DECIMAL (10,2) NOT NULL,
    PAYMENT_METHOD DECIMAL (10,2) NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    FOREIGN KEY (SALE_ID) REFERENCES SALES (SALE_ID)
);

CREATE TABLE SERVICERECORDS (
	SERVICE_ID INT PRIMARY KEY ,
    CAR_ID INT,
    SERVICE_DATE DATE NOT NULL,
    SERVICE_DETAILS VARCHAR (250),
    SERVICE_COST DECIMAL (10,2) NOT NULL ,
    SERVICE_CENTER VARCHAR (100),
    FOREIGN KEY (CAR_ID) REFERENCES CARS(CAR_ID)
);

ALTER TABLE DEALERS
MODIFY COLUMN EMAIL VARCHAR (60);
					
                    -- INSERTING DATAS    
                    
INSERT INTO DEALERS ( DEALER_ID,DEALER_NAME,CONTACT_NUMBER,EMAIL,ADDRESS) VALUES
  (1, 'Shree Motors', '+91 78372 82874', 'contact@shreemotors.in', 'New Delhi, Delhi, India'),
  (2, 'Bharat Autos', '+91 99633 74849', 'info@bharatautos.in', 'Mumbai, Maharashtra, India'),
  (3, 'Vishal Cars', '+91 87644 83983', 'support@vishalcars.in', 'Kolkata, West Bengal, India'),
  (4, 'Surya Auto Sales', '+91 73829 37749', 'sales@suryaautos.in', 'Hyderabad, Telangana, India'),
  (5, 'Ravi Motors', '+91 74847 74587', 'ravi.motors@inbox.com', 'Chennai, Tamil Nadu, India'),
  (6, 'Santoshi Autos', '+91 89463 27623', 'info@santoshiautos.in', 'Ahmedabad, Gujarat, India'),
  (7, 'Mahindra Motors', '+91 83936 26327', 'contact@mahindramotors.in', 'Pune, Maharashtra, India'),
  (8, 'Indira Cars', '+91 83924 42798', 'support@indiracars.in', 'Bengaluru, Karnataka, India'),
  (9, 'Raj Autos', '+91 98784 37487', 'sales@rajautos.in', 'Chennai, Tamil Nadu, India'),
  (10, 'Shree Auto Works', '+91 78744 56789', 'contact@shreeautoworks.in', 'Mumbai, Maharashtra, India');


INSERT INTO EMPLOYEES (EMP_ID,FIRST_NAME,LAST_NAME,POSITION,PHONE_NUMBER,EMAIL,DEALER_ID) VALUES
  (101, 'Arjun', 'Sharma', 'Sales Manager', '+91 95201 23783', 'arjunsharma@gmail.com', 1),
  (102, 'Sanya', 'Mehta', 'Sales Executive', '+91 99002 23490', 'sanyamehta@gmail.com', 2),
  (103, 'Rahul', 'Verma', 'Service Technician', '+91 93603 20056', 'rahulverma@gmail.com', 3),
  (104, 'Kavya', 'Patel', 'Finance Manager', '+91 99904 23066', 'kavyapatel@gmail.com', 4),
  (105, 'Vikram', 'Gupta', 'Sales Executive', '+91 99025 20896', 'vikramgupta@gmail.com', 5),
  (106, 'Neha', 'Desai', 'Marketing Manager', '+91 89006 89056', 'nehadesai@gmail.com', 1),
  (107, 'Rohan', 'Yadav', 'Service Advisor', '+91 95607 83400', 'rohanyadav@gmail.com', 2),
  (108, 'Priya', 'Singh', 'HR Manager', '+91 78908 00456', 'priyasingh@gmail.com', 3),
  (109, 'Nikhil', 'Kumar', 'Sales Executive', '+91 88009 23458', 'nikhilkumar@gmail.com', 4),
  (110, 'Anjali', 'Patel', 'Finance Manager', '+91 90010 98404', 'anjalipatel@gmail.com', 5),
  (111, 'Arjun', 'Sharma', 'Sales Manager', '+91 9876543210', 'arjun.sharma@gmail.com', 3),
  (112, 'Priya', 'Verma', 'Finance Manager', '+91 9123456789', 'priya.verma@gmail.com', 5),
  (113, 'Raj', 'Kumar', 'Sales Executive', '+91 9432145678', 'raj.kumar@gmail.com', 2),
  (114, 'Neha', 'Patel', 'HR Manager', '+91 9988776655', 'neha.patel@gmail.com', 6),
  (115, 'Vinay', 'Gupta', 'Sales Technician', '+91 9612345678', 'vinay.gupta@gmail.com', 4),
  (116, 'Sanjana', 'Mehta', 'Sales Manager', '+91 9345678901', 'sanjana.mehta@gmail.com', 1),
  (117, 'Vikram', 'Yadav', 'HR Manager', '+91 9812345670', 'vikram.yadav@gmail.com', 7),
  (118, 'Sanya', 'Joshi', 'Sales Executive', '+91 9256789012', 'sanya.joshi@gmail.com', 9),
  (119, 'Amit', 'Singh', 'Finance Manager', '+91 9223344556', 'amit.singh@gmail.com', 8),
  (120, 'Deepak', 'Rao', 'Sales Executive', '+91 9201122334', 'deepak.rao@gmail.com', 10);

INSERT INTO CARS (CAR_ID, BRAND, MODEL, YEAR, PRICE, MILEAGE, DEALER_ID) VALUES
  (1001, 'Toyota', 'Camry', 2023, 1285000.00, 22, 1),
  (1002, 'Honda', 'Accord', 2022, 800000.00, 20, 2),
  (1003, 'Ford', 'F-150', 2024, 700000.00, 15, 3),
  (1004, 'Chevrolet', 'Corvette', 2023, 1000000.00, 12, 4),
  (1005, 'Tesla', 'Model 3', 2023, 900000.00, 112, 5),
  (1006, 'BMW', 'M3', 2023, 200000.00, 13, 6),
  (1007, 'Benz', 'S-Class', 2023, 1800000.00, 10, 7),
  (1008, 'Porsche', '911', 2023, 2800000.00, 12, 8),
  (1009, 'Lamborghini', 'Aventador', 2023, 4500000.00, 10, 9),
  (1010, 'Ferrari', '488 Pista', 2023, 3500000.00, 15, 10),
  (1011, 'Nissan', 'Versa', 2025, 1833000.00, 30,2),
  (1012, 'Kia', 'Forte', 2024, 2114500.00, 32,6),
  (1013, 'Hyundai', 'Venue', 2025, 2139500.00, 31,8),
  (1014, 'Chevrolet', 'Trax', 2025, 2149500.00, 30,4),
  (1015, 'Kia', 'Soul', 2025, 2166500.00, 30,8),
  (1016, 'Toyota', 'Camry', 2025, 2680000.00, 28,2),
  (1017, 'Honda', 'Accord', 2025, 2799500.00, 30,1),
  (1018, 'Ford', 'F-150 XL', 2024, 4194000.00, 21,1),
  (1019, 'Toyota', 'Tacoma', 2024, 3449500.00, 23,6),
  (1020, 'Chevrolet', 'Silverado 1500', 2024, 5195000.00, 20,9),
  (1021, 'Mazda', 'CX-5', 2024, 2959500.00, 28,10),
  (1022, 'Subaru', 'Outback', 2024, 2890000.00, 30,10),
  (1023, 'BMW', '3 Series', 2024, 4560000.00, 26,1),
  (1024, 'Audi', 'Q5', 2024, 4620000.00, 25,4),
  (1025, 'Ford', 'Escape', 2024, 2949500.00, 29,8),
  (1026, 'Tesla', 'Model 3', 2024, 3999000.00, 130,5),
  (1027, 'Mercedes-Benz', 'C-Class', 2024, 4720000.00, 26,9),
  (1028, 'Lexus', 'RX 350', 2024, 4930000.00, 25,3),
  (1029, 'Volkswagen', 'Tiguan', 2024, 2860000.00, 28,4),
  (1030, 'Hyundai', 'Sonata', 2024, 2630000.00, 32,7),
  (1031, 'Toyota', 'Corolla Hybrid', 2024, 2340000.00, 52,2),
  (1032, 'Honda', 'Civic Sport', 2024, 2590000.00, 33,8),
  (1033, 'Chevrolet', 'Blazer EV', 2024, 4560000.00, 92,9),
  (1034, 'Ford', 'Explorer', 2024, 3950000.00, 24,10),
  (1035, 'Hyundai', 'Palisade', 2024, 3550000.00, 22,6),
  (1036, 'Jeep', 'Wrangler', 2024, 3410000.00, 20,3),
  (1037, 'Nissan', 'Pathfinder', 2024, 3660000.00, 23,3),
  (1038, 'Mercedes-Benz', 'GLB 250', 2024, 4300000.00, 25,6),
  (1039, 'Tesla', 'Model Y', 2024, 4799000.00, 129,8),
  (1040, 'Volvo', 'XC60', 2024, 4560000.00, 28,10);
  
  --  ADDING MORE CAR LIST FOR AVAILABLE CARS --
INSERT INTO CARS (CAR_ID, BRAND, MODEL, YEAR, PRICE, MILEAGE, DEALER_ID) VALUES  
(1041, 'BMW', 'X5', 2020, 4200000.00, 12.5, 3),
(1042, 'Mercedes', 'GLE', 2021, 3850000.50, 14.0, 7),
(1043, 'Audi', 'Q7', 2022, 4590000.75, 13.5, 2),
(1044, 'Jaguar', 'F-Pace', 2023, 3400000.25, 15.0, 5),
(1045, 'Volvo', 'XC90', 2024, 3900000.80, 16.0, 4),
(1046, 'Lexus', 'RX500h', 2020, 3200000.90, 11.8, 1),
(1047, 'Land Rover', 'Discovery', 2021, 4700000.60, 10.5, 8),
(1048, 'Ford', 'Endeavour', 2022, 2950000.40, 18.0, 6),
(1049, 'Toyota', 'Fortuner Legender', 2023, 3000000.00, 19.5, 10),
(1050, 'Jeep', 'Grand Cherokee', 2024, 3500000.20, 17.0, 9),
(1051, 'Hyundai', 'Tucson', 2021, 2200000.00, 15.3, 2),
(1052, 'Kia', 'Seltos', 2020, 2100000.25, 17.8, 6),
(1053, 'Honda', 'CR-V', 2023, 2800000.50, 14.5, 4),
(1054, 'Nissan', 'X-Trail', 2022, 3250000.75, 12.9, 5),
(1055, 'Volkswagen', 'Tiguan', 2024, 3600000.90, 16.2, 3),
(1056, 'Renault', 'Koleos', 2021, 2400000.40, 15.0, 7),
(1057, 'Skoda', 'Kodiaq', 2023, 4300000.10, 11.5, 9),
(1058, 'Tata', 'Harrier', 2022, 2900000.20, 18.2, 8),
(1059, 'MG', 'Gloster', 2020, 3400000.60, 10.9, 1),
(1060, 'Mahindra', 'XUV700', 2024, 2700000.30, 19.0, 10);
  
INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, CITY)
VALUES
  (201, 'Amit', 'Sharma', 'amitsharma@gmail.com', '+91 98865 43210', '123 Main Street, Delhi, 110001', 'Delhi'),
  (202, 'Priya', 'Patel', 'priyapatel@gmail.com', '+91 98265 43200', '456 Park Avenue, Mumbai, 400001', 'Mumbai'),
  (203, 'Rajesh', 'Kumar', 'rajeshkumar@gmail.com', '+91 97865 43212', '789 Green Lane, Bengaluru, 560001', 'Bengaluru'),
  (204, 'Aisha', 'Khan', 'aishakhan@gmail.com', '+91 99875 43278', '123 Marine Drive, Chennai, 600001', 'Chennai'),
  (205, 'Vivek', 'Singh', 'viveksingh@gmail.com', '+91 98765 43276', '456 Golf Course Road, Gurgaon, 122001', 'Gurgaon'),
  (206, 'Neha', 'Verma', 'nehaverma@gmail.com', '+91 98790 43200', '789 Park Street, Kolkata, 700001', 'Kolkata'),
  (207, 'Rohan', 'Mehta', 'rohanmehta@gmail.com', '+91 98675 43216', '123 Beach Road, Hyderabad, 500001', 'Hyderabad'),
  (208, 'Anjali', 'Gupta', 'anjligupta@gmail.com', '+91 98005 43253', '456 MG Road, Pune, 411001', 'Pune'),
  (209, 'Nikhil', 'Rao', 'nikhilrao@gmail.com', '+91 98760 43218', '789 Residency Road, Bangalore, 560025', 'Bangalore'),
  (210, 'Riya', 'Sharma', 'riyasharma@gmail.com', '+91 98765 43999', '123 Park Street, Kolkata, 700071', 'Kolkata'),
  (211, 'Ravi', 'Sharma', 'ravi.sharma@gmail.com', '+91 9876543210', '123, MG Road, 1st Block', 'Delhi'),
  (212, 'Priya', 'Verma', 'priya.verma@gmail.com', '+91 9876123456', NULL, 'Mumbai'),
  (213, 'Amit', 'Kumar', 'amit.kumar@gmail.com', '+91 9900112233', '456, Sec-15, 2nd Floor', 'Gurgaon'),
  (214, 'Neha', 'Patel', 'neha.patel@gmail.com', '+91 9988776655', '789, Banjara Hills', 'Hyderabad'),
  (215, 'Ankit', 'Yadav', 'ankit.yadav@gmail.com', '+91 9777888999', NULL, 'Bangalore'),
  (216, 'Ritu', 'Gupta', 'ritu.gupta@gmail.com', '+91 9856332211', '345, Shankar Market, 4th', 'Chennai'),
  (217, 'Rajesh', 'Mehta', 'rajesh.mehta@gmail.com', '+91 9944556677', '567, Juhu Scheme', 'Mumbai'),
  (218, 'Sunita', 'Kapoor', NULL, '+91 9811223344', '101, Sector-14, 1st Floor', 'Pune'),
  (219, 'Mohan', 'Soni', 'mohan.soni@gmail.com', NULL, '234, Vasant Vihar', 'Delhi'),
  (220, 'Deepika', 'Reddy', 'deepika.reddygmail.com', '+91 9888776655', '12, Brigade Road', 'Bangalore'),
  (221, 'Varun', 'Joshi', 'varun.joshi@gmail.com', '+91 9345678901', '22, Rose Garden, 2nd Floor', 'Ahmedabad'),
  (222, 'Sushila', 'Rai', 'sushila.rai@gmail.com', '+91 9988443322', '78, J P Nagar, 3rd Block', 'Bengaluru'),
  (223, 'Kunal', 'Mehta', 'kunal.mehta@gmail.com', '+91 9456789012', '50, Sadar Bazar', 'Kanpur'),
  (224, 'Aarti', 'Singh', 'aarti.singh@gmail.com', '+91 9823456789', '34, Sector 12', 'Faridabad'),
  (225, 'Rahul', 'Deshmukh', 'rahul.deshmukh@gmail.com', '+91 9000112233', '120, Shivaji Nagar, 3rd Floor', 'Pune'),
  (226, 'Pooja', 'Agarwal', 'pooja.agarwal@gmail.com', '+91 9876554433', '45, Bhel Chowk', 'Mumbai'),
  (227, 'Gaurav', 'Chauhan', 'gaurav.chauhan@gmail.com', '+91 9966778899', '35, Ramlila Grounds', 'Jaipur'),
  (228, 'Meenal', 'Saini', 'meenal.saini@gmail.com', '+91 9812345678', '15, Civil Lines', 'Delhi'),
  (229, 'Vikram', 'Patil', 'vikram.patil@gmail.com', '+91 9444556677', '65, R K Puram', 'Bengaluru'),
  (230, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '+91 9822334455', '123, Kamaraj Road', 'Chennai'),
  (231, 'Mohit', 'Nair', 'mohit.nair@gmail.com', '+91 9799887766', '10, Vaishali Nagar', 'Lucknow'),
  (232, 'Preeti', 'Tiwari', 'preeti.tiwari@gmail.com', '+91 9911223344', '8, Saket Enclave', 'Noida'),
  (233, 'Devendra', 'Singh', 'devendra.singh@gmail.com', '+91 9677889944', '3, Lajpat Nagar', 'Delhi'),
  (234, 'Anjali', 'Rani', 'anjali.rani@gmail.com', '+91 9800112233', '45, MG Road', 'Kolkata'),
  (235, 'Kiran', 'Agarwal', 'kiran.agarwal@gmail.com', '+91 9999887766', '23, New Ashok Nagar', 'Delhi'),
  (236, 'Sandeep', 'Sharma', 'sandeep.sharma@gmail.com', '+91 9811223344', '12, Subhash Nagar', 'Lucknow'),
  (237, 'Anita', 'Verma', 'anita.verma@gmail.com', '+91 9900445566', '76, Sardar Patel Street', 'Mumbai'),
  (238, 'Prakash', 'Yadav', 'prakash.yadav@gmail.com', '+91 9800887766', '34, Park Street', 'Kolkata'),
  (239, 'Sanjay', 'Reddy', 'sanjay.reddy@gmail.com', '+91 9677445566', '88, Jayanagar', 'Bengaluru'),
  (240, 'Nisha', 'Mehta', 'nisha.mehta@gmail.com', '+91 9888776655', '56, Gopal Nagar, 2nd Floor', 'Chennai'),
  (241, 'Arvind', 'Kumar', 'arvind.kumar@gmail.com', '+91 9444222211', '99, Lajpat Nagar', 'Delhi'),
  (242, 'Shweta', 'Patel', 'shweta.patel@gmail.com', '+91 9900112233', '11, Raj Nagar', 'Ahmedabad'),
  (243, 'Ashok', 'Soni', 'ashok.soni@gmail.com', '+91 9999665444', '32, Banjara Hills', 'Hyderabad'),
  (244, 'Priyanka', 'Joshi', 'priyanka.joshi@gmail.com', '+91 9822334455', '45, Marine Drive', 'Mumbai');
  
INSERT INTO SALES (SALE_ID, SALE_DATE, CUSTOMER_ID, CAR_ID, SALES_PERSON_ID, DEALER_ID, SALE_PRICE)
VALUES
(1001, '2023-11-29', 201, 1001, 116, 1, 250000.00),
(1002, '2023-08-19', 202, 1002, 102, 2, 220000.00),
(1003, '2022-04-29', 203, 1003, 115, 3, 300000.00),
(1004, '2024-11-01', 204, 1004, 119, 4, 450000.00),
(1005, '2021-06-06', 205, 1005, 112, 5, 200000.00),
(1006, '2022-10-24', 206, 1006, 113, 6, 180000.00),
(1007, '2023-08-13', 207, 1007, 111, 7, 320000.00),
(1008, '2021-12-05', 208, 1008, 119, 8, 1000000.00),
(1009, '2024-09-21', 209, 1009, 116, 9, 2500000.00),
(1010, '2022-11-04', 210, 1010, 111, 10, 2000000.00),
(1011, '2020-02-15', 211, 1011, 105, 3, 750000.00),
(1012, '2021-05-20', 212, 1012, 102, 8, 880000.50),
(1013, '2022-07-10', 213, 1013, 108, 5, 950000.75),
(1014, '2023-09-22', 214, 1014, 103, 2, 1200000.00),
(1015, '2021-03-25', 215, 1015, 107, 6, 650000.99),
(1016, '2024-01-18', 216, 1016, 104, 7, 1020000.30),
(1017, '2022-06-13', 217, 1017, 106, 4, 900000.40),
(1018, '2020-11-05', 218, 1018, 110, 9, 760000.25),
(1019, '2023-08-14', 219, 1019, 109, 1, 980000.55),
(1020, '2021-12-07', 220, 1020, 105, 10, 1100000.80),
(1021, '2021-04-18', 221, 1021, 104, 4, 850000.60),
(1022, '2022-02-22', 222, 1022, 109, 2, 1000000.70),
(1023, '2023-07-30', 223, 1023, 106, 7, 1200000.40),
(1024, '2024-03-14', 224, 1024, 110, 1, 1150000.55),
(1025, '2022-11-11', 225, 1025, 112, 3, 950000.90),
(1026, '2020-12-03', 226, 1026, 108, 9, 740000.25),
(1027, '2021-09-10', 227, 1027, 107, 6, 810000.75),
(1028, '2023-05-22', 228, 1028, 102, 8, 950000.55),
(1029, '2024-06-18', 229, 1029, 115, 5, 880000.30),
(1030, '2022-10-05', 230, 1030, 101, 10, 1100000.80),
(1031, '2023-06-25', 231, 1031, 106, 4, 1250000.00),
(1032, '2021-08-17', 232, 1032, 104, 2, 720000.50),
(1033, '2022-05-28', 233, 1033, 103, 8, 1100000.20),
(1034, '2024-02-04', 234, 1034, 107, 5, 960000.75),
(1035, '2020-09-14', 235, 1035, 119, 6, 850000.99),
(1036, '2021-01-11', 236, 1036, 102, 9, 930000.60),
(1037, '2023-12-05', 237, 1037, 105, 1, 1010000.80),
(1038, '2024-07-22', 238, 1038, 108, 7, 880000.40),
(1039, '2021-06-19', 239, 1039, 118, 3, 780000.55),
(1040, '2022-03-30', 240, 1040, 106, 4, 950000.90);
  
  ALTER TABLE PAYMENTS
  MODIFY COLUMN PAYMENT_METHOD VARCHAR(50);
  
INSERT INTO PAYMENTS (PAYMENT_ID, SALE_ID, PAYMENT_AMOUNT, PAYMENT_METHOD, PAYMENT_DATE)
VALUES
(101, 1001, 1050000.00, 'Credit Card', '2023-11-29'),
(102, 1002, 1400000.00, 'Debit Card', '2023-11-28'),
(103, 1003, 1000000.00, 'Cash', '2023-11-27'),
(104, 1004, 1900000.00, 'Credit Card', '2023-11-26'),
(105, 1005, 1400000.00, 'Debit Card', '2023-11-25'),
(106, 1006, 1360000.00, 'Cash', '2023-11-24'),
(107, 1007, 1640000.00, 'Credit Card', '2023-11-23'),
(108, 1008, 1560000.00, 'Debit Card', '2023-11-22'),
(109, 1009, 1520000.00, 'Cash', '2023-11-21'),
(110, 1010, 1600000.00, 'Credit Card', '2023-11-20'),
(111, 1011, 1245000.00, 'credit card', '2021-03-15'),
(112, 1012, 2100000.00, 'cash', '2021-09-27'),
(113, 1013, 1520000.00, 'debit card', '2022-02-18'),
(114, 1014, 1803000.00, 'credit card', '2022-11-12'),
(115, 1015, 2350000.00, 'cash', '2023-01-06'),
(116, 1016, 1998000.00, 'debit card', '2023-05-23'),
(117, 1017, 1256000.00, 'credit card', '2023-08-14'),
(118, 1018, 3092000.00, 'cash', '2023-12-10'),
(119, 1019, 2784000.00, 'debit card', '2021-01-20'),
(120, 1020, 1897000.00, 'credit card', '2021-04-25'),
(121, 1021, 3145000.00, 'cash', '2022-03-18'),
(122, 1022, 2513000.00, 'debit card', '2022-07-10'),
(123, 1023, 2985000.00, 'credit card', '2023-02-14'),
(124, 1024, 3351000.00, 'cash', '2023-06-28'),
(125, 1025, 2798000.00, 'debit card', '2023-09-12'),
(126, 1026, 3205000.00, 'credit card', '2023-11-20'),
(127, 1027, 2103000.00, 'cash', '2021-05-30'),
(128, 1028, 2469000.00, 'debit card', '2022-09-11'),
(129, 1029, 2987000.00, 'credit card', '2023-03-05'),
(130, 1030, 3654000.00, 'cash', '2023-10-17'),
(131, 1031, 2123000.00, 'debit card', '2021-02-14'),
(132, 1032, 3245000.00, 'credit card', '2021-07-19'),
(133, 1033, 1876000.00, 'cash', '2022-01-25'),
(134, 1034, 2765000.00, 'debit card', '2022-05-12'),
(135, 1035, 3456000.00, 'credit card', '2022-08-30'),
(136, 1036, 2543000.00, 'cash', '2023-03-14'),
(137, 1037, 3123000.00, 'debit card', '2023-07-05'),
(138, 1038, 2876000.00, 'credit card', '2023-10-01'),
(139, 1039, 2387000.00, 'cash', '2021-11-22'),
(140, 1040, 3459000.00, 'debit card', '2022-06-17');

  
INSERT INTO SERVICERECORDS (SERVICE_ID, CAR_ID, SERVICE_DATE, SERVICE_DETAILS, SERVICE_COST, SERVICE_CENTER)
VALUES
(101, 1001, '2023-11-25', 'Oil Change', 5000.00, 'chennai Service Center'),
(102, 1002, '2023-11-26', 'Tire Rotation', 3000.00, 'Best Auto Service'),
(103, 1003, '2023-11-27', 'Brake Pad', 15000.00, 'City Auto Repair'),
(104, 1004, '2023-11-28', 'Engine Tune-up', 20000.00, 'Quick Car Care'),
(105, 1005, '2023-11-29', 'Transmission Fluid Change', 10000.00, 'pudugai Service'),
(106, 1006, '2023-11-30', 'Battery Replacement', 12000.00, 'Speedy Auto'),
(107, 1007, '2023-12-01', 'Wheel Alignment', 8000.00, 'velachery Service Center'),
(108, 1008, '2023-12-02', 'Air Filter', 4000.00, 'Apex Auto Care'),
(109, 1009, '2023-12-03', 'Tire Balancing', 2000.00, 'sanj Quick Fix'),
(110, 1010, '2023-12-04', 'Brake Pad', 10000.00, 'Nova Auto Service'),
(111, 1025, '2024-01-15', 'Oil Change', 4500.00, 'Coimbatore Service Center'),
(112, 1013, '2024-03-10', 'Tyre Change', 7500.00, 'Madurai Car Care'),
(113, 1040, '2024-04-22', 'Brake Pad Replacement', 6200.00, 'Mumbai Auto Works'),
(114, 1022, '2024-06-05', 'Engine Tune-up', 9800.00, 'Delhi Car Service'),
(115, 1007, '2024-07-18', 'Battery Replacement', 8900.00, 'Pune Service Hub'),
(116, 1033, '2024-08-02', 'Air Filter Replacement', 3200.00, 'Bangalore Auto Clinic'),
(117, 1011, '2024-09-25', 'Wheel Alignment', 5500.00, 'Kolkata Motors'),
(118, 1004, '2024-10-10', 'Suspension Check', 4700.00, 'Hyderabad Auto Works'),
(119, 1036, '2024-11-14', 'Tyre Change', 8000.00, 'Ahmedabad Car Care'),
(120, 1021, '2024-12-22', 'Clutch Repair', 7300.00, 'Jaipur Motors'),
(121, 1009, '2025-01-05', 'Brake Fluid Replacement', 2500.00, 'Lucknow Auto Works'),
(122, 1040, '2025-02-18', 'Battery Replacement', 9100.00, 'Chandigarh Service Center'),
(123, 1029, '2025-03-09', 'Oil Change', 6000.00, 'Bhopal Car Care'),
(124, 1017, '2025-04-12', 'Tyre Change', 7800.00, 'Chennai Auto Works'),
(125, 1031, '2025-05-20', 'Engine Tune-up', 4900.00, 'Patna Service Hub'),
(126, 1002, '2025-06-28', 'Air Conditioning Repair', 8500.00, 'Surat Auto Clinic'),
(127, 1038, '2025-07-14', 'Wheel Alignment', 9700.00, 'Kanpur Motors'),
(128, 1016, '2025-08-21', 'Brake Pad Replacement', 5400.00, 'Indore Auto Works'),
(129, 1028, '2025-09-30', 'Tyre Change', 6500.00, 'Nagpur Service Center'),
(130, 1005, '2025-10-16', 'Suspension Check', 8800.00, 'Visakhapatnam Motors'),
(131, 1035, '2024-01-27', 'Battery Replacement', 4600.00, 'Varanasi Auto Works'),
(132, 1019, '2024-02-14', 'Brake Fluid Replacement', 7200.00, 'Srinagar Car Care'),
(133, 1037, '2024-03-30', 'Air Filter Replacement', 2400.00, 'Thiruvananthapuram Service Hub'),
(134, 1003, '2024-05-06', 'Oil Change', 8100.00, 'Mysore Auto Works'),
(135, 1032, '2024-06-18', 'Clutch Repair', 3000.00, 'Rajkot Car Care'),
(136, 1018, '2024-07-23', 'Wheel Alignment', 5800.00, 'Jodhpur Motors'),
(137, 1026, '2024-08-17', 'Engine Tune-up', 5600.00, 'Nashik Auto Clinic'),
(138, 1014, '2024-09-25', 'Air Conditioning Repair', 9600.00, 'Amritsar Service Center'),
(139, 1020, '2024-10-10', 'Brake Pad Replacement', 8400.00, 'Guwahati Car Care'),
(140, 1008, '2024-11-20', 'Tyre Change', 7700.00, 'Noida Auto Works'),
(141, 1024, '2025-01-12', 'Battery Replacement', 8900.00, 'Agra Motors'),
(142, 1039, '2025-02-25', 'Suspension Check', 4300.00, 'Aurangabad Service Center'),
(143, 1010, '2025-04-03', 'Oil Change', 7100.00, 'Coimbatore Car Care'),
(144, 1023, '2025-05-15', 'Air Filter Replacement', 2600.00, 'Raipur Motors'),
(145, 1012, '2025-06-27', 'Tyre Change', 7800.00, 'Kochi Auto Clinic'),
(146, 1030, '2025-07-20', 'Brake Fluid Replacement', 5400.00, 'Jhansi Car Service'),
(147, 1006, '2025-08-11', 'Clutch Repair', 6800.00, 'Gwalior Auto Works'),
(148, 1027, '2025-09-23', 'Wheel Alignment', 5900.00, 'Kozhikode Service Center'),
(149, 1034, '2025-10-07', 'Engine Tune-up', 9200.00, 'Meerut Car Care'),
(150, 1015, '2025-11-14', 'Suspension Check', 8700.00, 'Mangalore Auto Clinic');

				-- ALL TABLES
  
SELECT * FROM DEALERS;
SELECT * FROM EMPLOYEES;
SELECT * FROM CARS;
SELECT * FROM CUSTOMERS;
SELECT * FROM SALES;
SELECT * FROM PAYMENTS;
SELECT * FROM SERVICERECORDS;


				-- JOIN TABLES
                
SELECT * FROM DEALERS
UNION ALL
SELECT * FROM PAYMENTS;

				-- TESTING

SELECT D.DEALER_ID,C.BRAND,S.SALES_PERSON_ID,S.CUSTOMER_ID 
FROM SALES S 
JOIN CARS C
ON S.CAR_ID=C.CAR_ID
JOIN DEALERS D
ON D.DEALER_ID=S.DEALER_ID;

				-- TESTING

SELECT C.FIRST_NAME,C.LAST_NAME,S.CUSTOMER_ID,CA.BRAND,P.PAYMENT_AMOUNT,P.PAYMENT_METHOD,D.DEALER_ID,E.FIRST_NAME,E.LAST_NAME
FROM CUSTOMERS C
JOIN SALES S
ON C.CUSTOMER_ID =S.CUSTOMER_ID
JOIN CARS CA
ON CA.CAR_ID=S.CAR_ID
JOIN PAYMENTS P
ON P.SALE_ID=S.SALE_ID
JOIN DEALERS D
ON D.DEALER_ID = CA.DEALER_ID
JOIN EMPLOYEES E
ON E.DEALER_ID=D.DEALER_ID;

	-- 1.find who buy HONDA brand with debit card list by maximum amount
            
SELECT S.CUSTOMER_ID,C.BRAND,P.PAYMENT_AMOUNT,P.PAYMENT_METHOD
FROM SALES AS S 
JOIN CARS AS C
ON S.CAR_ID=C.CAR_ID
JOIN PAYMENTS AS P
ON P.SALE_ID = S.SALE_ID
WHERE C.BRAND ='HONDA' AND P.PAYMENT_METHOD='DEBIT CARD'
ORDER BY P.PAYMENT_AMOUNT DESC;

-- 2.write a query to find the High-selling car brands based on the max sales?

SELECT BRAND,MAX(SALE_PRICE) AS HIGH_SALES
FROM CARS AS C
JOIN SALES AS S 
ON C.CAR_ID=S.CAR_ID 
GROUP BY BRAND 
ORDER BY HIGH_SALES;

-- 3.the total revenue generated from car sales within a specific date range?

SELECT SUM(SALE_PRICE) AS TOTAL_REVENUE 
FROM SALES 
WHERE YEAR(SALE_DATE) BETWEEN 2020 AND 2024 ;

-- 4. how to join tables to get a report showing customer names and the cars they've purchased?

SELECT CA.MODEL,C.FIRST_NAME,C.LAST_NAME,S.SALE_DATE FROM 
CUSTOMERS AS C
JOIN SALES AS S
ON S.CUSTOMER_ID = C.CUSTOMER_ID
JOIN CARS AS CA 
ON S.CAR_ID = CA.CAR_ID 
ORDER BY S.SALE_DATE DESC;

-- 5.2021 how many cars  sales sorted by car brands  ;
 
 SELECT C.MODEL,S.SALE_DATE,SUM(S.SALE_PRICE) AS TOTAL_SALE_PRICE
 FROM CARS AS C
 JOIN SALES AS S
 ON C.CAR_ID = S.CAR_ID
 WHERE YEAR(S.SALE_DATE)=2024
 GROUP BY S.SALE_DATE,C.MODEL;

-- 6.how many cars sales from dealers sorted by dealer list --

SELECT DISTINCT D.DEALER_ID,COUNT(C.CAR_ID),C.MODEL
FROM DEALERS AS D 
JOIN CARS AS C
ON D.DEALER_ID =C.DEALER_ID
JOIN SALES AS S 
ON S.DEALER_ID = S.DEALER_ID 
GROUP BY D.DEALER_ID,COUNT(CAR_ID)
ORDER BY DEALER_ID ASC,CAR_ID ASC,MODEL ASC;

-- 7.find the delership with the highest sales revenue over a specific period --

SELECT D.DEALER_ID,DEALER_NAME,SUM(S.SALE_PRICE ) AS TOTAL_REVENUE,YEAR(S.SALE_DATE) AS EACH_YEAR
FROM DEALERS AS D 
JOIN SALES AS S 
ON D.DEALER_ID = S.DEALER_ID 
GROUP BY D.DEALER_ID,YEAR(S.SALE_DATE)
ORDER BY DEALER_ID ASC,EACH_YEAR ASC; 

-- 8.top performing sales person based on the number cars sold --

SELECT S.SALES_PERSON_ID,COUNT(P.PAYMENT_ID) AS NUMBER_OF_PAYMENTS,SUM(P.PAYMENT_AMOUNT) AS TOTAL_PAY
FROM SALES AS S 
JOIN PAYMENTS AS P 
ON S.SALE_ID = P.SALE_ID 
GROUP BY S.SALES_PERSON_ID
ORDER BY SALES_PERSON_ID;
  -- STEP 2 
SELECT S.SALES_PERSON_ID,E.FIRST_NAME,E.LAST_NAME,C.MODEL,C.BRAND,S.SALE_PRICE,S.SALE_DATE
FROM CARS AS C 
JOIN SALES AS S
ON C.CAR_ID = S.CAR_ID
JOIN EMPLOYEE
WHERE SALES_PERSON_ID = 102;

-- 9.display a list of cars available at a specific dealership filtered by brand or price range --

SELECT *
FROM CARS 
WHERE DEALER_ID = 4 
AND CAR_ID NOT IN (SELECT CAR_ID FROM SALES);

-- 10.generate a report showing all purchases made by a specific customer including car details and sale date --

SELECT C.CAR_ID,MODEL,BRAND,YEAR,SALE_DATE,SALE_PRICE ,S.CUSTOMER_ID
FROM CARS AS C 
JOIN SALES AS S 
ON C.CAR_ID = S.CAR_ID
WHERE S.CUSTOMER_ID =  205 ;

-- 11.report showing all cars sold by a purticular dealership including car details and sale date --

SELECT S.DEALER_ID,C.BRAND,C.MODEL,S.SALE_PRICE,S.SALE_DATE
FROM CARS AS C
JOIN SALES AS S
ON C.CAR_ID=S.CAR_ID
order by S.DEALER_ID;

-- 12.identify the top 5 customers based on their total purchase amount --

SELECT C.CUSTOMER_ID,C.FIRST_NAME,C.LAST_NAME,SUM(S.SALE_PRICE) AS TOTAL_PURCHASE
FROM CUSTOMERS AS C
JOIN SALES AS S
ON C.CUSTOMER_ID=S.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.FIRST_NAME,C.LAST_NAME
ORDER BY TOTAL_PURCHASE DESC 
LIMIT 5;

-- 13. identifying best-selling car models 

SELECT C.BRAND,C.MODEL,COUNT(S.SALE_ID) AS NUMBER_OF_SALES
FROM CARS AS C
JOIN SALES AS S
ON S.CAR_ID=C.CAR_ID 
GROUP BY C.BRAND,C.MODEL
ORDER BY NUMBER_OF_SALES DESC;

-- 14. calculating monthly sales performence --

SELECT date_format(S.SALE_DATE,'%Y-%M') AS DATEE,SUM(P.PAYMENT_AMOUNT) AS AMOUNT,COUNT(S.SALE_ID) AS NUMBERS
FROM PAYMENTS AS P 
JOIN SALES AS S 
ON S.SALE_ID = P.SALE_ID
GROUP BY DATEE 
ORDER BY  NUMBERS DESC;

-- 15.service and maintanance records --
SELECT C.MODEL,C.BRAND,S.SERVICE_DATE,S.SERVICE_DETAILS,CU.FIRST_NAME,SA.CUSTOMER_ID
FROM CARS AS C
JOIN SERVICERECORDS AS S
ON C.CAR_ID=S.CAR_ID
JOIN SALES AS SA
ON SA.CAR_ID=C.CAR_ID
JOIN CUSTOMERS AS CU
ON SA.CUSTOMER_ID = CU.CUSTOMER_ID 
WHERE SA.CUSTOMER_ID =215;

-- 16. find high value customers

SELECT S.CUSTOMER_ID AS ID ,CU.FIRST_NAME AS F,CU.LAST_NAME AS L,SUM(P.PAYMENT_AMOUNT) AS SPENT,P.PAYMENT_DATE
FROM SALES AS S
JOIN PAYMENTS AS P
ON S.SALE_ID=P.SALE_ID
JOIN CUSTOMERS AS CU
ON S.CUSTOMER_ID = CU.CUSTOMER_ID
WHERE PAYMENT_DATE BETWEEN '2023-01-01' AND '2023-12-30'
GROUP BY ID,F,L,PAYMENT_DATE
ORDER BY SPENT DESC;
