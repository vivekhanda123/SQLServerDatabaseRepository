use TechShop;
--1 all info of Customers and orders
select o.*,c.* from Orders o join Customers  c on o.CustomerID = c.CustomerID;

--2 total Revenue generated by Products
select p.ProductName,sum(od.Quantity* P.Price) as TotalRevenue from Products p join OrderDetails od on 
p.ProductId = od.ProductID join Orders o on od.OrderID = o.OrderID group by p.ProductName Order by TotalRevenue desc;

--3 all the Customers who had made atlest one purchase
select c.FirstName,c.LastName ,c.Email,c.Phone from Customers c join Orders o on c.CustomerID = o.CustomerID 
group by c.CustomerID,c.FirstName,c.LastName ,c.Email,c.Phone;


--4  Most popular elctronic gadget--
 select p.ProductName,Sum(od.Quantity) as TotalQuantityOrders from Products p join OrderDetails od on p.ProductID = od.ProductID where p.description 
 like 'Electronic%' group by p.ProductName order by TotalQuantityOrders Desc offset 0 rows fetch next 1 rows only;

 --5 List of electronic Gadgets with corresponding Category
 select  ProductName,Description from Products where  Products.Description like 'Electronic Gadget%';

 --6 average order valye for each customer
 select   (ProductName,avg(Price) from Products group by(Price) ),Customers.* from ;
 select c.FirstName,c.LastName,avg(o.TotalAmount) as AverageOrderValue from Customers c join Orders o  on c.CustomerID = o.CustomerID 
 group by c.CustomerID,c.FirstName,c.LastName;


 --7 Order with highest total Revenue
 select c.FirstName,c.LastName,c.Email,c.Phone,  o.OrderID, o.TotalAmount as TotalRevenue from
 Customers c join Orders o  on c.CustomerID = o.CustomerID  order by o.TotalAmount offset 0 rows fetch next 1 rows only;


 --8 number of times each electronic Gadget is orderd
 select p.ProductName,count(o.OrderID) as TimesOrderd from Products p join OrderDetails o on p.ProductID = o. ProductID where p.DEscription like'Electronic%'
  group by p.ProductName order by TimesOrderd desc;

  --9 Customer who have Purchased a specific Order
  select c.FirstName,c.LastName ,c.Email,c.Phone from Customers c join Orders o on c.CustomerID = o.CustomerID 
  join OrderDetails od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID where p.ProductName = 'Rapid Charger';
  
   
  --10 total revenue generated by all products
  select sum(o.TotalAmount) as TotalRevenue from Orders o where o.OrderDate between '2024-09-17' and '2024-09-20';