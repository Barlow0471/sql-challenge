-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments as d
LEFT JOIN department_manager as m
ON d.dept_no = m.dept_no
LEFT JOIN employees as e
ON m.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees as de
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
LEFT JOIN employees as e
ON de.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name
FROM department_employees as de
LEFT JOIN employees as e
ON de.emp_no = e.emp_no
LEFT JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees as de
LEFT JOIN employees as e
ON de.emp_no = e.emp_no
LEFT JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Number of Same Names"
FROM employees
Group BY last_name
ORDER BY "Number of Same Names" desc