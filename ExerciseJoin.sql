/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT products.Name, categories.Name AS 'Category' from products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating from products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT FirstName, LastName, (SUM(sales.Quantity)) AS "Sales" FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT departments.Name AS 'Deparment', categories.Name AS 'Category' FROM categories
INNER JOIN departments ON departments.DepartmentID = categories.DepartmentID
WHERE categories.CategoryID IN (2,8);

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 -- product id is 97

SELECT products.Name, SUM(sales.Quantity) AS 'Sold', products.Price FROM products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- product id 857

SELECT products.Name AS 'Product', reviews.Reviewer AS 'Name', reviews.Rating, reviews.Comment FROM reviews
INNER JOIN products ON reviews.ProductID = products.ProductID
WHERE reviews.productId = 857
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name AS 'Product', SUM(sales.Quantity) AS 'Total Sales'
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.EmployeeID;