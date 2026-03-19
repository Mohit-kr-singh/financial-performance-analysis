--  6:- Cost per employee KPI
--  Cost per Employee by Business Unit

select
     business_unit,
     sum(cost_to_company)/count(employee_id) as cost_per_company
from headcount
GROUP BY business_unit
ORDER BY business_unit
