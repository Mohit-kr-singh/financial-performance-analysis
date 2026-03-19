--  7:- Revenue per customer KPI
--  Revenue per Customer by Business Unit

select 
     business_unit,
     sum(amount)/count(DISTINCT customer_id) as Revenue_per_customers
from financial_transactions
where account_type='Revenue'
GROUP BY business_unit
order BY business_unit




