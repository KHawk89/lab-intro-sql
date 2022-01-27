
    -- Write a query to find what is the total business done by each store.
    
    select c.store_id, a.staff_id, sum(a.amount) as total_business from payment a
    join staff b
    on a.staff_id = b.staff_id
    join store c
    on b.store_id = c.store_id
    group by c.store_id;
    
    -- Convert the previous query into a stored procedure.
    
    delimiter //

create procedure tb_proc()
begin
	select c.store_id, a.staff_id, sum(a.amount) as total_business from payment a
    join staff b
    on a.staff_id = b.staff_id
    join store c
    on b.store_id = c.store_id
    group by c.store_id
    having b.store_id = param;
end;
//
delimiter ;

call tb_proc();
    
    -- Convert the previous query into a stored procedure that takes the input for store_id and displays the total sales for that store.
    
    delimiter //

create procedure tb_proc_store(in param int)
begin
	select c.store_id, a.staff_id, sum(a.amount) as total_business from payment a
    join staff b
    on a.staff_id = b.staff_id
    join store c
    on b.store_id = c.store_id
    group by c.store_id
    having c.store_id = param;
end;
//
delimiter ;

call tb_proc_store(2);
drop procedure IF EXISTS tb_proc_store;
    
    -- Update the previous query. Declare a variable total_sales_value of float type, that will store the returned result 
    -- (of the total sales amount for the store). Call the stored procedure and print the results.
    
delimiter //

create procedure tb_proc_store_2(in param int)
begin
	declare total_sales_value float; 
	select sum(a.amount) into total_sales_value from payment a
    join staff b
    on a.staff_id = b.staff_id
    join store c
    on b.store_id = c.store_id
    group by c.store_id
    having c.store_id = param;
    select total_sales_value;
end;
//
delimiter ;

call tb_proc_store_2(1);
drop procedure IF EXISTS tb_proc_store_2;
    
    
    -- In the previous query, add another variable flag. If the total sales value for the store is over 30.000
    -- then label it as green_flag, otherwise label is as red_flag. Update the stored procedure that takes an 
    -- input as the store_id and returns total sales value for that store and flag value.

delimiter //

create procedure tb_proc_store_3(in param int,out param1 int, out param2 varchar(20))
begin
	declare flag varchar(20) default "";
	select sum(a.amount) into param1 from payment a
    join staff b
    on a.staff_id = b.staff_id
    join store c
    on b.store_id = c.store_id
    group by c.store_id
    having c.store_id = param;
    
    
	if param1 > 33500 then
		set flag = 'Red Flag';
	else
		set flag = 'Green Flag';
	end if;
  
	select flag into param2;
  
end;
//
delimiter ;

call tb_proc_store_3(2,@total_sales_value, @flag);
select @total_sales_value, @flag;
drop procedure IF EXISTS tb_proc_store_3;