-- interview questions
-- 1. find 3rd highest salary from employees table
-- select salary from employees order by salary desc limit 1 offset 2;
-- limit will limit data to particular number
-- offset will provide data after particular number
-- above query will limit data to 1 and provide data after 2

-- 2. find nth highest salary
-- n can be 1,2,3...
-- select salary from employees e1 where 3-1 = 
-- (select count(salary) from employees e2 where e2.salary > e1.salary)

-- 3. find duplicate row
-- select first_name,count(*) from employees group by first_name;

-- 4. find even and odd
-- select * from employees where mod(emp_id,2)=0;
-- select * from employees where mod(emp_id,2)=1;

-- find 1st and last item from db
-- 1st item
-- select * from employees where emp_id = (select MIN(emp_id) from employees);

-- last item
-- select * from employees where emp_id = (select MAX(emp_id) from employees);


-- write a query to find employees working in same department
-- self join
-- select distinct e1.emp_id,e1.first_name,e1.last_name,e1.dept from employees e1, employees e2 where e1.dept = e2.dept and e1.emp_id !=e2.emp_id;

-- get last 3 records from employees
-- select * from (select * from employees order by emp_id desc limit 3) temp order by emp_id asc;

-- delete duplicate rows in employees table
-- self join
-- delete from employees e1, employees e2 where e1.first_name = e2.first_name and e1.emp_id != e2.emp_id;

-- get 1st 4 characters of first name from employees
-- select substring(first_name,1,4) from employees;

-- order by 2 columns
-- 1st it will arrange dept in desc order and when there is repetition of dept then salary will be arranged in asc
-- select * from employees order by dept desc ,salary asc

-- get employees which are not in tech and sales dept
-- select * from employees where dept not in ('tech','sales')

-- get last 2 salaries
-- select salary from employees e1 where 2 >=
-- (select count(*) from employees e2 where e1.salary >= e2.salary);

-- join problems
-- find name of department where more than 2 employees are working
-- select d.dept_name,count(d.dept_name) from employees e 
-- inner join department d on e.dept_id = d.id group by dept_name having count(dept_name) >=2 ;

-- calculate avg salary of each department which is higher than 70000 and find dept name in desc order
-- select avg(e.salary), d.dept_name from employees e 
-- inner join department d on e.dept_id = d.id group by d.dept_name having avg(e.salary) > 70000 order by dept_name desc

-- get employee details with department details where emp salary is between 70000 to 700000
-- select e.first_name,e.last_name,e.salary,d.dept_name,d.dept_loc from employees e inner join department d on e.dept_id = d.id
-- group by e.first_name,e.last_name,d.dept_name,d.dept_loc,e.salary having e.salary between 70000 and 700000
