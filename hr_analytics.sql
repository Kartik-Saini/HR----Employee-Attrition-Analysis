DROP TABLE IF EXISTS hr_analytics;
CREATE TABLE hr_analytics (
    emp_id              INTEGER PRIMARY KEY,
    name                VARCHAR(100),
    department          VARCHAR(50),
    job_role            VARCHAR(50),
    gender              VARCHAR(10),
    age                 INTEGER,
    education           VARCHAR(20),
    marital_status      VARCHAR(20),
    salary              INTEGER,
    years_at_company    INTEGER,
    years_in_role       INTEGER,
    performance_rating  INTEGER,
    job_satisfaction    INTEGER,
    work_life_balance   INTEGER,
    overtime            VARCHAR(5),
    attrition           VARCHAR(5),
    distance_from_home  INTEGER
);

-- Phase 1 — Data Exploration
-- Q1. Total employees
SELECT COUNT(*) AS total_employees FROM hr_analytics;

-- Q2. Sample data
SELECT * FROM hr_analytics LIMIT 10;

-- Q3. Departments in company
SELECT DISTINCT department FROM hr_analytics ORDER BY department;

-- Q4. Male vs Female count
SELECT gender, COUNT(*) AS count
FROM hr_analytics
GROUP BY gender;

-- Q5. Check NULL values
SELECT * FROM hr_analytics
WHERE name IS NULL
OR department IS NULL
OR salary IS NULL
OR attrition IS NULL;

-- Phase 2 — Business Analysis 
-- Q6. Department wise average salary
SELECT department,
       ROUND(AVG(salary), 2) AS avg_salary
FROM hr_analytics
GROUP BY department
ORDER BY avg_salary DESC;

-- Q7. Attrition count (kon log company chod rahe hain)
SELECT attrition, COUNT(*) AS count
FROM hr_analytics
GROUP BY attrition;

-- Q8. Department wise attrition
SELECT department,
       COUNT(*) AS total_emp,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS left_company,
       ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY department
ORDER BY attrition_rate DESC;

-- Q9. Overtime karne wale employees kitne hain
SELECT overtime, COUNT(*) AS count
FROM hr_analytics
GROUP BY overtime;

-- Q10. Top 5 highest paid employees
SELECT name, department, job_role, salary
FROM hr_analytics
ORDER BY salary DESC
LIMIT 5;

-- Phase 3 — Advanced Analysis 
-- Q11. Gender wise average salary
SELECT gender,
       ROUND(AVG(salary), 2) AS avg_salary
FROM hr_analytics
GROUP BY gender;

-- Q12. Education wise average salary
SELECT education,
       COUNT(*) AS total_emp,
       ROUND(AVG(salary), 2) AS avg_salary
FROM hr_analytics
GROUP BY education
ORDER BY avg_salary DESC;

-- Q13. Employees with low job satisfaction AND doing overtime
-- (high attrition risk employees)
SELECT name, department, job_role, job_satisfaction, overtime, attrition
FROM hr_analytics
WHERE job_satisfaction <= 2 AND overtime = 'Yes'
ORDER BY job_satisfaction ASC;

-- Q14. Age group wise employee count
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 30 THEN '25-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        ELSE 'Above 40'
    END AS age_group,
    COUNT(*) AS total_emp
FROM hr_analytics
GROUP BY age_group
ORDER BY total_emp DESC;

-- Q15. Department wise performance rating
SELECT department,
       ROUND(AVG(performance_rating), 2) AS avg_performance,
       COUNT(*) AS total_emp
FROM hr_analytics
GROUP BY department
ORDER BY avg_performance DESC;

-- Q16. Employees who left company with high performance rating
-- (valuable employees lost)
SELECT name, department, job_role, salary, performance_rating
FROM hr_analytics
WHERE attrition = 'Yes' AND performance_rating >= 3
ORDER BY performance_rating DESC, salary DESC;

-- Phase 4 — Final Advanced Queries
-- Q17. Salary range category wise count
SELECT
    CASE
        WHEN salary < 45000 THEN 'Low (Below 45K)'
        WHEN salary BETWEEN 45000 AND 75000 THEN 'Mid (45K-75K)'
        WHEN salary BETWEEN 75001 AND 100000 THEN 'High (75K-1L)'
        ELSE 'Very High (Above 1L)'
    END AS salary_range,
    COUNT(*) AS total_emp
FROM hr_analytics
GROUP BY salary_range
ORDER BY total_emp DESC;

-- Q18. Department wise attrition with avg salary
-- (are low salary departments losing more people?)
SELECT department,
       ROUND(AVG(salary), 2) AS avg_salary,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY department
ORDER BY attrition_rate DESC;

-- Q19. Employees with 5+ years but low performance
-- (underperforming experienced employees)
SELECT name, department, job_role,
       years_at_company, performance_rating, salary
FROM hr_analytics
WHERE years_at_company >= 5 AND performance_rating <= 2
ORDER BY years_at_company DESC;

-- Q20. Work life balance vs attrition
SELECT work_life_balance,
       COUNT(*) AS total_emp,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS left_company,
       ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY work_life_balance
ORDER BY work_life_balance ASC;

