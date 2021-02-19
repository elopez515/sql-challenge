-- In this SQL script we will create tables that will allow us to import the data from our csv files

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS departments;
-- We will create a table for our departments csv file
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

-- We will now bring all the imported data to our table
SELECT * FROM departments;

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS department_employees;

-- We will create a table for our dept_emp csv file
CREATE TABLE department_employees (
	emp_no INT,
	dept_no VARCHAR
);

-- We will now bring all the imported data to our table
SELECT * FROM department_employees;

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS department_managers;

-- We will create a table for our dept_manager csv file
CREATE TABLE department_managers (
	dept_no VARCHAR,
	emp_no INT
);

-- We will now bring all the imported data to our table
SELECT * FROM department_managers;

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS employees;

-- We will create a table for our employees csv file
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
);

-- We will now bring all the imported data to our table
SELECT * FROM employees;

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS salaries;

-- We will create a table for our salaries csv file
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

-- We will now bring all the imported data to our table
SELECT * FROM salaries;

-- We will set a drop function for the table we will create 
-- -- to avoid errors with multiple runs.
DROP TABLE IF EXISTS titles;

-- We will create a table for our titles csv file
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

-- We will now bring all the imported data to our table
SELECT * FROM titles;
