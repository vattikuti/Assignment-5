
         -- Assignment-5      Name:vattikuti anudeep      cwid:20053275  --


 -- 1. Get the cities of agents booking an order	for customer  “Basics”.	This time use	joins;	no subqueries


    select agents.city
    from agents
    join orders
    on agents.aid=orders.aid
    join customers
    on orders.cid=customers.cid
    where customers.name='Basics'



  --2.Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins this time; no subqueries.


  select distinct orders.pid
  from orders
  join customers
  on orders.cid=customers.cid
  where customers.city='Kyoto'


  --3.Get	the names of customers	who have never	placed	an order. Use	a subquery


   select name
   from customers
   where cid not in( select cid
                 from orders)



  --4.Get	the	names	of	customers	who	have	never	placed	an	order.	Use	an	outer	join


   select customers.name
   from customers
   left outer join orders
   on orders.cid=customers.cid
   where orders.cid is null 




--  5.Get the names of customers who placed  at	least one order	through	an agent in their city,	along	with those agent(s’) names.--


   select distinct customers.name,Agents.name
   from customers
   join Agents
   on Agents.city=customers.city
   join orders
   on Agents.aid=orders.aid
   where orders.cid=customers.cid 
   
   
  
   
 --  6.Get the names of	customers and	agents	in the	same city, along with the name	of the	city, regardless of whether or	not the customer--	
        --         has	ever	placed	an	order	with	that	agent.--



      select customers.name,Agents.name
      from customers,Agents
      where customers.city=Agents.city 


  
                 
-- 7.Get the name and city of customers	who live in the	city where the	least	number	of products	are	made.


    select distinct customers.name,customers.city
     from customers
     where customers.city in( select city 
                              from products
                              group by city
                              order by count(quantity)
                              limit 1)







     


  