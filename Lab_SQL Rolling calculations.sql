-- Get number of monthly active customers.
select * from bank.trans;
select * from rental;

create or replace view sakila.user_activity as
select customer_id, convert(rental_date, date) as Activity_date,
date_format(convert(rental_date,date), '%m') as Activity_Month,
date_format(convert(rental_date,date), '%Y') as Activity_year
from sakila.rental;

select * from sakila.user_activity;

create or replace view sakila.monthly_active_customers as
select count(distinct customer_id) as Active_customers, Activity_Month, Activity_year
from sakila.user_activity
group by Activity_Month, Activity_year
order by Activity_year asc, Activity_Month asc;

select * from sakila.monthly_active_customers;

-- Active users in the previous month.


select 
   Activity_year, 
   Activity_month,
   Active_customers, 
   lag(Active_customers) over () as Last_month -- order by Activity_year, Activity_Month -- lag(Active_users, 2) -- partition by Activity_year
from sakila.monthly_active_customers;


-- Percentage change in the number of active customers.

create or replace view sakila.diff_monthly_active_customers as
with cte_view as 
(
	select 
	Activity_year, 
	Activity_month,
	Active_customers, 
	lag(Active_customers) over (order by Activity_year, Activity_Month) as Last_month
	from monthly_active_customers
)
select 
   Activity_year, 
   Activity_month, 
   Active_customers, 
   Last_month, 
   round(((1 -Last_month / Active_customers) * 100 ),2) as Difference 
from cte_view;

select * from diff_monthly_active_customers;

-- Retained customers every month.

create or replace view sakila.monthly_retained_customers as
with cte_view as 
(
	select 
	Activity_year, 
	Activity_month,
	Active_customers, 
	lag(Active_customers) over (order by Activity_year, Activity_Month) as Last_month
	from monthly_active_customers
)
select 
   Activity_year, 
   Activity_month, 
   Active_customers, 
   Last_month, 
   (Last_month - Active_customers) as Retained 
from cte_view;

select * from monthly_retained_customers;