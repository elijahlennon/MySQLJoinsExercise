/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

    SELECT 
    products.Name, categories.Name
FROM
    products
        INNER JOIN
    categories ON categories.CategoryID = products.CategoryID
WHERE
    categories.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT 
    *
FROM
    products
        INNER JOIN
    reviews ON reviews.ProductID = products.ProductID
WHERE
    reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT 
    e.FirstName,
    e.LastName,
    SUM(s.Quantity) AS Total
FROM
    sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;
SELECT 
    *
FROM
    sales
WHERE
    EmployeeID = 33809;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT 
    d.Name AS 'Department Name',
    c.Name AS 'Category Name'
FROM
    departments as d
        INNER JOIN
    categories AS c ON c.DepartmentID = d.DepartmentID
WHERE
    c.Name = 'Appliances'
        OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
    p.Name,
    SUM(s.Quantity) AS 'Total Sold',
    SUM(s.Quantity * s.PricePerUnit) AS 'Total Price'
FROM
    products as p
        INNER JOIN
    sales AS s ON s.ProductID = p.ProductID
WHERE
    p.ProductID = 97;
SELECT 
    *
FROM
    sales
WHERE
    productID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT 
    p.Name, r.Reviewer, r.Rating, r.Comment
FROM
    products AS p
        INNER JOIN
    reviews AS r ON r.ProductID = p.ProductID
WHERE
    p.ProductID = 857 AND r.Rating = 1;




-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    p.Name,
    SUM(s.Quantity) AS TotalSold
FROM
    Sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
        INNER JOIN
    products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID , p.ProductID;