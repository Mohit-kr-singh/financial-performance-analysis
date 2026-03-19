--Question: Which business units are unprofitable?
select 
    year,
    business_unit,
    sum(
        case 
        when account_type='Revenue' then amount
        when account_type='Expense' then -amount
        end
       )  as profit
from financial_transactions
group by year,business_unit
having sum(
    case
    when account_type='Revenue' then amount
    when account_type='Expense' then -amount
    END
)<0
order by profit asc;

-- Insight : Loss-Making Business Units ordered by year and bussness unit in ascending order 
-- Result:- No rows returned
-- Business Interpretation:- All business units generated positive profit across all years, indicating sustainable operations and effective cost control.