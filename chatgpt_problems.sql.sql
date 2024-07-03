-- chat gpt problems
-- problem 1
-- products
--------
-- product_id (integer)
-- product_name (varchar)
-- price (decimal)
-- category_id (integer)

-- Write an SQL query to retrieve the total count of products in each category, 
-- ordered by the category with the highest count first.
-- select count (p.product_id) as "total_count" from products p group by p.category_id order by total_count desc;


-- problem 2
-- Consider three database tables, "orders", "order_items", and "products", with the following columns:

-- Table "orders":

-- order_id (integer)
-- order_date (date)
-- customer_id (integer)
-- Table "order_items":

-- item_id (integer)
-- order_id (integer)
-- product_id (integer)
-- quantity (integer)
-- Table "products":

-- product_id (integer)
-- product_name (text)
-- The "orders" table stores information about customer orders, the "order_items" table contains details about the individual items included in each order, 
-- and the "products" table contains information about the available products.
-- Write an SQL query to find the total quantity of each product ordered, 
-- along with the corresponding product name and the total number of orders.

-- SELECT oi.product_id, p.product_name, SUM(oi.quantity) AS total_quantity, COUNT(DISTINCT o.order_id) AS total_orders
-- FROM order_items oi
-- JOIN orders o ON o.order_id = oi.order_id
-- JOIN products p ON p.product_id = oi.product_id
-- GROUP BY oi.product_id, p.product_name;


-- problem 3
-- Consider a database table called students with the following schema:
-- students
-- --------
-- student_id (integer)
-- student_name (varchar)
-- date_of_birth (date)
-- grade (varchar)
-- Write an SQL query to retrieve the count of students in each grade, ordered by the grade in ascending order.
-- select student_name, count(*) from student group by grade order by asc;


-- problem 4
-- Given three tables, "students", "courses", and "enrollments", with the following columns:

-- Table "students":

-- student_id (integer)
-- first_name (text)
-- last_name (text)
-- Table "courses":

-- course_id (integer)
-- course_name (text)
-- Table "enrollments":

-- enrollment_id (integer)
-- student_id (integer)
-- course_id (integer)
-- Write an SQL query to retrieve the first and last names of students along with the courses they are enrolled in.
-- SELECT s.first_name, s.last_name, c.course_name
-- FROM students s
-- JOIN enrollments e ON s.student_id = e.student_id
-- JOIN courses c ON e.course_id = c.course_id;

-- problem 5
-- Given three tables, "orders", "order_items", and "products", with the following columns:

-- Table "orders":

-- order_id (integer)
-- order_date (date)
-- customer_id (integer)

-- Table "order_items":
-- item_id (integer)
-- order_id (integer)
-- product_id (integer)
-- quantity (integer)

-- Table "products":
-- product_id (integer)
-- product_name (text)
-- price (decimal)
-- Write an SQL query to find the total sales amount for each order,
-- along with the order ID and customer ID.
-- select (oi.quantity * p.price) as "total_sales" from order_items oi inner join products p on
-- p.product_id = oi.order_id inner join orders o on o.order_id = oi.order_id group by o.order_id;  

-- problem 6
-- -- Problem:
-- Consider the following database tables:
-- --------
-- student_id (integer)
-- student_name (varchar)
-- major_id (integer)

-- majors
-- ------
-- major_id (integer)
-- major_name (varchar)
-- Write an SQL query to retrieve the names of students along with their corresponding major names. However, if a student does not have a major assigned (major_id is NULL), display "Undeclared" as the major name for that student.
-- SELECT s.student_name, COALESCE(m.major_name, 'Undeclared') AS major_name
-- FROM students s
-- LEFT JOIN majors m ON s.major_id = m.major_id;

-- find last 3 employees
-- select * from (select * from employees  order by emp_id desc limit 3) temp order by temp asc

-- Write a query to retrieve the names of department who have more than 3 employees.
-- select e.dept_id, d.dept_name from employees e inner join department d on e.dept_id = d.id 
-- group by e.dept_id,d.dept_name 
-- having count(e.dept_id) >=3

-- Write a query to retrieve the names of users who are not in any department.
-- select e.first_name,e.last_name from employees e ,department d where d.dept_id not in (select dept_id from employees)


