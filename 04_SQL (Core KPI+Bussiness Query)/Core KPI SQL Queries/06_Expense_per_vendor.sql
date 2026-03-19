--  5:- Expense_per_vendor KPI
--  Expense per Vendor by Business Unit

select 
    business_unit,
    abs(sum(amount))/count(DISTINCT vendor_id) as Expense_per_vendor
from financial_transactions
where account_type='Expense'
and vendor_id is not NULL
GROUP BY business_unit
ORDER BY business_unit
