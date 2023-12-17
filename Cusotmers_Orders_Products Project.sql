Create Database Customers_Orders_Products; 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');
  select * from Customers

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-01-07', 5),
  (2, 2, 'Product B', '2023-02-07', 3),
  (3, 3, 'Product C', '2023-03-07', 2),
  (4, 4, 'Product A', '2023-04-07', 1),
  (5, 5, 'Product B', '2023-05-07', 4),
  (6, 6, 'Product C', '2023-06-07', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-08-07', 2),
  (9, 9, 'Product C', '2023-09-07', 5),
  (10, 10, 'Product A', '2023-10-07', 1)
  ;
  Select * from Orders



CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)
  ;

 Select * from Products
 Select * from Orders
 select * from Customers

 Select Name, Email
 from Customers
 where Name like 'J%';

Select OrderID, ProductName, Quantity
from Orders;

Select SUM(Quantity) as Total_Quantity
from Orders;

5.	Write a query to retrieve the names of customers who have placed an order.
Select Customers.CustomerID,Customers.Name, Orders.OrderDate,Products.ProductID,Products.ProductName
From Orders
inner join Customers
on Orders.CustomerID =Customers.CustomerID
left outer join Products
on Orders.ProductName = Products.ProductName
;

6.	Write a query to retrieve the products with a price greater than $10.00.
Select ProductID, ProductName
from Products
where Price > 10.00;

7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
Select Customers.Name, Orders.OrderDate
From Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
where OrderDate > '2023/05/07'
;

8.	Write a query to calculate the average price of all products.
Select AVG(Price) as Avg_Price
from Products;

9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
Select Customers.Name,Orders.Quantity
From Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
;

10.	Write a query to retrieve the products that have not been ordered.
Select Products.ProductName,Isnull(Orders.ProductName,'Not ordered') as Status
From Products left outer join Orders on Products.ProductName = Orders.ProductName
where Orders.ProductName is null
;
Select * from Products
 Select * from Orders
 select * from Customers

1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
 Select Top 5 Customers.Name, Orders.Quantity
 From Customers
 right join Orders
 on Customers.CustomerID = Orders.CustomerID
 order by Orders.Quantity desc;

2.	Write a query to calculate the average price of products for each product category.
Select ProductName, Avg(Price) as AvgPrice 
from Products
group by Products.ProductName;

3.	Write a query to retrieve the customers who have not placed any orders.
Select Customers.Name, Orders.ProductName
from Customers
left join Orders on Customers.
CustomerID = Orders.CustomerID
where Orders.ProductName is null;

4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
Select Orders.OrderID,Orders.ProductName,Orders.Quantity
From Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where Customers.Name like 'M%';

Select * from Products
 Select * from Orders
 select * from Customers

5.	Write a query to calculate the total revenue generated from all orders.
Select Sum(Products.Price * Orders.Quantity) as Total_Revenue
From Products
Inner join Orders 
on Products.ProductName = Orders.ProductName;

6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.
Select Customers.Name, Sum(Orders.Quantity * Products.Price) as TotalRevenue
From Orders
Inner join Products 
on Orders.ProductName = Products.ProductName
left outer join Customers
on Orders.CustomerID = Customers.CustomerID
group by Customers.Name;

7.	Write a query to retrieve the customers who have placed at least one order for each product category.
Select Customers.Name,Products.ProductName
From Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
inner join Products on Orders.ProductName = Products.ProductName
where Orders.CustomerID = "Products.ProductName"
;
Select * from Products
 Select * from Orders
 select * from Customers

8.	Write a query to retrieve the customers who have placed orders on consecutive days.
Select Customers.Name, Orders.OrderDate
from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID
where DateDiff(day,Orders.OrderDate,Orders.OrderDate)=1
;


9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.
Select Top 3 ProductName, Avg(Quantity) as AvgQuantity
from Orders
group by ProductName
Order by Quantity desc
;

10.	Write a query to retrieve all records from the Customers table..
 select * from Customers

11. Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
SELECT Avg(Quantity) as AvgQuantity from Orders
select sum(Quantity) as Total_Quantity from Orders

Select CustomerID,(Quantity*100)/28 as Perc_Quantity from Orders
where Quantity > 2;

Select * from Products
 Select * from Orders
 select * from Customers

1.	Write a query to retrieve the customers who have placed orders for all products.
Select Customers.Name,Products.ProductName
From Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
inner join Products on Orders.ProductName = Products.ProductName
;

2.	Write a query to retrieve the products that have been ordered by all customers
Select Orders.ProductName,Customers.Name
From Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
;

3.	Write a query to calculate the total revenue generated from orders placed in each month.
Select month(Orders.OrderDate) as Month, Sum(Products.Price * Orders.Quantity) as revenue
From Products  
inner join Orders on Products.ProductName = Orders.ProductName
group by Orders.OrderDate
;

4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
Select Products.ProductName, Products.ProductID
from Products
Inner join Orders on Products.ProductName = Orders.ProductName
Inner join Customers on Orders.CustomerID = Customers.CustomerID
group by Products.ProductName, Products.ProductID
having count(Orders.CustomerID) > (Select Count(CustomerID)*0.5 from Customers)
;

5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
Select top 5 Customers.Name, sum(Products.Price * Orders.Quantity) as Amount
From Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
left outer join Products on Orders.ProductName = Products.ProductName
group by Customers.Name
order by Amount desc
;

6.	Write a query to calculate the running total of order quantities for each customer.
Select OrderDate, Quantity, Sum(Quantity) over(Order by OrderDate asc) as Running_Total
from Orders
;

7.	Write a query to retrieve the top 3 most recent orders for each customer.
Select Orders.ProductName,Customers.Name
from Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
group by Orders.ProductName,Customers.Name
having count(Orders.ProductName) = 3
;
 Select * from Orders
 select * from Customers

8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.
Select Customers.Name, Orders.OrderDate, Sum(Products.Price * Orders.Quantity) as Total_Revenue
from Orders
left outer join Customers on Orders.CustomerID = Customers.CustomerID
left outer join Products on Orders.ProductName = Products.ProductName
group by Customers.Name, Orders.Orderdate
;

9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.
Select Customers.Name, Count(Orders.ProductName) as productscount
from Customers 
left outer join Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.Name
having Count(Orders.ProductName)>=2
;


10.	Write a query to calculate the average revenue per order for each customer.
Select Customers.Name, sum((Products.Price * Orders.Quantity)/Orders.Quantity) as AvgRevenue
from Orders
left outer join Customers on Orders.CustomerID = Customers.CustomerID
left outer join Products on Orders.ProductName = Products.ProductName
group by Customers.Name
Order by AvgRevenue
;

11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
SELECT c.CustomerID, c.Name FROM Customers c 
WHERE NOT EXISTS ( SELECT 1 FROM ( SELECT DISTINCT DATEPART(MONTH, OrderDate) AS Month 
FROM Orders 
WHERE DATEPART(YEAR, OrderDate) = 2023 ) m 
WHERE NOT EXISTS ( SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID AND DATEPART(MONTH, o.OrderDate) = m.Month ) )
;

12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
SELECT c.Name FROM 
Customers c 
INNER JOIN Orders o1 ON c.CustomerID = o1.CustomerID 
INNER JOIN Orders o2 ON c.CustomerID = o2.CustomerID 
WHERE o1.ProductName = 'ProductName' AND o2.ProductName = 'ProductName'
AND DATEDIFF(Month, o1.OrderDate having OrderID =1, o2.OrderDate having OrderID =2) > 1
;

13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.
select Products.ProductName, Customers.Name, Orders.Quantity 
from Orders 
join Products on Orders.ProductName = Products.ProductName
join Customers on Orders.CustomerID = Customers.CustomerID
where Orders.Quantity>=2
order by Products.ProductName,Customers.Name
;


 Select * from Products
 Select * from Orders
 select * from Customers