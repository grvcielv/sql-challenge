-- 1. List the employee #, last name, first name, sex, and salary of each employee

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
JOIN Salaries
ON Employees.emp_no = Salaries.emp_no
;

-- 2. List the first name, last name, and hire date for the employees who where hired in 1986

SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE 
	Employees.hire_date > '1985-12-31' AND Employees.hire_date < '1987-01-01'
;

-- 3. List the manager of each department along with their department number, department name, employee number,
-- last name and first name

SELECT manager.dept_no, department.dept_name, manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager manager
JOIN departments department
ON department.dept_no = manager.dept_no
JOIN employees employees
ON manager.emp_no = employees.emp_no
;

-- 4. List the department number for each employee along with that employee's employee number
-- last name, first name and department name.

SELECT dept.dept_no, dept.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp dept
JOIN employees employees
ON dept.emp_no = employees.emp_no
JOIN departments department
ON department.dept_no = dept.dept_no
;

-- 5. List first name, last name and sex of each employee whose first name is Hercules and whose last name
-- begins with the letter B

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees employees
WHERE 
	employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

-- 6. List each employee in the Sales department, including their employee number, last name and first name

SELECT department.dept_name, dept.emp_no, employees.last_name, employees.first_name
FROM employees employees
JOIN dept_emp dept
ON employees.emp_no = dept.emp_no
JOIN departments department
ON department.dept_no = dept.dept_no
WHERE
	department.dept_name = 'Sales'
;

-- 7. List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.

SELECT dept.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employees employee
JOIN dept_emp dept
ON employees.emp_no = dept.emp_no
JOIN departments department
ON department.dept_no = dept.dept_no
WHERE
	department.dept_name = 'Sales' OR department.dept_name = 'Development'
;

-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many 
-- employees share each last name).

SELECT employee.last_name, COUNT(*)
FROM employees employee
GROUP BY employee.last_name
ORDER BY COUNT (*) DESC
;
