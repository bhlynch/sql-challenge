CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" CHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" float   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

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




