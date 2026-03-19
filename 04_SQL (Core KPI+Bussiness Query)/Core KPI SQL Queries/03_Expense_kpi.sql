--  2:- Expense KPI 
-- Expense by Year and Business Unit
SELECT
    year,
    business_unit,
    SUM(amount) AS total_expense
FROM financial_transactions
WHERE account_type = 'Expense'
GROUP BY year, business_unit
ORDER BY year, business_unit;