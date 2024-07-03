-- create table employees_data (id int not null primary key, name  varchar unique, email  varchar unique)
-- alter table employees_data add column age int;
-- alter table employees_data rename column age to salary

-- data manupulation
-- insert,update and delete
-- insert into employees_data (id,name,email,salary) values (1,'akash', 'akash@gmail.com', '100000');
-- update employees_data set name = 'akash_edit'
-- delete from employees_data where name = 'akash_edit'

-- data type
-- numeric,string and date time

-- constraints
-- primary key,not null,default,unique, index

-- create table table_name (column_name datatype constraint,)
-- alter table table_name add column column_name data_type constraint

-- special operator
-- select * from table_name where salary between 1000 to 10000;
-- select * from table_name where first_name like 'akash';
-- select * from table_name where first_name is Null;
-- select * from table_name where salary in [1000,10000];
-- select distinct(first_name) from table_name;

-- aggregation operator
-- avg,sum,count,min and max
-- select avg(salary) from table_name where dept = "IT";
-- select sum(salary) from table_name where dept = "IT";
-- select count(*) from table_name where dept = "IT";
-- select max(salary) from table_name where dept = "IT";
-- select min(salary) from table_name where dept = "IT";

-- group by and having clause
-- find avg salary of IT dept
-- select avg(salary) from table_name group by dept,salary having count(dept) >= 2 order by salary;

-- joins 
-- inner join left join right join full outer join
-- select e.name,d.name from employees e inner join department d on e.deptId = d.id

-- string functions
-- upper lower trim replace substring length concat
-- select upper(name) from table_name;
-- select lower(name) from table_name;
-- select trim(name) from table_name;
-- select replace(name,'akash','nidhi') from table_name;
-- select length(name) from table_name;
-- select substring(first_name,1,3) from employees;
-- select concat(first_name,last_name) from table_name;

-- case expression
-- select column_name case when expression 1 then result 1
-- when expression 2 then result 2
-- else result 3 end as new_col_name from table_name;

-- sub queries
-- https://www.geeksforgeeks.org/sql-subquery/
-- select name,location,phone_number from database where roll_no in (select roll_no from student where section = 'A')

-- https://www.sqltutorial.org/sql-subquery/
-- select first_name,last_name from employees where salary = (select max(salary) from employees)
-- SQL subquery with the IN or NOT IN operator
-- select * from departments where location_id = 1700;
-- select * from employees where department_id in (select department_id from departments where location_id = 1700

-- SQL subquery with the comparison operator
-- select * from departments where department_id in (select department_id from employees where salary > 10000 limit 1);

-- SQL subquery with the ALL operator
-- finds all employees whose salaries are greater than the lowest salary of every department:
-- select min(salary) from employees group by department_id; this will give lowest salary for each department
-- select * from employees where salary > All(select min(salary) from employees group by department_id)

-- SQL subquery in the FROM clause
-- SELECT * from (subquery) as table_name;

-- SQL Subquery in the SELECT clause

-- find all departments which have at least one employee with the salary is greater than 10,000
-- normal sub query
-- select department_id from employees e where e.salary > 10000
-- select * from departments d where d.department_id in (select department_id from employees e where e.salary > 10000)

-- find all departments which do not have any employees with the salary greater than 10,000
-- select * from employees e where e.salary < 10000
-- select * from department d where d.department_id in (select e.department_id from employees e where e.salary < 10000);


-- https://www.w3resource.com/sql-exercises/subqueries/index.php
--1 select * from Orders where salesman_id = (select salesman_id from Salesman where name = 'Paul Adam');
--2 select * from Orders where salesman_id in (select salesman_id from Salesman where city= 'London');
--3 select * from Orders where salesman_id = (select salesman_id from Orders where customer_id = 3007);
--4 select * from Orders where purch_amt >= (select avg(purch_amt) from Orders where ord_date = '2012-10-10');
--5 select * from orders where salesman_id = (select salesman_id from salesman where city = 'New York');
--6 SELECT commission FROM salesman WHERE salesman_id IN (SELECT salesman_id FROM customer WHERE city = 'Paris');
--8 select count(customer_id),grade from Customer group by grade having grade > (select avg(grade) from Customer where city = 'New York');

-- interview questions
-- https://www.youtube.com/watch?v=UlXtfq-kuF4
-- find 3rd highest salary
-- select * from EmployeeInfo order by salary desc limit 1 offset 2;

-- find nth highest salary
-- n=3
-- using limit 
-- select * from EmployeeInfo order by salary desc limit 1 offset (n-1);

-- without using limit
-- select *from EmplyoeeInfo e1 where n-1 = select count(distinct(salary)) from EmployeeInfo e2 where e2.salary>e1.salary

-- sql dataset
-- https://www.sqltutorial.org/sql-sample-database/

-- find duplicate name in table
-- SELECT first_name, COUNT(*)
-- FROM employees
-- GROUP BY first_name
-- HAVING COUNT(*) > 1;

-- delete duplicate row in table
-- select * from employees e1,employees e2 where e1.employee_id > e2.employee_id and e1.email = e2.email order by e2.email

-- find employees working in same department
-- SELECT *
-- FROM employees
-- WHERE department_id IN (
--     SELECT department_id
--     FROM employees
--     GROUP BY department_id
--     HAVING COUNT(*) > 1
-- ) order by department_id

-- to find number of employees working in department
-- SELECT d.department_name,count(e.employee_id) as employees
--     FROM employees e inner join departments d on e.department_id = d.department_id
--     GROUP BY d.department_name
--     HAVING COUNT(*) >= 1
-- find even and odd employees
-- select * from employees where (employee_id % 2) = 

-- https://learnsql.com/blog/group-by-exercises/
-- group by examples


-- highest salary in each department
-- select dept.department_name,max(emp.salary) as max_salary from departments dept 
-- inner join employees emp on dept.department_id = emp.department_id group by 
-- dept.department_name order by max_salary desc

-- soln 2
-- SELECT d.department_name, e.employee_id, e.first_name, e.salary
-- FROM departments d
-- JOIN employees e ON d.department_id = e.department_id
-- WHERE (e.department_id, e.salary) IN 
--     (SELECT department_id, MAX(salary) 
--      FROM employees 
--      GROUP BY department_id);


-- important 
-- You can place the Subquery in a number of SQL clauses: WHERE clause, HAVING clause, FROM clause.
-- https://www.w3resource.com/sql-exercises/subqueries/index.php
-- prob 1
-- select ord_no,purch_amt,ord_date,customer_id,salesman_id from Orders where salesman_id in (select salesman_id from Salesman where name = 'Paul Adam')

-- prob 4
-- select * from Orders where purchase_amt > (select avg(purch_amt) from Orders where ord_date ='2021-10-10')

-- https://learnsql.com/blog/sql-subquery-practice/
-- Exercise 1
-- select * from orchestras where city_origin in (select city from concerts where year = '2013');

-- exercise 2
-- select name,position from members where experience > 10 and orchestra_id in 
-- (select id from orchestras where rating > 8.0)

-- Exercise 4
-- select name from orchestras where rating > 7.5 and year > (select year from orchestras where name = 'Chamber Orchestra')

-- select salary from employees order by salary desc limit 1 offset 2;
--  find nth highest salary
-- For salary = 300,000 (from t1), the subquery (t2) counts salaries greater than 300,000. There is 1 salary (500,000). So, it matches the condition.

-- For salary = 75,000 (from t1), the subquery (t2) counts salaries greater than or equal to 75,000. There are 3 salaries (500,000, 300,000, 100,000). So, it does not match the condition.

-- For salary = 60,000 (from t1), the subquery (t2) counts salaries greater than or equal to 60,000. There are 4 salaries (500,000, 300,000, 100,000, 75,000). So, it does not match the condition.

-- For salary = 500,000 (from t1), the subquery (t2) counts salaries greater than or equal to 500,000. There is 0 salary. So, it does not match the condition.

-- For salary = 100,000 (from t1), the subquery (t2) counts salaries greater than or equal to 100,000. There are 2 salaries (500,000, 300,000). So, it matches the condition.

-- find duplicate rows in table
-- select first_name from employees group by first_name having count(first_name) > 1
--select * from employees e1 where first_name in (select first_name from employees e2 where e1.employee_id > e2.employee_id)
--> is used to get only duplicate items
--!= is used to get both duplicate and original item

--delete duplicate row
--delete from employees e1 where first_name in (select first_name from employees e2 where e1.employee_id > e2.employee_id)

-- select first and last row from table
-- select * from employees where employee_id in (select min(employee_id) from employees)
-- select * from employees where employee_id in (select max(employee_id) from employees)

-- retrive list of employees working in same 
-- SELECT e1.employee_id AS empid1, e1.first_name AS name1, e1.department_id AS department
-- FROM employees e1, employees e2
-- WHERE e1.department_id = e2.department_id AND e1.employee_id < e2.employee_id order by department;

-- get last 3 records from table
-- select * from (select * from employees order by employee_id desc limit 3) as temp order by employee_id asc

-- get first four characters of employee name 
-- select substring(first_name,1,4) from employees

-- to fetch all records from employee table ordered by department in ascending order and salary in descending order
-- select * from employees order by job_id asc, salary desc

-- query to fetch total salary of each employee after adding 10%
-- select salary + (salary/10) as total_salary from employees

-- get two minimum and maximum salary from employee
-- select * from employees order by salary desc limit 2 
-- select * from employees order by salary asc limit 2

-- sql queries on joins
-- https://www.youtube.com/watch?v=fL2rgPGR0Eg&t=40s
-- find name of dept where more than 1 employee working
-- by subquery
-- select * from departments dept  where department_id in 
-- (select emp.department_id from employees emp where dept.department_id = emp.department_id 
--  group by emp.department_id having count(department_id) > 2)

-- by join
-- select d.department_name,d.department_id from departments d left join  employees e on d.department_id = e.department_id group by d.department_id having count(e.department_id) > 2
														
-- find avg salary of each department which is higher than 75000
-- select d.department_name,avg(e.salary) as avg_salary from departments d inner join  employees e on d.department_id = e.department_id 
-- group by d.department_id having avg(e.salary) > 5000 order by d.department_name desc

-- sql query to find employees whose salary exists between 35000 and 90000 with department
-- select e.first_name, e.last_name, d.department_name,e.salary from employees e inner join
-- departments d on e.department_id = d.department_id where e.salary between 4000 and 5000


