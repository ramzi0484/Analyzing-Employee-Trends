create database Emp;
----------------------------------------------------------------------------------------------------------------
use Emp;
------------------------------------------------------------------CREAT TABLE :
CREATE TABLE EmployeeDetails (
emp_no INT PRIMARY KEY,
gender NVARCHAR(10),
marital_status NVARCHAR(10),
age_band NVARCHAR(20),
age INT,
department NVARCHAR(50),
education NVARCHAR(50),
education_field NVARCHAR(50),
job_role NVARCHAR(50),
business_travel NVARCHAR(20),
employee_count INT,
attrition NVARCHAR(5),
attrition_label NVARCHAR(20),
job_satisfaction INT,
active_employee BIT
);
-------------------------------------------------------------------------------------------------------------
BULK INSERT EmployeeDetails
FROM 'C:\music store data\employee_trends.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
FIRSTROW = 2,
KEEPNULLS,
CODEPAGE = '65001'
);
---------------------------------------------------------------------------------------------------------------
select * from EmployeeDetails
---------------------------------------------------------------------------------------------------------------
select department, count(*)as emp_no
from EmployeeDetails
group by department;
--------------------------------------------------------------------------------------------------------------
select department,avg(age) as age_band
from EmployeeDetails
group by department;
--------------------------------------------------------------------------------------------------------------
select department, job_role, count(*) as role_count
from EmployeeDetails
group by department,job_role
---------------------------------------------------------------------------------------------------------------
select education, avg(job_satisfaction) as job
from EmployeeDetails
group by education;
--------------------------------------------------------------------------------------------------------------
select job_satisfaction, avg(age) as age_emp
from EmployeeDetails
group by job_satisfaction;
--------------------------------------------------------------------------------------------------------------
SELECT  age_band, COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
from EmployeeDetails
GROUP BY age_band;
--------------------------------------------------------------------------------------------------------------
select department,avg(job_satisfaction) AS average_job_sat
from EmployeeDetails
group by department;
--------------------------------------------------------------------------------------------------------------
SELECT top 1 age_band,education,CAST(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5, 2)) AS attrition_rate
FROM EmployeeDetails
GROUP BY age_band, education
ORDER BY attrition_rate DESC;
--------------------------------------------------------------------------------------------------------------
select education, avg(job_satisfaction) AS average_job_sat
from EmployeeDetails
where business_travel='travel_frequently'
GROUP BY education
ORDER BY average_job_sat DESC;
--------------------------------------------------------------------------------------------------------------
SELECT age ,avg(job_satisfaction) as avg_job_satisfaction
FROM EmployeeDetails
WHERE marital_status ='Married'
GROUP BY age
ORDER BY avg_job_satisfaction DESC;






