--Question: Which vendors consume the highest costs?

select 
    vendor_id,
    sum(amount)as total_expense
from financial_transactions
where account_type='Expense'
and vendor_id is not NULL
GROUP BY vendor_id
order by total_expense DESC
limit 10 

-- Helps vendor renegotiation & cost control
-- Matches your Expense per Vendor KPI

