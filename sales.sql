select * from sales;
select * from customers;
select * from class;
select name, sale_date, sale_amount as '$$$', customer, class_name 
from person 
  inner join sales using (person_id) 
  inner join customers using (customer_id) 
  inner join class c on (c.class_id = sales.class_id);

