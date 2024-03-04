-- MySQL  Project group9

USE seven_eleven;

-- Basic Queries
-- 1. Show list the total number of male customers who have the word “Mr” in the title.
SELECT customer_id, firstname, lastname
FROM customer
WHERE title = 'Mr';

-- 2. Show the id, first name, and last name of employees who have salaries more than 20,000 Baht.
SELECT employee_id, firstname, lastname
FROM employee
WHERE Salary > 20000;

-- 3. Demonstrate all provinces which are the customer’s address and total number of the customers of those specific provinces sorted by province .
SELECT province, COUNT(customer_id) AS 'total number of customer'
FROM location_customer
GROUP BY province
ORDER BY province;

-- 4. Count the number of orders that have a total price more than 100 Baht and sort by total price in ascending order.
SELECT order_id, SUM(total_price) AS total_amount
FROM order_line
GROUP BY order_id
HAVING total_amount > 100
ORDER BY total_amount;

-- 5. List the problems that are related to the application.
SELECT *
FROM call_history
WHERE problem_topic LIKE  '%App%'; 

-- 6. Find the average salary of employees in a 7-11 company.
SELECT AVG(salary) AS 'average salary' 
FROM employee;

-- 7. Find the top 3 best selling products in the 7-11 company.
SELECT product_id, SUM(amount) AS 'Amount'
FROM order_line
GROUP BY product_id
ORDER BY SUM(amount) DESC
LIMIT 3;

-- 8. List the total amount and total price of the products in each order id and sort by the total amount ascendingly.
SELECT order_id, SUM(amount) AS 'Total unit', SUM(total_price) AS 'Summation of total price'
FROM order_line
GROUP BY order_id
ORDER BY SUM(amount) ASC;

-- 9. Find the product ID of the least amount of remaining items in Branch_ID  04570.
SELECT branch_id, product_id, MIN(remaining_amount) AS 'amount'
FROM stock
WHERE branch_id = "04570";

-- 10. List all the branches with a new lot of product coming between 1 Nov 2021 to 15 Nov 2021. 
SELECT *
FROM stock
WHERE lot_date BETWEEN '2021-11-01' AND '2021-11-15';

-- 11. Show the top three employees (id, first name, last name, and salary) with the highest salary.
SELECT employee_id, firstname, lastname, salary
FROM employee
order by salary desc
limit 3;

-- 12. Count the number of each payment type and list it in descending order.
SELECT payment, COUNT(payment) AS "Total # of payment"
FROM order_goods
GROUP BY payment
ORDER BY COUNT(payment) DESC;

-- 13. Find the order that has the most total price.
SELECT order_id, SUM(total_price) as total_price
FROM order_line
group by order_id
order by total_price desc
limit 1;

-- 14. Show the id, first name, last name of all employees who have the word “Mrs” in the title.
SELECT employee_id, firstname, lastname
FROM employee
WHERE title = 'Mrs';

-- 15. List location no, road, and postcode of all location customers where province is in Bangkok.
SELECT location_no, road, post_code
FROM location_customer
WHERE Province = 'Bangkok';

-- 16. Show the average age of the customers who use the 7-11 Delivery application. 
SELECT AVG(YEAR(CURDATE()) - YEAR(date_of_birth)) as 'Average age of the users'
FROM customer;

-- 17. Count the number of customers that have locations in Nothaburi.
SELECT count(distinct customer_id) as 'Number of customer in Nonthaburi'
FROM location_customer
WHERE province = 'Nonthaburi';

-- 18. List all ages of the customers and list them in descending order.
SELECT firstname, lastname, YEAR(CURDATE()) - YEAR(date_of_birth) as age
FROM customer
ORDER BY age asc;

-- 19. List location no, branch id, sub district, and postcode of all location branches where the district is in Prawet.
SELECT location_no, Branch_ID, Sub_District, post_code
FROM location_branch
WHERE District = 'Prawet';

-- 20. List the top 2 employees (ID, first name, last name, E-mail) who have the letter “S” in their first name. 
SELECT employee_id, firstname, lastname, email
FROM employee
WHERE firstname like '%S%'
LIMIT 2;

-- Advance Queries
 -- 21.List all the total stock of the products in each branch (branch name, branch ID) and sort by the total stock descendingly.
SELECT b.branch_id, branch_name, SUM(remaining_amount) AS "Total stock"
FROM branch b
JOIN stock s ON b.branch_id = s.branch_id
GROUP BY branch_name
ORDER BY SUM(remaining_amount) DESC;

-- 22.List all manager names, inauguration date,  resignation date of each branch.
SELECT CONCAT(firstname, " ", lastname) AS manager_name, branch_name, inagugration_date, resignation_date
FROM employee e 
INNER JOIN manager m ON e.employee_id = m.employee_id 
INNER JOIN branch b ON e.branch_id = b.branch_id;

-- 23.List all products and its information (product_name, member_point, price, how_to_use, warning, producer).
SELECT name_of_product, member_point, price, how_to_use, warning, producer
FROM product AS p INNER JOIN information_of_product AS ip ON p.information_no = ip.information_no;

-- 24. List the username and name (first name and last name) of the customer who calls the call center asking for a refund and sort by customer name ascendingly.
SELECT Username AS "customer username", CONCAT(Firstname, " ", Lastname) AS "customer name"
FROM customer cus
JOIN call_history c ON cus.customer_id = c.customer_id
WHERE Problem_Topic = "refund"
ORDER BY Firstname;

-- 25. Show all product name, amount, total price and order date in each order sorted by order id and date ascending. 
SELECT ol.order_id, name_of_product, amount, total_price, order_date
FROM order_line AS ol 
INNER JOIN order_goods AS og ON ol.order_id = og.order_id
INNER JOIN product AS p ON ol.product_id = p.product_id
ORDER BY ol.order_id, order_date ASC;

-- 26.List all names (first name and last name) of customers and employees whose first name begins with letter “N” and order by lastname ascendingly.
SELECT firstname, lastname
FROM customer
WHERE firstname LIKE "N%"
UNION
SELECT firstname, lastname
FROM employee
WHERE firstname LIKE "N%"
ORDER BY lastname;

-- 27.List all names (firstname and lastname) of customers and the location where customers live at Nakhon Pathom.
SELECT CONCAT(Firstname, " ", Lastname) AS name, House_No AS "House No", village, Road, Sub_District, District, Province, Post_Code AS Postcode
FROM customer c
JOIN location_customer l ON c.Customer_ID = l.Customer_ID
WHERE province = "Nakhon Pathom";

-- 28.List all names (firstname and lastname) of employees who work at branch “Khlong Luang Muang Mai”.
SELECT CONCAT(firstname, " ", lastname) AS "employee name"
FROM employee e
JOIN branch b ON b.branch_id = e.branch_id
JOIN location_branch l ON b.branch_id = l.branch_id
WHERE road = "Khlong Luang Muang Mai";

-- 29.List all orders that payment by cash and has amount more than 250 Baht.
SELECT *, SUM(total_price)
FROM order_goods g
JOIN order_line l ON g.order_id = l.order_id
WHERE payment = "Cash"
GROUP BY g.order_id
HAVING SUM(total_price) > 250;

-- 30.Show all names of branches and location of branches.
SELECT branch_name, road, sub_district, district, province, post_code
from branch as b inner join location_branch as lb on b.branch_id = lb.branch_id;

-- 31.List all order id which is payment with cash and total price more than 70 Bath.
SELECT og.order_id, SUM(total_price) AS amount
FROM order_goods og
LEFT OUTER JOIN order_line oi ON oi.order_id = og.order_id
WHERE og.payment = "Cash"
GROUP BY og.order_id
HAVING SUM(total_price) > 70; 

-- 32.Show employee name who rides a motorbike to send an order.
SELECT CONCAT(firstname, " ", lastname) AS "employee name"
FROM employee e
JOIN sender s ON e.employee_id = s.employee_id;

-- 33.List of the number of products and companies sold.
SELECT iof.producer, SUM(oi.amount) AS "number of sales"
FROM order_line oi
JOIN product pro ON oi.product_id = pro.product_id
JOIN information_of_product iof ON pro.information_no = iof.information_no
GROUP BY producer
ORDER BY SUM(oi.amount) DESC;

-- 34.List branch_name, employee name (first name and last name), and salary of a manager who has a salary more than 23,000 Baht.
SELECT branch_name, CONCAT(firstname, " ", lastname) AS "employee name", salary
FROM branch b
JOIN employee e ON b.branch_id = e.branch_id
JOIN manager m ON e.employee_id = m.employee_id
WHERE salary > 23000;

-- 35.List all employees id, names and location where they work who can speak Chinese.
SELECT e.employee_id, firstname, lastname, CONCAT(road, ", ", sub_district, ", ", province, ", ", post_code) as work_location
FROM employee AS e 
INNER JOIN call_center AS c ON e.employee_id = c.employee_id
INNER JOIN location_branch AS lb ON e.branch_id = lb.branch_id
WHERE c.language_skill = "Chinese";

-- 36.Show all branch id, manager names of the branch, and the total number of employees of each branch sorted by branch_id.
SELECT 
    e.branch_id, 
    CONCAT(e.firstname, " ", e.lastname) AS manager_name, 
    COUNT(e2.employee_id) AS total_employee
FROM employee AS e
INNER JOIN manager AS m ON e.employee_id = m.employee_id
INNER JOIN employee AS e2 ON e.branch_id = e2.branch_id
GROUP BY e.branch_id
ORDER BY e.branch_id;

-- 37.List all names, IDs, date_of_birth of employees and customers who were born on Wednesday. Sort by their date of birth ascendingly.
SELECT employee_id, firstname, lastname, Date_Of_Birth
FROM employee
WHERE DAYOFWEEK(Date_Of_Birth) = 4
UNION
SELECT customer_id, firstname, lastname, Date_Of_Birth
FROM customer
WHERE DAYOFWEEK(Date_Of_Birth) = 4
ORDER BY Date_Of_Birth;

-- 38. Find the range of salary of employees ([Min, Max]) of each branch and sort by branch ID ascendingly.
SELECT b.branch_id, CONCAT("[",MIN(salary),",",MAX(salary),"]") AS salary_range
FROM branch b
JOIN employee e ON b.branch_id = e.branch_id
GROUP BY branch_id
ORDER BY branch_id;

-- 39.List all the employees except the employees who are managers.
SELECT *
FROM employee
WHERE employee_id NOT IN (SELECT employee_id FROM manager);

-- 40.Find all addresses of both customer and employee where the province is Bangkok.
SELECT employee_id, road, sub_district, district, province, post_code
FROM location_employee
WHERE province = "Bangkok"
UNION
SELECT customer_id, road, sub_district, district, province, post_code
FROM location_customer
WHERE province = "Bangkok";