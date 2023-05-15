-- Data Analysis 
-- List the employee number, last name, first name, sex, and salary of each employee.
-- Joining the employee and salary table to get both salary and employee number, name and sex 
-- Ordering by employee number to make reading the output easier
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s 
ON (e.emp_no = s.emp_no)
ORDER BY "emp_no";

-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- Filtering the dates for only the year 1986 and sorting in order from January to December 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31' 
	AND hire_date < '1987-01-01' 
ORDER BY "hire_date";

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name. 
-- Joining together three tables, first departments and department managers, then adding employees
-- Ordering by department to make the output easier to read 

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_managers dm
JOIN departments d 
ON (dm.dept_no = d.dept_no)
	JOIN employees e
		ON (dm.emp_no = e.emp_no)
ORDER BY "dept_no";

-- List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
-- Using a LEFT JOIN because the dept_emp has multiple departments for one employee and 
-- multiple/repeat departments that all need department names 
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e 
ON (de.emp_no = e.emp_no)
	LEFT JOIN departments d
	ON (de.dept_no = d.dept_no)
ORDER BY "dept_no";

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
-- Using a wildcard for last name that begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, 
-- and first name.
-- Again used left join to ensure that all data is kept from the dept_emp table
-- Filtered data for WHERE = d007 because that is the department number for Sales 
SELECT de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
ON (de.dept_no = d.dept_no)
	LEFT JOIN employees e
	ON (de.emp_no = e.emp_no)
WHERE de.dept_no = 'd007'
ORDER BY "emp_no";

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
-- Filtered for Sales and Development using dept_no.
-- d007 is the department number for Sales and d005 is the department number for Development
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
ON (de.dept_no = d.dept_no)
	LEFT JOIN employees e
	ON (de.emp_no = e.emp_no)
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005'
ORDER BY "dept_name";

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees 
GROUP BY last_name
ORDER BY Frequency DESC; 
