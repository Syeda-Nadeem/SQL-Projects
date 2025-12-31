-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM dbo.Orders o;

-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM dbo.Customers c;

-- Total number of product categories
SELECT COUNT(*) AS total_categories
FROM dbo.Categories cat;

-- Orders by year
SELECT 
    YEAR(o.OrderDate) AS order_year,
    COUNT(*) AS total_orders
FROM dbo.Orders o
GROUP BY YEAR(o.OrderDate)
ORDER BY order_year;

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM dbo.Employees emp;

-- Total number of products
SELECT COUNT(*) AS total_products
FROM dbo.Products pro;
