/* TASK 3 : HR-Analytics
NAME: SANNIDHYA DAS   */

/* Creating the table */

CREATE TABLE hr_analytics(
emp_id int8 PRIMARY KEY,
age int ,
	attrition char(50), 
	daily_rate INT8,
	department VARCHAR(50),
dist_from_home INT8,
	education INT8,
	edu_field VARCHAR(50),
	emp_count INT,
	employee INT,
	env_satisfaction INT,
	gender VARCHAR(50),
	hourly_rate INT8,
	job_inv INT,
	job_level INT,
	job_role VARCHAR(50),
	job_satisfaction INT,
	maraital_status VARCHAR(50),
	monthly_income INT8,
	monthly_rate INT8,
	no_comp_worked INT,
	over_18 char(30),
	over_time CHAR(50),
	percent_salary_hike INT8,
	performance_rating INT,
	relationship_satisfaction INT,
	standard_hours INT8,
	stock_option_lev INT,
	total_work_yr INT8,
	train_time_last_yr INT,
	work_lyf_bal INT,
	yrs_at_comp INT8,
	yrs_in_curr_role INT8,
	yrs_since_last_promo INT8,
	yrs_with_curr_manager INT
	
);

/* Importing data from excel sheet,and loading it */
SELECT * FROM hr_analytics;
 
/* Some Key Insights */ 

SELECT COUNT(employee) AS Total_Employees,
COUNT(DISTINCT job_role) AS Total_jobroles,
COUNT(DISTINCT edu_field) AS Total_Education_field, 
ROUND(AVG(monthly_income),2) AS AvgMonthlyIncome,
ROUND(AVG(hourly_rate),2) AS Avg_hourly_rate
FROM hr_analytics;

/* Gender distribution */

SELECT gender, ROUND(COUNT(gender) * 100.0 /(SELECT COUNT(*) FROM hr_analytics)) 
AS Percentage
FROM hr_analytics
GROUP BY gender;

/* Calculating Average Monthly Income by Gender */ 

SELECT ROUND(AVG(monthly_income),2) AS AvgMonthlyIncome,gender FROM hr_analytics
GROUP BY gender;

/* Top 5 job roles with average job satisfaction */

SELECT AVG(job_satisfaction) AS Avg_Job_Satisfaction,job_role FROM hr_analytics
GROUP BY job_role
ORDER BY Avg_Job_Satisfaction DESC
LIMIT 5;

/* Average Monthly Income of each department */

SELECT AVG(monthly_income) AS Avg_Monthly_income,department FROM hr_analytics
GROUP BY department
ORDER BY Avg_Monthly_income DESC;

/* Division of Employees on the basis of Maraital status */

SELECT COUNT(*) employee,maraital_status FROM hr_analytics
GROUP BY maraital_status
ORDER BY employee DESC;

/* Counting the No. of employees who work overtime and have attrition */

SELECT COUNT(*) employee,over_time FROM hr_analytics
WHERE attrition = 'Yes'
GROUP BY over_time,attrition;

/* Finding the average percent salary hike by job role */

SELECT ROUND(AVG(percent_salary_hike))AS Avg_percent_salary_hike ,job_role
FROM hr_analytics
GROUP BY job_role
ORDER BY Avg_percent_salary_hike DESC
LIMIT 10;

/* Identifying top 5 average distance from home by education field */

SELECT ROUND(AVG(dist_from_home)) AS Dist_from_home,edu_field FROM hr_analytics
GROUP BY edu_field
ORDER BY Dist_from_home DESC
LIMIT 5;

/* Finding The average performance rating whose department is "Research & Development"
and Education field is "Life Sciences" */

SELECT ROUND(AVG(performance_rating),2) AS Avg_performance_rating,maraital_status
FROM hr_analytics
WHERE department='Research & Development' and edu_field='Life Sciences'
GROUP BY maraital_status;

/* Gender basis performance and income matrix */

SELECT ROUND(AVG(performance_rating),2) AS Avg_performance_rating,
ROUND(AVG(hourly_rate),2) AS Avg_hourly_rate,
ROUND(AVG(job_inv),2) AS Avg_job_involvement,
ROUND(AVG(monthly_income)) AS Avg_Monthly_income,
ROUND(AVG(total_work_yr)) AS Avg_working_yr,
ROUND(AVG(yrs_since_last_promo)) AS Avg_yrs_since_last_promotion,
gender FROM hr_analytics
GROUP BY gender;


 
 
 
 
 
 
 
 

