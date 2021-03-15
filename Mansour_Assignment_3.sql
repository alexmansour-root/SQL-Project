/*
 * This is a script for Assignment - Stage 3
 * Author: Alex Mansour
 * Date: December 3, 2020
*/

-- Step 1. Initialize a Database
CREATE DATABASE organization;

-- Step 2. Switch to the database we created.
USE organization;

--Step 3. Physical Design (Implementation) - Create tables from the entities designed in the ER diagram. 

-- Create the entity - Employee
CREATE TABLE Employee(
	Employee_ID INTEGER PRIMARY KEY,
	Employee_Name CHAR(255) NOT NULL,
	Email CHAR(255) NOT NULL

);

--Create the entity - Company
CREATE TABLE Company(
	Company_ID INTEGER PRIMARY KEY,
	Company_Name CHAR(255) NOT NULL,
	Company_Size CHAR(7) NOT NULL,
	Industry CHAR(255) NOT NULL,
	Revenue CHAR(255) NOT NULL

);

--Create the bridging table - WorksFor
CREATE TABLE WorksFor(
	WorksFor_ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
	Employee_ID INTEGER FOREIGN KEY REFERENCES Employee(Employee_ID),
	Company_ID INTEGER FOREIGN KEY REFERENCES Company(Company_ID)

);

--Create the entity - Outlook (This is the company outlook)

CREATE TABLE Outlook(
	Outlook_ID INTEGER PRIMARY KEY,
	Yoy_Change FLOAT NOT NULL,
	Year_Current CHAR(4) NOT NULL 

);

--Create the bridging table - Forecasts (This is a forecast of how well the company is doing)

CREATE TABLE Forecasts(
	Forecasts_ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
	Company_ID INTEGER FOREIGN KEY REFERENCES Company(Company_ID),
	Outlook_ID INTEGER FOREIGN KEY REFERENCES Outlook(Outlook_ID)

);

--Create the entity - Benefits (This is Employee Benefits the company provides)

CREATE TABLE Benefits(
	Benefits_ID INTEGER PRIMARY KEY,
	Salary CHAR(20) NOT NULL,
	Benefit_Type CHAR(20) NOT NULL

);

--Creat the entity - Training ( This is Employee Training the company provides)

CREATE TABLE Training(
	Training_ID INTEGER PRIMARY KEY,
	Duration CHAR(20) NOT NULL,
	Topic CHAR(255) NOT NULL
	

);

--Create the bridging table - Provides (This is what a company provides to its employees)

CREATE TABLE Provides(
	Provides_ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
	Company_ID INTEGER FOREIGN KEY REFERENCES Company(Company_ID),
	Benefits_ID INTEGER FOREIGN KEY REFERENCES Benefits(Benefits_ID),
	Training_ID INTEGER FOREIGN KEY REFERENCES Training(Training_ID)

);


--Create the bridging table - Receives (These are the benefits and training the employee receives from the company)

CREATE TABLE Receives(
	Receives_ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
	Employee_ID INTEGER FOREIGN KEY REFERENCES Employee(Employee_ID),
	Benefits_ID INTEGER FOREIGN KEY REFERENCES Benefits(Benefits_ID),
	Training_ID INTEGER FOREIGN KEY REFERENCES Training(Training_ID)

);

-- Step 4. Create Dummy data

INSERT INTO Employee(
	Employee_ID, Employee_Name, Email
) Values (
	'100', 'Mark Smith', 'mark@google.com'

);

INSERT INTO Employee(
	Employee_ID, Employee_Name, Email  
) Values (
	'101', 'Matt Jones', 'matt@amplicon.com'
);

INSERT INTO Company(
	Company_ID, Company_Name, Company_Size, Industry, Revenue 
) Values (
	'1000', 'Google', '100000', 'Technology', '70000000000'
);

INSERT INTO Company(
	Company_ID, Company_Name, Company_Size, Industry, Revenue 
) Values (
	'1100', 'Amplicon', '5000', 'Biology', '40000000'
);

INSERT INTO WorksFor(
	Employee_ID, Company_ID
) Values(
	'100', '1000'
);

INSERT INTO WorksFor(
	Employee_ID, Company_ID
) Values(
	'101', '1100'
);

INSERT INTO Outlook( 
	Outlook_ID, Yoy_Change, Year_Current 
) Values (
	'10', '50.5', '2020'
);

INSERT INTO Outlook( 
	Outlook_ID, Yoy_Change, Year_Current 
) Values (
	'20', '10.0', '2020'
);

INSERT INTO Forecasts(
	Company_ID, Outlook_ID 
) Values(
	'1000', '10'
);

INSERT INTO Forecasts(
	Company_ID, Outlook_ID 
) Values(
	'1100', '20'
);

INSERT INTO Benefits(
	Benefits_ID, Salary, Benefit_Type 
) Values (
	'3000', '90000', 'Health'
);

INSERT INTO Benefits(
	Benefits_ID, Salary, Benefit_Type 
) Values (
	'4000', '50000', 'Health'
);

INSERT INTO Training(
	Training_ID, Duration, Topic 
) Values (
	'60', 'One Month', 'Advanced Programming'
);

INSERT INTO Training(
	Training_ID, Duration, Topic 
) Values (
	'70', 'One Week', 'Mental Health'
);

INSERT INTO Provides(
	Company_ID, Benefits_ID, Training_ID
) Values(
	'1000', '3000', '60'
);

INSERT INTO Provides(
	Company_ID, Benefits_ID, Training_ID
) Values(
	'1100', '4000', '70'
);

INSERT INTO Receives(
	Employee_ID, Benefits_ID, Training_ID
) Values(
	'100', '3000', '60'
); 

INSERT INTO Receives(
	Employee_ID, Benefits_ID, Training_ID
) Values(
	'101', '4000', '70'
); 

--Step 5. Validate the data

SELECT * FROM Benefits b;
SELECT * FROM Company c;
SELECT * FROM Employee e;
SELECT * FROM Forecasts f;
SELECT * FROM Outlook o;
SELECT * FROM Provides p;
SELECT * FROM Receives r;
SELECT * FROM Training t;
SELECT * FROM WorksFor wf;

--Step 6. Update some of the data

UPDATE Employee 
SET Employee_Name = 'Matthew Jones'
WHERE Employee_ID = '101';

UPDATE Employee
SET Email = 'msmith@google.com'
WHERE Employee_ID = '100';

UPDATE Benefits 
SET Salary = '95000'
WHERE Benefits_ID = '3000';

UPDATE Benefits 
SET Salary = '60000'
WHERE Benefits_ID = '4000';

--Step 7. Delete any Duplicate data

DELETE FROM Receives
WHERE Receives_ID IN (3);


