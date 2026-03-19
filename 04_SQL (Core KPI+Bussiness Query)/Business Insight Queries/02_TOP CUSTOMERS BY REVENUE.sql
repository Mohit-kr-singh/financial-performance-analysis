-- Question: Who are the highest revenue-generating customers?

select 
     ft.customer_id,
     c.customer_name,
     sum(ft.amount)as total_revenue
from financial_transactions ft
join customers c ON c.customer_id=ft.customer_id
where ft.account_type='Revenue'
and ft.customer_id is not NULL
GROUP BY ft.customer_id,c.customer_name
order BY ft.customer_id
limit 10


-- > Business use: Customer concentration risk
-- > Talking point: “Top 10 customers drive a disproportionate share of revenue”