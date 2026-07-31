-- ==========================================================
--                 HR ANALYTICS SQL PROJECT
-- ==========================================================

-- Author       : Khushant Singh Rathore
-- Tool         : MySQL
-- Database     : HR_Analytics



-- ==========================================================
-- 1. BUSINESS PROBLEM
-- ==========================================================

/*
The HR department wants to analyze employee data to understand
the factors affecting employee attrition and workforce trends.

The objective is to identify patterns related to employee turnover,
salary, department, job role, education, marital status,
and other employee characteristics to support better HR decisions.
*/



-- ==========================================================
-- 2. CREATE DATABASE
-- ==========================================================


CREATE DATABASE HR_Analytics;
USE HR_Analytics;
SHOW DATABASES;




-- ======================================================
-- 3. IMPORT DATASET
-- ======================================================

-- Import HR_Analytics.csv using Table Data Import Wizard.





-- ======================================================
-- 4. DATA UNDERSTANDING
-- ======================================================


-- Display First 10 Records

SELECT *
FROM hr_data
LIMIT 10;

-- Count Total Employees

SELECT COUNT(*)
FROM hr_data;


-- View Table Structure

DESCRIBE hr_data;

-- Check Unique Department Values

SELECT DISTINCT Department
FROM hr_data;

-- Check Unique Job Roles

SELECT DISTINCT JobRole
FROM hr_data;

-- Check Unique Education Fields

SELECT DISTINCT EducationField
FROM hr_data;


-- Check Unique Marital Status

SELECT DISTINCT MaritalStatus
FROM hr_data;

-- Check Unique Attrition Values

SELECT DISTINCT Attrition
FROM hr_data;

-- Check Unique Gender Values

SELECT DISTINCT Gender
FROM hr_data;



-- ======================================================
-- 6. SQL DATA ANALYSIS
-- ======================================================

-- ------------------------------------------------------
-- Total Employees
-- ------------------------------------------------------

SELECT COUNT(*) AS Total_Employees
FROM hr_data;

/*
Observation:
The organization has 1473 employees.
*/


-- ------------------------------------------------------
-- Employee Count by Attrition
-- ------------------------------------------------------

SELECT Attrition,
COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Attrition;

/*
Observation:
1236 numbers of employees have not left the organization,
while  237 numbers of employes have left.
*/

-- ------------------------------------------------------
-- Department-wise Employee Count
-- ------------------------------------------------------


SELECT Department,
COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Total_Employees DESC;

/*
Observation:
Research & Development has the highest number of employees,
followed by Sales. Human Resources has the lowest.
*/

-- ------------------------------------------------------
-- Job Role-wise Employee Count
-- ------------------------------------------------------

SELECT JobRole,
COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY JobRole
ORDER BY Total_Employees DESC;

/*
Observation:
Sales Executive has the highest number of employees,
while Human Resources has the lowest.
*/

-- ------------------------------------------------------
-- Gender-wise Employee Count
-- ------------------------------------------------------

SELECT Gender,
COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Gender;

/*
Observation:
The organization has a higher number of male employees(884)
than female employees(589).
*/


-- ------------------------------------------------------
-- Marital Status-wise Employee Count
-- ------------------------------------------------------


SELECT MaritalStatus,
COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY MaritalStatus
ORDER BY Total_Employees DESC;

/*
Observation:
Married employees form the largest group,
followed by Single and Divorced employees.
*/


-- ------------------------------------------------------
-- Average Monthly Income
-- ------------------------------------------------------

SELECT ROUND(AVG(MonthlyIncome),2) AS Average_Income
FROM hr_data;

/*
Observation:
The average monthly income of employees is Rs 6500.23 .
*/


-- ------------------------------------------------------
-- Highest Monthly Income
-- ------------------------------------------------------

SELECT MAX(MonthlyIncome) AS Highest_Income
FROM hr_data;

/*
Observation:
The highest monthly income is Rs 19999.
*/


-- ------------------------------------------------------
-- Lowest Monthly Income
-- ------------------------------------------------------

SELECT MIN(MonthlyIncome) AS Lowest_Income
FROM hr_data;

/*
Observation:
The lowest monthly income is Rs 1009 .
*/






-- ======================================================
-- Filtering Data using WHERE Clause
-- ======================================================


-- ------------------------------------------------------
-- Employees Who Left the Company
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE Attrition = 'Yes';

/*
Observation:
This query displays all employees who have left the organization.
*/


-- ------------------------------------------------------
-- Employees in Sales Department
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE Department = 'Sales';

/*
Observation:
This query displays all employees working in the Sales department.
*/


-- ------------------------------------------------------
-- Employees with High Monthly Income
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE MonthlyIncome > 10000;

/*
Observation:
This query identifies employees earning more than 10,000 per month.
*/


-- ------------------------------------------------------
-- Employees Older Than 40
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE Age > 40;

/*
Observation:
This query retrieves employees who are older than 40 years.
*/


-- ------------------------------------------------------
-- Female Employees
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE Gender = 'Female';

/*
Observation:
This query displays all female employees in the organization.
*/


-- ------------------------------------------------------
-- Married Employees
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE MaritalStatus = 'Married';

/*
Observation:
This query retrieves all married employees.
*/


-- ------------------------------------------------------
-- Employees Working Overtime
-- ------------------------------------------------------

SELECT *
FROM hr_data
WHERE OverTime = 'Yes';

/*
Observation:
This query displays employees who work overtime.
*/







-- ======================================================
-- GROUP BY ANALYSIS
-- ======================================================


-- ------------------------------------------------------
-- Attrition by Department
-- ------------------------------------------------------

SELECT Department,
       Attrition,
       COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Department, Attrition
ORDER BY Department;

/*
Observation:
This query shows the number of employees who stayed and left in each department.
Research & Development and Sales generally have the highest attrition counts.
*/


-- ------------------------------------------------------
-- Attrition by Job Role
-- ------------------------------------------------------

SELECT JobRole,
       Attrition,
       COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY JobRole, Attrition

/*
Observation:
This query identifies which job roles have the highest employee attrition.
*/


-- ------------------------------------------------------
-- Average Monthly Income by Job Role
-- ------------------------------------------------------

SELECT JobRole,
       ROUND(AVG(MonthlyIncome),2) AS Average_Income
FROM hr_data
GROUP BY JobRole
ORDER BY Average_Income DESC;

/*
Observation:
This query compares the average monthly income across different job roles.
*/


-- ------------------------------------------------------
-- Average Age by Department
-- ------------------------------------------------------

SELECT Department,
       ROUND(AVG(Age),2) AS Average_Age
FROM hr_data
GROUP BY Department
ORDER BY Average_Age DESC;

/*
Observation:
This query shows the average employee age for each department.
*/


-- ------------------------------------------------------
-- Employee Count by Education Field
-- ------------------------------------------------------

SELECT EducationField,
       COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY EducationField
ORDER BY Employee_Count DESC;

/*
Observation:
Life Sciences and Medical generally have the highest number of employees.
*/


-- ------------------------------------------------------
-- Average Years at Company by Department
-- ------------------------------------------------------

SELECT Department,
       ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM hr_data
GROUP BY Department

/*
Observation:
This query compares the average tenure of employees across departments.
*/


-- ------------------------------------------------------
-- Overtime by Department
-- ------------------------------------------------------

SELECT Department,
       OverTime,
       COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Department, OverTime
ORDER BY Department;

/*
Observation:
This query shows the number of employees working overtime in each department.
*/


-- ------------------------------------------------------
-- Average Job Satisfaction by Job Role
-- ------------------------------------------------------

SELECT JobRole,
       ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM hr_data
GROUP BY JobRole
ORDER BY Avg_Job_Satisfaction DESC;

/*
Observation:
This query compares the average job satisfaction score across job roles.
*/







-- ======================================================
-- HAVING CLAUSE ANALYSIS
-- ======================================================


-- ------------------------------------------------------
-- Departments with More Than 100 Employees
-- ------------------------------------------------------

SELECT Department,
       COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
HAVING COUNT(*) > 100;

/*
Observation:
This query displays departments having more than 100 employees.
*/


-- ------------------------------------------------------
-- Job Roles with More Than 50 Employees
-- ------------------------------------------------------

SELECT JobRole,
       COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY JobRole
HAVING COUNT(*) > 50
ORDER BY Total_Employees DESC;

/*
Observation:
This query identifies job roles with a workforce greater than 50 employees.
*/


-- ------------------------------------------------------
-- High Average Income Departments
-- ------------------------------------------------------

SELECT Department,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Income
FROM hr_data
GROUP BY Department
HAVING AVG(MonthlyIncome) > 6000
ORDER BY Avg_Income DESC;

/*
Observation:
This query shows departments where the average monthly income exceeds 6000.
*/







-- ======================================================
-- CASE WHEN ANALYSIS
-- ======================================================


-- ------------------------------------------------------
-- Employee Age Categories
-- ------------------------------------------------------

SELECT EmployeeNumber,
       Age,
       CASE
           WHEN Age < 30 THEN 'Young'
           WHEN Age BETWEEN 30 AND 45 THEN 'Middle Age'
           ELSE 'Senior'
       END AS Age_Group
FROM hr_data;

/*
Observation:
Employees are categorized into Young, Middle Age, and Senior groups.
*/


-- ------------------------------------------------------
-- Employee Salary Category
-- ------------------------------------------------------

SELECT EmployeeNumber,
       MonthlyIncome,
       CASE
           WHEN MonthlyIncome < 5000 THEN 'Low Salary'
           WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
           ELSE 'High Salary'
       END AS Salary_Category
FROM hr_data;

/*
Observation:
Employees are classified into low, medium, and high salary groups.
*/







-- ======================================================
-- ORDER BY & LIMIT
-- ======================================================


-- ------------------------------------------------------
-- Top 10 Highest paid Employees
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome
FROM hr_data
ORDER BY MonthlyIncome DESC
LIMIT 10;

/*
Observation:
This query lists the top 10 highest-paid employees.
*/


-- ------------------------------------------------------
-- Top 5 Most Experienced Employees
-- ------------------------------------------------------

SELECT EmployeeNumber,
       TotalWorkingYears
FROM hr_data
ORDER BY TotalWorkingYears DESC
LIMIT 5;

/*
Observation:
This query identifies the employees with the highest total working experience.
*/







-- ======================================================
-- WINDOW FUNCTIONS
-- ======================================================


-- ------------------------------------------------------
-- Assign Row Number Based on Monthly Income
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome,
       ROW_NUMBER() OVER(ORDER BY MonthlyIncome DESC) AS Row_Num
FROM hr_data;

/*
Observation:
Each employee is assigned a unique row number based on monthly income in descending order.
*/


-- ------------------------------------------------------
-- Rank Employees by Monthly Income
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome,
       RANK() OVER(ORDER BY MonthlyIncome DESC) AS Employee_Rank
FROM hr_data;

/*
Observation:
Employees with the same monthly income receive the same rank, and the next rank is skipped.
*/


-- ------------------------------------------------------
-- Dense Rank Employees by Monthly Income
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome,
       DENSE_RANK() OVER(ORDER BY MonthlyIncome DESC) AS Employee_Rank
FROM hr_data;

/*
Observation:
Employees with equal monthly income receive the same rank, but no rank numbers are skipped.
*/



-- ------------------------------------------------------
-- Previous Employee Monthly Income( LAg() )
-- ------------------------------------------------------

SELECT EmployeeNumber,
       MonthlyIncome,
       LAG(MonthlyIncome) OVER(ORDER BY MonthlyIncome) AS Previous_Income
FROM hr_data;

/*
Observation:
The query displays the previous employee's monthly income for comparison.
*/


-- ------------------------------------------------------
-- Next Employee Monthly Income ( LEAD() )
-- ------------------------------------------------------

SELECT EmployeeNumber,
       MonthlyIncome,
       LEAD(MonthlyIncome) OVER(ORDER BY MonthlyIncome) AS Next_Income
FROM hr_data;

/*
Observation:
The query displays the next employee's monthly income for comparison.
*/







-- ======================================================
-- COMMON TABLE EXPRESSIONS (CTE)
-- ======================================================


-- ------------------------------------------------------
-- Emplyees With Above Average Salary
-- ------------------------------------------------------

WITH AvgSalary AS
(
    SELECT AVG(MonthlyIncome) AS Avg_Income
    FROM hr_data
)

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome
FROM hr_data, AvgSalary
WHERE MonthlyIncome > Avg_Income;

/*
Observation:
The query returns employees whose monthly income is above the organization's average salary.
*/



-- ------------------------------------------------------
-- Department-wise Average Salary using CTE
-- ------------------------------------------------------
WITH DeptSalary AS
(
    SELECT Department,
           ROUND(AVG(MonthlyIncome),2) AS Avg_Income
    FROM hr_data
    GROUP BY Department
)

SELECT *
FROM DeptSalary
ORDER BY Avg_Income DESC;

/*
Observation:
The CTE calculates and displays the average monthly income for each department.
*/







-- ======================================================
-- SUBQUERIES
-- ======================================================


-- ------------------------------------------------------
-- Emplyees With Above Average Salary
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome
FROM hr_data

WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_data
)
Order By MonthlyIncome DESC ;

/*
Observation:
This query identifies employees whose salary is higher than the overall average salary.
*/


-- ------------------------------------------------------
-- Employee With Maximum Salary
-- ------------------------------------------------------

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome
FROM hr_data
WHERE MonthlyIncome =
(
    SELECT MAX(MonthlyIncome)
    FROM hr_data
);

/*
Observation:
The query retrieves the employee receiving the highest monthly income.
*/








-- ======================================================
-- BUSINESS INSIGHTS
-- ======================================================


/*
Business Insight 1:
Research & Development has the largest workforce in the organization, followed by Sales,
while Human Resources has the smallest number of employees.
*/

/*
Business Insight 2:
Most employees have not left the organization, indicating an overall good employee retention rate.
*/

/*
Business Insight 3:
Sales Executive is the most common job role, whereas Human Resources has the fewest employees.
*/

/*
Business Insight 4:
Male employees outnumber female employees in the organization.
*/

/*
Business Insight 5:
Employees working overtime tend to have higher attrition compared to employees who do not work overtime.
*/

/*
Business Insight 6:
Monthly income varies significantly across job roles, with managerial positions generally earning the highest salaries.
*/

/*
Business Insight 7:
Life Sciences and Medical are the most common educational backgrounds among employees.
*/

/*
Business Insight 8:
Departments with a larger workforce also tend to report a higher number of attrition cases.
*/







-- ======================================================
-- PROJECT CONCLUSION
-- ======================================================

/*
Conclusion:

This SQL project analyzed employee data to understand workforce distribution,
employee attrition, salary trends, departmental performance, job roles,
and demographic characteristics.

Using SQL concepts such as filtering, grouping, aggregate functions,
window functions, common table expressions, and subqueries,
valuable business insights were generated.

The analysis identified the departments and job roles with the highest employee counts,
highlighted attrition patterns, compared salary distributions,
and examined employee demographics.

These insights can help management improve employee retention,
optimize workforce planning, and support better business decision-making.
*/








