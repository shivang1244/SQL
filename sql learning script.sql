
SELECT lastName
FROM employees;

SELECT 
    lastName, 
    firstName, 
    jobTitle
FROM
    employees;
    
    
    SELECT employeeNumber,
       lastName,
       firstName,
       extension,
       email,
       officeCode,
       reportsTo,
       jobTitle
FROM   employees; 

SELECT * FROM employees;

SELECT 
  contactFirstname ,
  contactLastname
 
FROM 
  customers 
ORDER BY 
  contactLastname;
  
  SELECT 
  contactLastname, 
  contactFirstname 
FROM 
  customers 
ORDER BY 
  contactLastname DESC;
  
  SELECT 
  contactLastname, 
  contactFirstname 
FROM 
  customers 
ORDER BY 
  contactLastname DESC, 
  contactFirstname ASC;
  
  select * from orderdetails;
  SELECT 
  orderNumber, 
  orderlinenumber, 
  quantityOrdered * priceEach as subtotal
FROM 
  orderdetails 
ORDER BY 
  quantityOrdered * priceEach DESC;
  
  select * from orders;
  
  SELECT 
  orderNumber, 
  status 
FROM 
  orders 
ORDER BY 
  FIELD(
    status, 
    'In Process', 
    'On Hold', 
    'Cancelled', 
    'Resolved', 
    'Disputed', 
    'Shipped'
  );

SELECT 
  firstName, 
  lastName, 
  reportsTo 
FROM 
  employees 
ORDER BY 
  reportsTo;
  
  //1) Using the WHERE clause with equality operator example
The following query uses the WHERE clause to find all employees whose job titles are Sales Rep://
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
    
    Using the WHERE clause with the AND operator
The following example uses the WHERE clause to find employees whose job titles are Sales Rep and office codes are 1:

SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;

Using MySQL WHERE clause with OR operator
This query finds employees whose job title is Sales Rep or employees who locate the office with office code 1:
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;
    
    4) Using the WHERE clause with the BETWEEN operator example
The BETWEEN operator returns TRUE if a value is in a range of values:
The following query finds employees who are located in offices whose office code is from 1 to 3:
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

5) Using the WHERE clause with the LIKE operator example
The LIKE operator evaluates to TRUE if a value matches a specified pattern.
The following query finds the employees whose last names end with the string 'son':
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

Using the WHERE clause with the IN operator example
The IN operator returns TRUE if a value matches any value in a list.
he following example uses the WHERE clause with the IN operator to find employees who are located in the offices with the codes 1, 2, and 3:
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
    
    
     Using MySQL WHERE clause with the IS NULL operator
To check if a value is NULL or not, you use the IS NULL operator, not the equal operator (=). The IS NULL operator returns TRUE if a value is NULL.
The following statement uses the WHERE clause with the IS NULL operator to get the rows with the values in the reportsTo column are NULL:
SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    
    
    ) Using MySQL WHERE clause with comparison operators
The following table shows the comparison operators that you can use to form the expression in the WHERE clause.

Operator	Description
=	Equal to. You can use it with almost any data type.
<> or !=	Not equal to
<	Less than. You typically use it with numeric and date/time data types.
>	Greater than.
<=	Less than or equal to
>=	Greater than or equal to
The following query uses the not equal to (<>) operator to find all employees who are not the Sales Rep:
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';
    
    the following query finds employees whose office code is greater than 5:
    SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
    
    The following query returns employees with office code less than or equal to 4 (<=4):
    SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;
    
    
    Introduction to MySQL DISTINCT clause
When querying data from a table, you may get duplicate rows. To remove these duplicate rows, you use the DISTINCT clause in the SELECT statement.
When executing the SELECT statement with the DISTINCT clause, MySQL evaluates the DISTINCT clause after the FROM, WHERE, and SELECT clause and before the ORDER BY clause:

MySQL DISTINCT Clause

SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;

When you use the DISTINCT clause to query the states, you will see distinct states and NULL as follows:

SELECT DISTINCT state
FROM customers;

When you specify multiple columns in the DISTINCT clause, the DISTINCT clause will use the combination of values in these columns to determine the uniqueness of the row in the result set.

For example, to get a unique combination of city and state from the customers table, you use the following query:

select Distinct 
      state ,
      city 
from customers
where state is not Null  
order By
      state ,
      city ;
   
   
   Introduction to MySQL AND operator
MySQL doesn’t have a built-in Boolean type. Instead, it uses the number zero as FALSE and non-zero values as TRUE.

The AND operator is a logical operator that combines two or more Boolean expressions and returns 1, 0, or NULL:

SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';

By using the AND operator, you can combine more than two Boolean expressions. For example, the following query returns the customers who are located in California, USA, and have a credit limit greater than 100K.

SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;
    
    SELECT    
	customername, 
	country
FROM    
	customers
WHERE country = 'USA' OR 
      country = 'France';
      
      
      The following example uses the OR operator to select the customers who locate in the USA or France and have a credit limit greater than 100,000.
      
      SELECT   
	customername, 
	country, 
	creditLimit
FROM   
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;
      
      
      Notice that if you do not use the parentheses, the query will return the customers who locate in the USA or the customers located in France with a credit limit greater than 100,000.
      
      MySQL IN operator and NULL
Generally, the IN operator returns NULL in two cases:

The value on the left side of the operator is NULL.
The value doesn’t equal any value in the list and one of the values in the list is NULL.

SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');
    
    SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city; 
    
    The following example uses the BETWEEN operator to find products whose buy prices between 90 and 100:
    SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
    
    To find the products whose buy prices are not between $20 and $100, you use the NOT BETWEEN operator as follows:
    SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
    For example, the following statement returns the orders with the required dates between 01/01/2003 to 01/31/2003:
    
    SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
     
     Introduction to MySQL LIKE operator
The LIKE operator is a logical operator that tests whether a string contains a specified pattern or not.
1) Using MySQL LIKE operator with the percentage (%) wildcard examples
This example uses the LIKE operator to find employees whose first names start with the letter a:

select employeeNumber,
   lastName,
   firstName
from employees
where 
firstName Like 'a%'

this example uses the LIKE operator to find employees whose last names end with the literal string on e.g., Patterson, Thompson:

select 
       employeeNumber 
       lastname,
       firstName
from employees 
where 
     lastName Like '%on';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
    
    3) Using MySQL NOT LIKE operator example
The MySQL allows you to combine the NOT operator with the LIKE operator to find a string that does not match a specific pattern.

Suppose you want to search for employees whose last names don’t start with the letter B, you can use the NOT LIKE operator as follows:
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';
    
For example, if you want to find products whose product codes contain the string _20 , you can use the pattern %\_20% with the default escape character:
    select 
          productcode,
          productName
    from products
    where productcode Like '%\_20%';
    
    Introduction to MySQL LIMIT clause
The LIMIT clause is used in the SELECT statement to constrain the number of rows to return. The LIMIT clause accepts one or two arguments. The values of both arguments must be zero or positive integers.

The following illustrates the LIMIT clause syntax with two arguments:
Therefore, to ensure the LIMIT clause returns an expected output, you should always use it with an ORDER BY clause like this:

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;

This query uses the COUNT(*) aggregate function to get the total rows from the customers table
SELECT 
    COUNT(*) 
FROM 
    customers;
    
    SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName desc
LIMIT 10;

This query uses the LIMIT clause to get the rows of the second page that include rows 11 – 20:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;

3) Using MySQL LIMIT to get the nth highest or lowest value
To get the nth highest or lowest value, you use the following LIMIT clause:
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 2,1;

he example uses the LIMIT clause with the DISTINCT clause to return the first five unique states in the customers table:

SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;

To test whether a value is NULL or not, you use the  IS NULL operator.
The following query uses the IS NULL operator to find customers who do not have a sales representative:

SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName;


This example uses the IS NOT NULL operator to get the customers who have a sales representative:
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
   customerName;
   
   Column aliases
In MySQL, you use column aliases to assign a temporary name to a column in the query’s result set.
The following query selects the first names and last names of employees. It uses the CONCAT_WS() function to concatenate first name and last name into full name:

SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;

SELECT
   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;
   
   he following query uses the column alias in the ORDER BY clause to alphabetically sort the employee’s full names:
   SELECT
	CONCAT_WS(', ', lastName, firstname) `Full name`
FROM
	employees
ORDER BY
	`Full name`;
    
    The following statement selects orders whose total amount is greater than 60000. It uses column aliases in GROUP BY and HAVING clauses.
    SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) Total
FROM
	orderdetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;
    
    SELECT
	customerName,
	COUNT(o.orderNumber) total
FROM
	customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC;
    
    
    SELECT
	customers.customerName,
	COUNT(orders.orderNumber) total
FROM
	customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC
    
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

MySQL INNER JOIN clause
The following shows the basic syntax of the inner join clause that joins two tables table_1 and table_2:
SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;



SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
    Because the joined columns of both tables have the same name  productline, you can use the USING syntax:
    SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);

his query returns the order number, order status, and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BYclause:
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY t1.orderNumber;

SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;

This query uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;


This example uses three INNER JOIN clauses to query data from the four tables above:

SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
    
     MySQL LEFT JOIN clause
The LEFT JOIN allows you to retrieve data from two or more tables. Like the INNER JOIN clause, the LEFT JOIN is an optional clause of the SELECT statement, which appears immediately after the FROM clause.

SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;
    
    
    alternative 
    
    SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;
    
    SELECT
	customerNumber,
	customerName,
	orderNumber,
	status
FROM
	customers
LEFT JOIN orders USING (customerNumber);

Using MySQL LEFT JOIN clause to find unmatched rows
The LEFT JOIN clause is very useful when you need to identify rows in a table that doesn’t have a matching row from another table.

The following example uses the LEFT JOIN to find customers without any orders:

SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;
    
     Using MySQL LEFT JOIN to join three tables
See the following three tables employees, customers, and payments:
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;
    
    Condition in WHERE clause vs. ON clause
The following example uses the LEFT JOIN clause to query data from the orders and  orderDetails tables:
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails 
    USING (orderNumber)
WHERE
    orderNumber = 10123; 
    
     RIGHT JOIN clause
MySQL RIGHT JOIN is similar to LEFT JOIN, except that the treatment of the joined tables is reversed.
) Simple MySQL RIGHT JOIN example
This statement uses the RIGHT JOIN clause join the table customers with the table employees.
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;

Using MySQL RIGHT JOIN to find unmatching rows
The following statement uses the RIGHT JOIN clause to find employees who are not in charge of any customers:
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

A self join allows you to join a table to itself. Since MySQL does not have specific self join syntax, you need to perform a self join via a regular join such as left join or inner join.
Performing a self join using an inner join
To obtain the entire organization structure, you can perform a self join on the employees table using the employeeNumber and reportsTo columns:

SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
    Performing a self join using a left join
The President is the employee who does not have any manager or value in the reportsTo column is NULL .

The following statement uses the LEFT JOIN clause instead of INNER JOIN to include the President:
SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
    
    Using a self join to compare successive rows within the same table
By using the MySQL self join, you can display a list of customers who are located in the same city by joining the customers table to itself.
 SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;
    
     MySQL CROSS JOIN clause
Suppose you join two tables using the CROSS JOIN clause. The result set will include all rows from both tables, where each row is the combination of the row in the first table with the row in the second table. In general, if each table has n and m rows respectively, the result set will have nxm rows.
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2 )
);

CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);

CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL(13 , 2 ) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id , store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO products(product_name, price)
VALUES('iPhone', 699),
      ('iPad',599),
      ('Macbook Pro',1299);

INSERT INTO stores(store_name)
VALUES('North'),
      ('South');

INSERT INTO sales(store_id,product_id,quantity,sales_date)
VALUES(1,1,20,'2017-01-02'),
      (1,2,15,'2017-01-05'),
      (1,3,25,'2017-01-05'),
      (2,1,30,'2017-01-02'),
      (2,2,35,'2017-01-05');
SELECT 
    store_name,
    product_name,
    SUM(quantity * price) AS revenue
FROM
    sales
        INNER JOIN
    products ON products.id = sales.product_id
        INNER JOIN
    stores ON stores.id = sales.store_id
GROUP BY store_name , product_name; 
SELECT 
    store_name, product_name
FROM
    stores AS a
        CROSS JOIN
    products AS b;
SELECT 
    b.store_name,
    a.product_name,
    IFNULL(c.revenue, 0) AS revenue
FROM
    products AS a
        CROSS JOIN
    stores AS b
        LEFT JOIN
    (SELECT 
        stores.id AS store_id,
        products.id AS product_id,
        store_name,
            product_name,
            ROUND(SUM(quantity * price), 0) AS revenue
    FROM
        sales
    INNER JOIN products ON products.id = sales.product_id
    INNER JOIN stores ON stores.id = sales.store_id
    GROUP BY stores.id, products.id, store_name , product_name) AS c ON c.store_id = b.id
        AND c.product_id= a.id
ORDER BY b.store_name;


If you want to group the order statuses, you can use the GROUP BY clause with the status column in the following query:
SELECT 
  status 
FROM 
  orders 
GROUP BY 
  status;
  
Using MySQL GROUP BY with aggregate functions
In practice, you often use the GROUP BY clause with an aggregate function to group rows into sets and return a single value for each group.
For example, to obtain the number of orders in each status, you can use the COUNT function with the GROUP BY clause as follows:
SELECT 
  status, 
  COUNT(*) 
FROM 
  orders 
GROUP BY 
  status;
  
  to get the total amount of all orders by status, you join the orders table with the orderdetails table and use the SUM function to calculate the total amount:
  SELECT 
  status, 
  SUM(quantityOrdered * priceEach) AS amount 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
GROUP BY 
  status;
  
  MySQL GROUP BY with expression example
In addition to columns, you can group rows by expressions. The following query calculates the total sales for each year:
SELECT 
  YEAR(orderDate) AS year, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  YEAR(orderDate);
  
  Using MySQL GROUP BY with HAVING clause example
To filter the groups returned by GROUP BY clause, you use a  HAVING clause.

The following query uses the HAVING clause to select the total sales of the years after 2003.
SELECT 
  YEAR(orderDate) AS year, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  year 
HAVING 
  year > 2003;
  
   Grouping by multiple columns
The following query returns the year, order status, and the total order for each combination of year and order status by grouping rows into groups:
SELECT 
  YEAR(orderDate) AS year, 
  status, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
GROUP BY 
  year, 
  status 
ORDER BY 
  year;
  
  The following statement uses the GROUP BY clause to select the unique states of customers from the customers table.
  SELECT 
  state 
FROM 
  customers 
GROUP BY 
  state;
  
  
  SELECT 
  DISTINCT state 
FROM 
  customers;
  
  MySQL HAVING clause
The HAVING clause is used with the GROUP BY clause to filter the groups based on a specified condition.
he following uses the GROUP BY clause to get order numbers, the number of items sold per order, and total sales for each from the orderdetails table:
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber;
  
  Now, you can find which order has total sales greater than 1000 by using the HAVING clause as follows:
  SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber 
HAVING 
  total > 1000;
  
  he following example uses the HAVING clause to find orders that have total amounts greater than 1000 and contain more than 600 items
  SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND 
    itemsCount > 600;
    
Suppose that you want to find all orders that already shipped and have a total amount greater than 1500, you can join the orderdetails table with the orders table using the INNER JOIN clause and apply a condition on status column and total aggregate as shown in the following query:
SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    
SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    
    MySQL HAVING COUNT
In MySQL, the GROUP BY clause organizes rows into groups. When you combine the GROUP BY clause with the COUNT function, you will get both the groups and the number of items in each group.

To filter the groups based on the number of items in each group, you use the HAVING clause and the COUNT function
he following query uses the HAVING clause with the COUNT function to get the customers who placed more than four orders:
SELECT 
  customerName, 
  COUNT(*) order_count 
FROM 
  orders 
  INNER JOIN customers using (customerNumber) 
GROUP BY 
  customerName 
HAVING 
  COUNT(*) > 4 
ORDER BY 
  order_count;
  
  The following statement creates a new table named sales that stores the order values summarized by product lines and years. The data comes from the products, orders, and orderDetails tables in the sample database
  CREATE TABLE sales
SELECT
    productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM
    orderDetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine ,
    YEAR(orderDate);
    
    MySQL ROLLUP Overview
A grouping set is a set of columns to which you want to group. For example, the following query creates a grouping set denoted by (productline)
SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline;

SELECT 
    SUM(orderValue) totalOrderValue
FROM
    sales;

f you want to generate two or more grouping sets together in one query, you may use the UNION ALL operator as follows:
SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline 
UNION ALL
SELECT 
    NULL, 
    SUM(orderValue) totalOrderValue
FROM
    sales;
    
    The ROLLUP generates multiple grouping sets based on the columns or expressions specified in the GROUP BY clause. For example:
SELECT 
    productLine, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline WITH ROLLUP;

SELECT 
    productLine, 
    orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline, 
    orderYear 
WITH ROLLUP;

he GROUPING() function
To check whether NULL in the result set represents the subtotals or grand totals, you use the GROUPING() function.

The GROUPING() function returns 1 when NULL occurs in a supper-aggregate row, otherwise, it returns 0.

The GROUPING() function can be used in the select list, HAVING clause, and (as of MySQL 8.0.12 ) ORDER BY clause.
 
SELECT 
    orderYear,
    productLine, 
    SUM(orderValue) totalOrderValue,
    GROUPING(orderYear),
    GROUPING(productLine)
FROM
    sales
GROUP BY 
    orderYear,
    productline
WITH ROLLUP;

he following example shows how to combine the IF() function with the GROUPING() function to substitute labels for the super-aggregate NULL values in orderYear and productLine columns:
SELECT 
    IF(GROUPING(orderYear),
        'All Years',
        orderYear) orderYear,
    IF(GROUPING(productLine),
        'All Product Lines',
        productLine) productLine,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    orderYear , 
    productline 
WITH ROLLUP;

the MySQL Subquery
A MySQL subquery is a query nested within another query such as SELECT, INSERT, UPDATE or DELETE. Also, a subquery can be nested within another subquery.

A MySQL subquery is called an inner query whereas the query that contains the subquery is called an outer query. A subquery can be used anywhere that expression is used and must be closed in parentheses.
SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
or example, the following query returns the customer who has the highest payment.
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
For example, you can find customers whose payments are greater than the average payment using a subquery:

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payments);
For example, you can use a subquery with NOT IN operator to find the customers who have not placed any orders as follows:
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);

he following subquery finds the maximum, minimum, and average number of items in sale orders:
SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;
    
The following example uses a correlated subquery to select products whose buy prices are greater than the average buy price of all products in each product line.
SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline);
            
he following query finds sales orders whose total values are greater than 60K.
SELECT 
    orderNumber, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;

You can use the query above as a correlated subquery to find customers who placed at least one sales order with a total value greater than 60K by using the EXISTS operator:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000);
        
MySQL derived tables
A derived table is a virtual table returned from a SELECT statement. A derived table is similar to a temporary table, but using a derived table in the SELECT statement is much simpler than a temporary table because it does not require creating a temporary table.

The term derived table and subquery is often used interchangeably. When a stand-alone subquery is used in the FROM clause of a SELECT statement, it is also called a derived table.
Basic MySQL Derived Table example
The following query gets the top five products by sales revenue in 2003 from the orders and orderdetails tables in the sample database:

SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;

You can use the result of this query as a derived table and join it with the products table as follows
SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);
    
Suppose you have to classify the customers who bought products in 2003 into 3 groups: platinum, gold, and silver. And you need to know the number of customers in each group with the following conditions:

Platinum customers who have orders with a volume greater than 100K.
Gold customers who have orders with a volume between 10K and 100K.
Silver customers who have orders with a volume of less than 10K.
To form this query, you first need to put each customer into the respective group using CASE expression and GROUP BY clause as follows:

SELECT 
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY customerNumber;

Then, you can use this query as the derived table and perform grouping as follows:
SELECT 
    customerGroup, 
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;    


MySQL EXISTS operator
The EXISTS operator is a boolean operator that returns either true or false. The EXISTS operator is often used to test for the existence of rows returned by the subquery.
The following statement uses the EXISTS operator to find the customer who has at least one order:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS(
	SELECT 
            1
        FROM
            orders
        WHERE
            orders.customernumber 
		= customers.customernumber);

The following example uses the NOT EXISTS operator to find customers who do not have any orders:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    NOT EXISTS( 
	SELECT 
            1
        FROM
            orders
        WHERE
            orders.customernumber = customers.customernumber
	);
    MySQL UPDATE EXISTS examples
Suppose that you have to update the phone extensions of the employees who work at the office in San Francisco.

The following statement finds employees who work at the office in San Franciso:
SELECT 
    employeenumber, 
    firstname, 
    lastname, 
    extension
FROM
    employees
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            offices
        WHERE
            city = 'San Francisco' AND 
           offices.officeCode = employees.officeCode);
This example adds the number 1 to the phone extension of employees who work at the office in San Francisco:
UPDATE employees 
SET 
    extension = CONCAT(extension, '1')
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            offices
        WHERE
            city = 'San Francisco'
                AND offices.officeCode = employees.officeCode);
MySQL EXCEPT operator
The MySQL EXCEPT operator allows you to retrieve rows from one query that do not appear in another query.

Here’s the basic syntax of the MySQL EXCEPT operator
The following query uses the EXCEPT operator to find the first names that appear in the customers table but do not appear in the employees table:
SELECT firstName
FROM employees
EXCEPT
SELECT contactFirstName
FROM customers;

Using the EXCEPT operator with the ORDER BY clause example
To sort the result set returned by the EXCEPT operator, you use the ORDER BY clause.

For example, the following query uses the EXCEPT operator to get the first names that appear in the employees table but do not appear in the customers table and sort the first names alphabetica
SELECT firstName
FROM employees
EXCEPT
SELECT contactFirstName
FROM customers
ORDER BY firstName;

 Using the EXCEPT operator with the ALL option
The following example uses the EXCEPT operator with the ALL option to retain duplicate first names in the result set:
SELECT firstName
FROM employees
EXCEPT ALL
SELECT contactFirstName
FROM customers
ORDER BY firstName;

the MySQL INTERSECT operator
The INTERSECT operator is a set operator that returns the common rows of two or more queries.

Here’s the syntax of the INTERSECT operator:
The following query uses the INTERSECT operator to find the common first names of customers and employees:
SELECT 
    firstName
FROM
    employees 
INTERSECT
SELECT 
    contactFirstname
FROM
    customers;
    
Using INTERSECT operator with ORDER BY clause
To sort the result set returned by the INTERSECT operator, you use the ORDER BY clause. MySQL uses the columns of the first query as the column name of the result set.

For example, the following query uses the INTERSECT operator to find the common first names of employees and customers and sort them in ascending order:
SELECT 
    firstName
FROM
    employees 
INTERSECT
SELECT 
    contactFirstname
FROM
    customers
ORDER BY firstName;

Using INTERSECT operator with ALL option example
The following example uses the INTERSECT operator with the ALL option that finds the common first names of employees and customers and retains the duplicates:
SELECT 
    firstName
FROM
    employees 
INTERSECT ALL
SELECT 
    contactFirstname
FROM
    customers
ORDER BY firstName;


ADD COLUMN statement
To add a new column to an existing table, you use the ALTER TABLE … ADD COLUMN statement as follows:

ALTER TABLE customers
ADD COLUMN gender varchar (80) 
[FIRST | AFTER existing_column];

CREATE TABLE vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,l
    name VARCHAR(255)
);

ALTER TABLE vendors
ADD COLUMN phone VARCHAR(15) AFTER name;

Adding a column as the last column
First, add a new column vendor_group to the vendors table:
ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL;

Adding two columns example
First, insert some rows into the vendors table.
INSERT INTO vendors(name,phone,vendor_group)
VALUES('IBM','(408)-298-2987',1),
      ('Microsoft','(408)-298-2988',1);
      SELECT 
  id, 
  name, 
  phone, 
  vendor_group 
FROM 
  vendors;
  
  ALTER TABLE vendors
ADD COLUMN email VARCHAR(100) NOT NULL,
ADD COLUMN hourly_rate decimal(10,2) NOT NULL;


DROP TABLE CarAccessories, CarGadgets;

ALTER TABLE table_name
DROP COLUMN column_name_1,
DROP COLUMN column_name_2,
...;

temporary tables
In MySQL, a temporary table is a special type of table that allows you to store a temporary result set, which you can reuse several times in a single session.


MySQL Generated Column
When you create a new table, you specify the table columns in the CREATE TABLE statement. Then, you use the INSERT, UPDATE, and DELETE statements to modify directly the data in the table columns.

DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
    );
    
    the MySQL primary key
In MySQL, a primary key is a column or a set of columns that uniquely identifies each row in the table. A primary key column must contain unique values.

If the primary key consists of multiple columns, the combination of values in these columns must be unique. Additionally, a primary key column cannot contain NULL.

A table can have either zero or one primary key, but not more than one.
CREATE TABLE products(
   id INT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO products (id, name) 
VALUES 
    (1, 'Laptop'),
    (2, 'Smartphone'),
    (3, 'Wireless Headphones');
    DROP TABLE products; 

CREATE TABLE products(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
INSERT INTO products (name) 
VALUES 
    ('Laptop'),
    ('Smartphone'),
    ('Wireless Headphones');
    
    
    CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE faviorites(
    customer_id INT,
    product_id INT,
    favorite_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(customer_id, product_id)
);

MySQL foreign key
A foreign key is a column or group of columns in a table that links to a column or group of columns in another table. The foreign key places constraints on data in the related tables, which allows MySQL to maintain referential integrity.
CREATE DATABASE fkdemo;

USE fkdemo;
Inside the fkdemo database, create two tables categories and products:

CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;
CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName VARCHAR(100) NOT NULL, 
  categoryId INT, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) 
                         REFERENCES categories(categoryId)
) ENGINE = INNODB;
INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;


CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;

Basic MySQL INSERT statement example
The following statement inserts a new row into the tasks table:

INSERT INTO tasks(title, priority) 
VALUES('Learn MySQL INSERT Statement', 1);

INSERT INTO tasks(title, priority) 
VALUES('Understanding DEFAULT keyword', DEFAULT);



INSERT INTO tasks(title, start_date, due_date) 
VALUES ('Insert date into table', '2018-01-09', '2018-09-15');


INSERT INTO tasks(title, start_date, due_date) 
VALUES 
  (
    'Use current date for the task', 
    CURRENT_DATE(), 
    CURRENT_DATE()
  );
  
  
  INSERT INTO tasks(title, priority)
VALUES
	('My first task', 1),
	('It is the second task',2),
	('This is the third task of the week',3);
    
Suppose you have a table that has an auto-increment column:

CREATE TABLE t(
   id INT AUTO_INCREMENT PRIMARY KEY
);
The following statement insert a new row into the t table, which uses the generated value:

INSERT INTO t VALUES();
In this statement, we don’t specify any column after the table name and any values inside the VALUES() clause.






INSERT INTO SELECTexample
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);

SELECT 
    customerNumber,
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';


INSERT INTO suppliers (
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';
    
    Third, insert a new row into the employees table, or update the existing row if a duplicate key violation occurs:
    INSERT INTO employees(id, name, age, salary)
VALUES (1, 'Jane Smith', 26, 130000)

AS new
ON DUPLICATE KEY UPDATE
   name = new.name,
   age = new.age,
   salary = new.salary;
   
   
   DATETIME column
The DATETIME data type is used to store both date and time values. To define a column with the DATETIME data type, you use the following syntax
CREATE TABLE events(
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_time DATETIME NOT NULL
);
INSERT INTO events(event_name, event_time)
VALUES('MySQL tutorial livestream', '2023-10-28 19:30:35');

MySQL UPDATE statement
The UPDATE statement updates data in a table. It allows you to change the values in one or more columns of a single row or multiple rows.
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
    
    UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
    UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
    UPDATE customers 
SET 
    salesRepEmployeeNumber = (SELECT 
            employeeNumber
        FROM
            employees
        WHERE
            jobtitle = 'Sales Rep'
        ORDER BY RAND()
        LIMIT 1)
WHERE
    salesRepEmployeeNumber IS NULL;


MySQL UNIQUE constraint
Sometimes, you want to ensure values in a column or a group of columns are unique. For example, email addresses of users in the users table, or phone numbers of customers in the customers table should be unique. To enforce this rule, you use a UNIQUE constraint.

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name,address)
);
INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-2476',
       '4000 North 1st Street');
       INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street

Add new unique constraint
The following ALTER TABLE ADD CONSTRAINT adds a unique constraint to a column of an existing table:

ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
UNIQUE (column_list);

ALTER TABLE suppliers
ADD CONSTRAINT uc_name_address 
UNIQUE (name,address);

MySQL NOT NULL constraints
A NOT NULL constraint ensures that values stored in a column are not NULL. The syntax for defining a NOT NULL constraint is as follows:



INSERT INTO tasks(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', '2017-02-01','2017-02-02'),
      ('Check and update NOT NULL constraint to your database', '2017-02-01',NULL);
SELECT * FROM tasks 
WHERE end_date IS NULL;
UPDATE tasks 
SET 
    end_date = start_date + 7
WHERE
    end_date IS NULL;
    
    
    ALTER TABLE tasks 
CHANGE 
    end_date 
    end_date DATE NOT NULL;
