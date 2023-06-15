-- data definition language
-- to create table employees
-- CREATE TABLE employees (
-- emp_id INT NOT NULL,
-- first_name VARCHAR(20),
-- last_name VARCHAR(20),
-- salary INT,
-- primary key(emp_id)
-- );

-- to alter table and add contact column
-- alter table employees add column contact int;

-- to truncate table
-- truncate table employees;

-- to drop table 
-- drop table employees;

-- to rename column
-- alter table employees rename column contact to phone;

-- data manipulation language
-- to insert data in table
-- insert into employees (emp_id,first_name,last_name,salary,dept,dept_id) values (105,'atif','xec',700000,'hr',3);

-- to update data in table
-- update employees set salary = 54000000 where emp_id = 100;

-- to delete data from table
-- delete from employees where emp_id = 102;

-- sql operators
-- filter
-- select * from employees where emp_id = 100;

-- logical operators
-- select * from employees where first_name = 'akash' and last_name = 'bhat';
-- select * from employees where first_name = 'akash' or last_name = 'bhat';
-- select * from employees where first_name = 'akash' or last_name != 'bhat';

-- comparison operator
-- select * from employees where salary >= 600000;
-- select * from employees where salary <= 600000;
-- select * from employees where salary = 7000000;
-- select * from employees where salary <> 7000000;

-- special operators
-- between,like,is null, in and distinct
-- select * from employees where salary between 6000000 and 10000000;
-- select * from employees where first_name like 'akash';
-- select * from employees where salary is null;
-- select * from employees where salary in (7000000,70000,54000000);
-- select distinct first_name from employees;

-- aggregation operator
-- avg,count,min,max,sum
-- select avg(salary) from employees;
-- select count(*) from employees;
-- select min(salary) from employees;
-- select max(salary) from employees;
-- select sum(salary) from employees;

-- group by dept
-- add dept in employee table
-- alter table employees add column dept varchar(50);
-- update employees set dept = 'tech' where emp_id in (101,100
-- select min(salary),dept from employees group by dept;

-- having
-- select salary from employees group by dept and having more than 2 employees
-- select min(salary),dept from employees group by dept having count(dept) >2;

-- order by
-- by default order by uses asc
-- select * from employees order by salary desc;

-- joins
-- create table dept
-- create table department (id int, dept_name varchar,dept_loc varchar);
-- insert into department (id,dept_name,dept_loc) values(4,'qa','india');
-- alter table employees add column dept_id int;
-- update employees set dept_id = 2 where dept = 'sales';

-- inner join
-- will give matched values from both tables
-- select e.first_name,e.last_name,d.dept_name from employees
-- e inner join department d on e.dept_id = d.id;

-- left join 
-- will give matched values from both tables and all values from left table
-- select e.first_name,e.last_name,d.dept_name from employees e left join department d on e.dept_id = d.id;


-- right join 
-- will give matched values from both tables and all values from right table
-- select e.first_name,e.last_name,d.dept_name from employees e right join department d on e.dept_id = d.id;

-- full outer join
-- it is union of left join and right join
-- select e.first_name,e.last_name,d.dept_name from employees
-- e left join department d on e.dept_id = d.id 
-- union
-- select e.first_name,e.last_name,d.dept_name from employees
-- e right join department d on e.dept_id = d.id;


-- excercise
-- question 1
-- create database bank
-- create database bank;

-- create table with name bank_details with columns
-- create table bank_details 
-- (product varchar, quantity int, price int, purchase_cost decimal, estimated_sale_price float);

-- insert two records in bank details
-- insert into bank_details (product,quantity,price,purchase_cost,estimated_sale_price)
-- values ('paypoints',4,200,80.00,68.00);

-- add column geo_location with varchar datatype
-- alter table bank_details add column geo_location varchar(20);

--value of geolocation for product paycard
-- select geo_location from bank_details where product = 'paycard';

-- alter product field from varchar to char
-- alter table bank_details alter column product type char(20);

-- import csv in sql
-- create table customer 
-- (customer_id int primary key, first_name varchar(50), last_name varchar(50), email varchar(50),address_id int)

-- create table payment 
-- (customer_id int primary key, amount int not null, mode varchar(50), payment_date date);

-- string functions
-- select upper(first_name) from customer;
-- select lower(first_name) from customer;
-- select length(first_name) from customer;

-- SELECT substring('SQL Tutorial', 'start', 'length');
-- select substring(first_name,1,3) from customer;
-- select concat(first_name,last_name) as full_name from customer;

-- SELECT REPLACE('SQL Tutorial', 'T', 'M');
-- select replace(first_name,'Mary','test') from customer;

-- select trim(first_name) from customer;

-- subqueries
-- find details of customers whose payment amount is > average of total amount
-- divide queries into parts
-- part 1
-- select avg(amount) from payment;
-- part 2
-- select * from payment where amount > (select avg(amount) from payment);

-- find details of customers are in both customer and payment table
-- select * from customer where customer_id in (select customer_id from payment where amount > 60 );

-- where exists
-- can be worked as a join
-- select * from customer c where exists (select amount,mode,customer_id from payment p where p.customer_id = c.customer_id and amount > 80 )

-- case statement
-- 1. general case
-- select amount,mode, case
-- when amount > 50 then 'expensive'
-- when amount = 50 then 'moderate'
-- else 'cheaper' end
-- as category
-- from payment;

-- 2. case expression
-- select amount,mode, case amount 
-- when 90 then 'expensive'
-- when 60 then 'moderate'
-- else 'cheaper'
-- end as category
-- from payment


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