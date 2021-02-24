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
-----------------------------------------------------------------------------------------------------------
-- Altering our tables to add our foreign key constraints and it's references
ALTER TABLE employees
	ADD CONSTRAINT employees_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

ALTER TABLE dept_employees
	ADD CONSTRAINT dept_employees_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_employees
	ADD CONSTRAINT dept_employees_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_managers
	ADD CONSTRAINT dept_managers_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_managers
	ADD CONSTRAINT dept_managers_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries
	ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);