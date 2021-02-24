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
	dept_managers.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
	JOIN dept_managers ON
	dept_managers.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = dept_managers.emp_no;