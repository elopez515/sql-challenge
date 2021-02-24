/*
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_employees;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS salaries;                                                                               
*/
-----------------------------------------------------------------------------------------------------------
CREATE TABLE employees ( 
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_managers (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL
);
-----------------------------------------------------------------------------------------------------------
-- We will now bring all the data to our tables
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM dept_employees;
SELECT * FROM dept_managers;
SELECT * FROM salaries;