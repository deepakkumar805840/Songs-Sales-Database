use music;

-- Q1. Find customer id, first name, last name and total amount spent from customer table by 
--     joining customer and invoice table group by id and order by total descending. 
select customer.customer_id,customer.first_name,customer.last_name, SUM(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name, customer.last_name
order by total desc
limit 10;

-- Q2. Find all details of top 10 employees by their level. 
select * from employee
order by levels desc
limit 10;

-- Q3. Find top 10 Countries by total number of count from invoice table & group by Countries.
select  billing_country ,COUNT(*) as Count
from invoice
group by billing_country
order by COUNT desc
limit 10;

-- Q4. Find top 10 cities with max total invoice from invoice table and group by billing city. 
select  billing_city, sum(total) as invoice_total
from invoice
group by billing_city
order by invoice_total  desc
limit 10;

-- Q5. Find email, first name, last name from customer table by joining invoice, invoice line,
--     track, genre tables that listen to rock music and order them by ascending email.  
select distinct email, first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id= track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by email;

-- Q6. Find top 10 country with max sales and order in descending order.
select billing_country, sum(total) as sales
from invoice
group by billing_country
order by sales desc 
limit 10;

-- Q7. Find top 10 states with max sales and order in descending order.
select billing_state, sum(total) as sales
from invoice
group by billing_state
order by sales desc 
limit 10;

-- Q8. Find top 10 states with max sales and order in descending order.
select billing_city, sum(total) as sales
from invoice
group by billing_city
order by sales desc 
limit 10;

-- Q9. Find Top Genres with max sales by joining invoive to invoice line, track, genre table. 
select genre.name as genre, sum(total) as sales from invoice
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id= track.track_id
join genre on track.genre_id = genre.genre_id
group by genre
order by sales desc;