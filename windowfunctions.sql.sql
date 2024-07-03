-- windowfunctions
-- row_number
-- select e.*, row_number() over()as row_number
-- from employees e;

-- example problem of row_number
-- fetch first 2 employees from each department to join the company
-- select * from (
-- select e.*, row_number() over(partition by dept) as row_number
-- from employees e) x where x.row_number < 3

-- rank()
-- fetch top 2 employees in each department earining max salary
-- select * from (select e.*, rank() over(partition by dept order by salary desc) as rank 
-- from employees e) as x where x.rank < 3;

-- dense_rank()
-- fetch top 2 employees in each department earining max salary
-- select * from (select e.*, dense_rank() over(partition by dept order by salary desc) as rank 
-- from employees e) as x where x.rank < 3;

-- lead and lag function
-- lag is used to get prev data
-- lead is used to get next data

-- query to display if the salary of an employee is higher,lower or equal to previous employee
-- lag(salary,1,0)
-- select *, lag(salary,1,0) over(partition by dept order by salary desc) as prev_salary,
-- case when salary > lag(salary,1,0) over(partition by dept order by salary desc) then 'salary is greater than previous employee'
-- 	 when salary < lag(salary,1,0) over(partition by dept order by salary desc) then 'salary is less than previous employee'
-- 	 when salary = lag(salary,1,0) over(partition by dept order by salary desc) then 'salary is equal to previous employee'
-- 	 end as result
-- from employees e;

-- select *, lead(salary,1,0) over(partition by dept order by salary desc) as prev_salary,
-- case when salary > lead(salary,1,0) over(partition by dept order by salary desc) then 'salary is greater than previous employee'
-- 	 when salary < lead(salary,1,0) over(partition by dept order by salary desc) then 'salary is less than previous employee'
-- 	 when salary = lead(salary,1,0) over(partition by dept order by salary desc) then 'salary is equal to previous employee'
-- 	 end as result
-- from employees e;

-- find most expensive product in each category
select e.*, first_value(e.first_name) over(partition by e.dept order by e.salary desc) as highest_salary
from employees e;

