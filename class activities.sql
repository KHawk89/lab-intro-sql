SELECT COUNT( DISTINCT account_id) as customers FROM bank.account;

SELECT DISTINCT type as different_types FROM bank.card;

Select 'Hello World';

select 9*8;

select a2 as district_name, a11 as average_salary
from bank.district
where a11 > 10000;

select loan_id, account_id, amount-payments as balance
from bank.loan
where (status = 'B') and amount-payments > 1000
order by balance DESC;


select a2 as district, a4 as inhabitants, a10 as urban_ratio, round(a4*(a10/100),0) as urban_inhabitants
from bank.district;

select type, issued
from bank.card;

select count(type='junior'and issued>980000) 
from bank.card;

select trans_id, operation, type, date
from bank.trans
where operation ='VYBER KARTOU' and type ='VYDAJ'
order by date
limit 10;
