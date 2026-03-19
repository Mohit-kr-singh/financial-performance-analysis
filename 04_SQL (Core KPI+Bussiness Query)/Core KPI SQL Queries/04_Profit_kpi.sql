--  3:- Profit KPI 

-- Profit by Year and Business Unit (Profit = Revenue − Expense)

select 
      year,
      business_unit,
      sum(
        CASE
        when account_type='Revenue' then amount
        when account_type='Expense' then -amount
        end
      ) as Profit
from financial_transactions
GROUP BY year,business_unit
order by year, business_unit

