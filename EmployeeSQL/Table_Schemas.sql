/*
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS department_employees;
DROP TABLE IF EXISTS department_managers;
DROP TABLE IF EXISTS salaries;                                                                               
*/
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

CREATE TABLE department_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE department_managers (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL
);

-- We will now bring all the data to our tables
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM department_employees;
SELECT * FROM department_managers;
SELECT * FROM salaries;

ALTER TABLE employees
	ADD CONSTRAINT employees_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

ALTER TABLE department_employees
	ADD CONSTRAINT department_employees_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE department_employees
	ADD CONSTRAINT department_employees_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE department_managers
	ADD CONSTRAINT department_managers_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE department_managers
	ADD CONSTRAINT department_managers_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries
	ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

/*
-- List the following details of each employee: employee number,
-- -- last name, first name, sex, and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE employees.hire_date >= '1986-01-01' AND employees.hire_date <= '1986-12-31';

-- List the manager of each department with the following information:
-- -- department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
	departments.dept_name,
	department_managers.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
	JOIN department_managers ON
	department_managers.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = department_managers.emp_no;


-- List the department of each employee with the following information:
-- -- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
	JOIN department_employees ON
	department_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = department_employees.emp_no;
	

-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- -- and last names begin with "B."
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number,
-- -- last name, first name, and department name.

-- DROP VIEW IF EXISTS Sales_Department;

-- CREATE VIEW Sales_Department AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
	JOIN department_employees ON
	department_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = department_employees.emp_no
WHERE dept_name = 'Sales';

-- SELECT * FROM Sales_Department;

-- List all employees in the Sales and Development departments, 
-- -- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
	JOIN department_employees ON
	department_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = department_employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- -- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_frequency"
FROM employees
GROUP BY last_name
ORDER BY "last_name_frequency" DESC;
*/
