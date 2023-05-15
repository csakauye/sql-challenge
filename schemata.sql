-- Data Engineering 
-- Use the provided information to create a table schema for each of the six CSV files

-- Creating table for departments csv
-- Department number is the primary key because it is unique and referenced in other tables 
-- Department name is not null because it wouldn't make sense to have a department ID but no name
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name TEXT NOT NULL
);

SELECT * FROM departments;

-- Creating table for titles csv
-- Title_id is the primary key because it is also referenced on the employee table 
-- Title is not null because each title ID should have a corresponding name 
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title TEXT NOT NULL
);	

SELECT * FROM titles;

-- Creating table for employees csv
-- Employee number is the primary key because it is unique to each employee
-- Employee title id, birth date, first/last name, sex and hire date are all not null 
-- because employee records should contain all this information 
-- Emp_title_id is also a foreign key to title_id in the title table 
-- that allows the emp_title_id to be matched to the actual job title 
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name TEXT NOT NULL, 
	last_name TEXT NOT NULL,
	sex VARCHAR(1) NOT NULL, 
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Creating table for dept_emp csv
-- Made employee number the primary key because each individual employee will be assigned only one department
-- but departments will be assigned to multiple employees making dept_no non-unqiue 
-- Dept_no is not null because each employee should be assigned a department 
-- Additionally, both employee and department number are foreign keys
-- because they appear on the departments and employees tables 
CREATE TABLE dept_emp(
	emp_no INT PRIMARY KEY,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_emp;

-- Creating table for dept_manager csv
-- Employee number is the primary key because an employee should be manager of only one department 
-- but departments could have multiple employee numbers assigned as managers
-- Department number is not null because each manager should be assigned a department 
-- Both department and employee number appear on the departments and employees tables 
CREATE TABLE dept_managers(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_managers;

-- Creating table for salaries csv
-- Employee number is the primary key because each employee has only one salary but 
-- multiple employees could have the same salary 
-- Salary is not null because each employee should have one
-- Employee number is a foreng key as well because it also appears on the employees table 
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;