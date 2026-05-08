# HR Analytics -- Employee Attrition & Performance Analysis

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Status](https://img.shields.io/badge/Status-Completed-green)
![Level](https://img.shields.io/badge/Level-Intermediate-orange)

---

## Project Overview

This project performs end-to-end SQL analysis on an HR dataset of 50 employees to uncover insights around employee attrition, salary distribution, performance ratings, and workforce demographics using PostgreSQL.

---

## Dataset

| Column | Description |
|---|---|
| emp_id | Unique employee ID |
| name | Employee name |
| department | Department (Sales, IT, HR, Finance) |
| job_role | Designation |
| gender | Male / Female |
| age | Employee age |
| education | Bachelor / Master / PhD |
| marital_status | Single / Married |
| salary | Monthly salary (INR) |
| years_at_company | Total years in company |
| years_in_role | Years in current role |
| performance_rating | 1 (Low) to 4 (High) |
| job_satisfaction | 1 (Low) to 4 (High) |
| work_life_balance | 1 (Low) to 4 (High) |
| overtime | Yes / No |
| attrition | Yes (left) / No (stayed) |
| distance_from_home | Distance in km |

---

## Analysis Phases

### Phase 1 -- Data Exploration
- Total employee count
- Sample data preview
- Distinct departments
- Gender distribution
- NULL value check

### Phase 2 -- Business Analysis
- Department wise average salary
- Overall attrition count
- Department wise attrition rate
- Overtime employee count
- Top 5 highest paid employees

### Phase 3 -- Advanced Analysis
- Gender wise average salary
- Education wise salary comparison
- High risk employees (low satisfaction + overtime)
- Age group wise employee distribution
- Department wise performance rating
- High performers who left company

### Phase 4 -- Final Advanced Queries
- Salary range category wise distribution
- Department wise attrition vs salary correlation
- Experienced employees with low performance
- Work life balance vs attrition rate

---

## Key Insights

- Sales department had the highest attrition rate
- Employees with low job satisfaction AND overtime are at highest risk of leaving
- PhD holders earn significantly higher than Bachelor degree employees
- Poor work life balance (rating 1) employees left at a much higher rate
- Several high-performing employees left -- indicating retention issues beyond salary

---

## SQL Concepts Used

| Concept | Queries |
|---|---|
| DDL | CREATE TABLE, DROP TABLE |
| DML | SELECT, WHERE, GROUP BY, ORDER BY |
| Aggregations | COUNT, AVG, SUM, ROUND |
| Conditional Logic | CASE WHEN (age groups, salary ranges) |
| Filtering | WHERE, AND, HAVING |
| Attrition Rate | SUM(CASE WHEN) / COUNT * 100 |

---

## Project Structure

```
hr-analytics-sql/
|
|-- hr_analytics.sql    -- All 20 SQL queries
|-- README.md           -- Project documentation
```

---

## Author

**Kartik Saini**
kartiksaini2800@gmail.com
LinkedIn: https://www.linkedin.com/in/kartiksaini28/

---

If you found this helpful, give it a star!
