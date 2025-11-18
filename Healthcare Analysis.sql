create  database healthcare;

use healthcare;

DROP TABLE IF EXISTS healthcare.healthcare_table;
CREATE TABLE healthcare.healthcare_table(
sId int auto_increment,
name varchar(100),
Age int,
Gender varchar(100),
Blood_Type varchar(100),
Medical_Condition varchar(100),
Date_of_Admission Date,
Doctor varchar(100),
Hospital varchar(225),
Insurance_Provider varchar(100),
Billing_Amount Decimal(11,5),
Room_Number int,
Admission_Type varchar(100),
Discharge_Date date,
Medication varchar(100),
Test_Results varchar(100),
primary key(sId)
);

SELECT * FROM healthcare.healthcare_table;
SELECT COUNT(*) FROM healthcare.healthcare_table;
SELECT COUNT(DISTINCT Hospital) AS Total_Hospitals FROM healthcare.healthcare_table;
SELECT DISTINCT Medical_Condition  AS Types_of_conditions FROM healthcare.healthcare_table;
SELECT DISTINCT Test_Results AS Types_of_results FROM healthcare.healthcare_table;



-- DATA CLEANING

SELECT * FROM healthcare.healthcare_table WHERE sId IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Name IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Age IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Blood_Type IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Medical_Condition IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Date_of_Admission IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Doctor IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Hospital IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Insurance_Provider IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Billing_Amount IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Room_Number IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Admission_Type IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Discharge_Date IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Medication IS NULL;
SELECT * FROM healthcare.healthcare_table WHERE Test_Results IS NULL;


SELECT * FROM healthcare.healthcare_table WHERE 
sId IS NULL OR Name IS NULL OR Age IS NULL OR Gender IS NULL OR Blood_Type IS NULL OR Medical_Condition 
IS NULL OR Date_of_Admission IS NULL OR Doctor IS NULL OR Hospital IS NULL OR Insurance_Provider 
IS NULL OR Billing_Amount IS NULL OR Room_Number IS NULL OR Admission_Type IS NULL OR Discharge_Date 
IS NULL OR Medication IS NULL OR Test_Results IS NULL;

DELETE  FROM healthcare.healthcare_table WHERE 
 sId IS NULL OR Name IS NULL OR Age IS NULL OR Gender IS NULL OR Blood_Type IS NULL OR Medical_Condition 
IS NULL OR Date_of_Admission IS NULL OR Doctor IS NULL OR Hospital IS NULL OR Insurance_Provider 
IS NULL OR Billing_Amount IS NULL OR Room_Number IS NULL OR Admission_Type IS NULL OR Discharge_Date 
IS NULL OR Medication IS NULL OR Test_Results IS NULL;


-- My Analysis & Findings

 -- 1.Write  a SQL query to retrieve Admission_Type is Urgent
 -- 2.Write  a SQL query to retrieve Blood_Type is 'o-'
 -- 3.Write  a SQL query to retrieve Age is above 40
 -- 4.Write  a SQL query to retrieve Test_Results=Abnormal
 -- 5.Write  a SQL query to find total billing amount
 -- 6.Write  a SQL query to find admitted more then 10 days
 -- 7.Write  a SQL query to check 5 Highest Amount of Billing Hospital
 -- 8.Write  a SQL query to check Highest Amount of Insurance clamied with Medical condition
 -- 9.Write  a SQL query to check highest treatement give hospital
 -- 10.Write a SQL query to check how many time Insurance company processed insurance
 -- 11.Write a SQL query to check how many row in table
 -- 12.Write a SQL query to check higesht Total patients Treated by Medical condition
 -- 13.Write a SQL query to check higesht Total Patient Treated by Each Doctors
 -- 14.Write a SQL query to check how many male patients treated for diabetes or obesity
 -- 15.Write a SQL query to check  how many patients treated by blood group 
 -- 16.Write a SQL query to check least blood group and Abnormal
 -- 17.Write a SQL query to check what are Medications used for patients
 -- 18.Write a SQL query to check which are hospital billed amount more then average
 -- 19.Write a SQL query to check how many patients admitted on each days 
 -- 20.Write a SQL query to check yearly billing amount by discharge dates



-- 1.Write a SQL query to retrieve Admission_Type is Urgent
SELECT Name,Age,Gender,Blood_Type,Hospital,Test_Results FROM healthcare.healthcare_table WHERE Admission_Type='Urgent';

-- 2.Write a SQL query to retrieve Blood_Type is 'o-'
SELECT Name,Age,Gender,Blood_Type,Hospital,Test_Results FROM healthcare.healthcare_table WHERE Blood_Type='o-';

-- 3.Write a SQL query to retrieve Age is above 40
SELECT Name,Age,Gender,Hospital,Medical_Condition FROM healthcare.healthcare_table WHERE Age>=40;

-- 4.Write a SQL query to retrieve Test_Results=Abnormal
SELECT Name,Age,Gender,Blood_Type,Hospital,Test_Results FROM healthcare.healthcare_table WHERE Test_Results='Abnormal';

-- 5. Write a SQL query to find total billing amount
SELECT SUM(Billing_Amount) FROM healthcare.healthcare_table;

-- 6. Write a SQL query to find admitted more then 10 days
SELECT Name,Age,Gender,Hospital,Date_of_Admission,Discharge_Date FROM healthcare.healthcare_table WHERE datediff(Discharge_Date,Date_of_Admission)>10;

-- 7.Write a SQL query to check 5 Highest Amount of Billing Hospital
SELECT Hospital FROM healthcare.healthcare_table ORDER BY Hospital DESC LIMIT 5;

-- 8.Write a SQL query to check Highest Amount of Insurance clamied with Medical condition
SELECT Hospital,Medical_Condition,Insurance_Provider FROM healthcare.healthcare_table ORDER BY Insurance_Provider LIMIT 5;

-- 9.Write SQL query to check highest treatement give hospital
SELECT Hospital,count(*) AS Number_of_Patients FROM healthcare.healthcare_table GROUP BY Hospital HAVING Count(*)>1 ORDER BY Number_of_Patients DESC;

-- 10.Write SQL query to check how many time Insurance company processed insurance
SELECT Insurance_Provider,count(*) AS Number_of_Insurance FROM healthcare.healthcare_table GROUP BY Insurance_Provider HAVING Count(*)>1;

-- 11. Write a SQL query to check how many patients Treated
SELECT COUNT(name) AS Total_Patients FROM healthcare.healthcare_table;

 -- 12. Write a SQL query to check higesht Total patients Treated by Medical condition
SELECT Medical_Condition,count(*) AS Number_of_patients FROM healthcare.healthcare_table GROUP BY Medical_Condition HAVING Count(*)>1 ORDER BY Number_of_patients DESC;

-- 13. Write a SQL query to check higesht Total Patient Treated by Each Doctors
SELECT Doctor,count(*) AS Number_of_Patients FROM healthcare.healthcare_table GROUP BY  Doctor  Having Count(*)>1 ORDER BY Number_of_Patients DESC;

-- 14.Write a SQL query to check how many male patients treated for diabetes or obesity
SELECT * FROM healthcare.healthcare_table WHERE Gender = 'Male' And Medical_Condition='Diabetes' OR'Obesity';

-- 15.Write a SQL query to check  how many patients treated by blood group 
 SELECT Blood_Type,count(*) AS Number_patients FROM healthcare.healthcare_table GROUP BY  Blood_Type  Having Count(*)>1 ORDER BY Number_patients ASC;

-- 16.Write a SQL query to check least blood group and Abnormal
SELECT Blood_Type,Test_Results,count(*) AS Number_patients FROM healthcare.healthcare_table WHERE Test_Results='Abnormal' GROUP BY  Blood_Type  Having Count(*)>1 ORDER BY Number_patients ASC LIMIT 4;

-- 17. Write a SQL query to check what are Medications used for patients
SELECT DISTINCT Medication as uniques FROM healthcare.healthcare_table ;

-- 18.Write a SQL query to check which are hospital billed amount more then average
SELECT Hospital,Billing_Amount FROM healthcare.healthcare_table WHERE Billing_Amount > (SELECT AVG(Billing_Amount) FROM healthcare.healthcare_table);

-- 19.Write a SQL query to check how many patients admitted on each days 
SELECT Date_of_Admission,count(*) AS Number_of_patients FROM healthcare.healthcare_table GROUP BY  Date_of_Admission  Having Count(*)>1 ORDER BY Number_of_years DESC;

-- 20.Write a SQL query to check yearly billing amount by discharge dates
SELECT YEAR(Discharge_Date) AS Years, SUM(Billing_Amount) AS Total_Billing
FROM healthcare.healthcare_table GROUP BY YEAR (Discharge_Date) ORDER BY Years DESC;




