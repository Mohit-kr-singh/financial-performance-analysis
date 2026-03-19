--Question: Which units are cost-heavy relative to revenue?

SELECT
    business_unit,
    SUM(CASE WHEN account_type = 'Expense' THEN amount END) /
    SUM(CASE WHEN account_type = 'Revenue' THEN amount END) AS expense_revenue_ratio
FROM financial_transactions
GROUP BY business_unit
ORDER BY expense_revenue_ratio DESC;

-- Insight :- Cost Efficiency by Business Unit
--            Enterprise unit has the highest expense-to-revenue ratio (~20%), 
--            indicating relatively higher operational costs compared to other units. 
--            Online is the most cost-efficient unit with the lowest expense burden (~18.6%), 
--            suggesting better scalability and margin potential.


