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
		
-- List the department of each employee with the following information:
-- -- employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
	JOIN dept_employees ON
	dept_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = dept_employees.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- -- and last names begin with "B."
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number,
-- -- last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
	JOIN dept_employees ON
	dept_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = dept_employees.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- -- including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
	JOIN dept_employees ON
	dept_employees.dept_no=departments.dept_no
		JOIN employees ON
		employees.emp_no = dept_employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- -- i.e., how many employees share each last name.
SELECT last_name, 
COUNT(last_name) AS "last_name_frequency"
FROM employees
GROUP BY last_name
ORDER BY "last_name_frequency" DESC;