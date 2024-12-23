-- Sample SQL script demonstrating DML (Data Manipulation Language) features

-- 1. CREATE a sample table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- 2. INSERT records into the table
INSERT INTO employees (employee_id, first_name, last_name, department, salary)
VALUES
    (1, 'John', 'Doe', 'Engineering', 75000.00),
    (2, 'Jane', 'Smith', 'Marketing', 60000.00),
    (3, 'Alice', 'Johnson', 'Engineering', 72000.00),
    (4, 'Bob', 'Brown', 'HR', 50000.00);

-- 3. SELECT records from the table
SELECT * FROM employees;

-- 4. UPDATE records in the table
-- Increase the salary of all employees in the 'Engineering' department by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'Engineering';

-- 5. DELETE a record from the table
-- Remove the employee with ID 4
DELETE FROM employees
WHERE employee_id = 4;

-- 6. Use SELECT with conditions and ordering
-- Get all employees with a salary greater than 65000, ordered by salary descending
SELECT *
FROM employees
WHERE salary > 65000
ORDER BY salary DESC;

-- 7. INSERT INTO a subset of columns
-- Add a new employee, specifying only some columns
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (5, 'Charlie', 'Wilson');

-- 8. Perform aggregation using SELECT
-- Get the total salary expenditure per department
SELECT department, SUM(salary) AS total_salary, employees.ID
FROM employees
GROUP BY department;

-- 9. Use a subquery
-- Find employees whose salary is above the average salary
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 10. Use transactions (BEGIN, COMMIT, ROLLBACK)
-- Example of a transaction
BEGIN;
UPDATE employees SET salary = salary * 1.05 WHERE department = 'Marketing';
-- If the update is correct, commit it
COMMIT;
-- If not, rollback (example below, not executed due to previous commit)
-- ROLLBACK;

-- 11. DELETE all rows for cleanup (if needed)
-- DELETE FROM employees;
