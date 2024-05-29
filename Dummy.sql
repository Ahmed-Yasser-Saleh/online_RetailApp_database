insert into Customer
values(15,'ahmed','male',01150390086,'ahmed@gmail.com','suez'),
      (16,'yassmin','female',01154741453,'yassmin@gmail.com','cairo'),
	  (17,'saleh','male',01050390087,'saleh@gmail.com','ismalia'),
	  (18,'yasser','male',01250390084,'yasser@gmail.com','suez'),
	  (19,'khaled','male',01550390083,'khaled@gmail.com','suez');

select * from Customer

insert into Store 
values(30,'cairo', 'amazon1'),
      (31,'Alex', 'amazon2');

insert into Store_phoneNUM
values(30,01233354667),
      (31,01230354667);

insert into Supplier
values(50, 'SER'),
      (51, 'ERZ'); 

insert into product 
values(1,'Apple Watch', 'yes',30, 50),
      (2,'Chair', 'yes',31, 51),
	  (3,'Calculator', 'yes',31, 51),
	  (4,'puzzle', 'yes',31, 50); select * from Product;select * from Supplier;select * from Store;select * from Store_phoneNUM;


insert into Cs_order
values(1,16),
      (2,17),
	  (3,15),
	  (4,18);

insert into OrderProduct
values(1,'2024-05-10',2,1,200.00),
      (1,'2024-05-10',1,1,9000.00),
	  (1,'2024-05-10',3,2,500.00),
	  (2,'2024-05-10',2,1,200.00),
	  (3,'2024-05-10',4,1,600.00),
	  (3,'2024-05-10',2,1,200.00)

select cs_name from 
Customer inner join Cs_order
on Customer.customer_id = Cs_order.customer_id   --query to show name of customer who call for orders

select cs_name from 
Customer inner join Cs_order
on Customer.customer_id = Cs_order.customer_id and Cs_order.order_id = 1  --query to show name of customer who call for order 1

select pr_name from
Product inner join Store
on Product.store_id = Store.store_id and Store.st_name = 'amazon1';       --query to show name of product whose store named amazon1

select pr_name , UnitPrice                                                --query to show unitprice of product Calculator
from OrderProduct inner join Cs_order
on OrderProduct.order_id = Cs_order.order_id
inner join 
Product
on Product.product_id = OrderProduct.product_id and pr_name = 'Calculator'

--select total_cost of each order
SELECT order_id, SUM(Quantity * UnitPrice) AS total_cost
FROM OrderProduct
group by order_id;

