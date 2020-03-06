select emp_no, birth_date, first_name, last_name, gender from employees;

select * from employees;

select * from employees
Where hire_date between '1986-01-01' AND '1986-12-31';

SELECT dept_manager.dept_no, departments.dept_name, 
dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date,
employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN departments ON
departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON
employees.emp_no=dept_manager.emp_no;

select dept_emp.emp_no,employees.last_name, employees.first_name,
departments.dept_name
from dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no;

select * 
from employees
where first_name = 'Hercules'
and last_name like 'B%';

select dept_emp.emp_no,employees.last_name, employees.first_name,
departments.dept_name
from dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
where dept_name = 'Sales';

select dept_emp.emp_no,employees.last_name, employees.first_name,
departments.dept_name
from dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
where dept_name = 'Sales' 
or dept_name = 'Development';

SELECT last_name,
COUNT(*) AS total
FROM employees
GROUP BY last_name
order by total DESC;
