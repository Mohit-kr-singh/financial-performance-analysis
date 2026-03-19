--  4:- Budget_Variance KPI

-- Budget Variance by Year and Business Unit (Budget Variance = Actual Expense − Budgeted Expense)

SELECT
    b.year,
    b.business_unit,
    SUM(ft.amount) AS actual_expense,
    MAX(b.budgeted_expense) AS budgeted_expense,
    SUM(ft.amount) - MAX(b.budgeted_expense) AS budget_variance
FROM budget b
JOIN financial_transactions ft 
    ON b.year = ft.year
   AND b.month = ft.month
   AND b.business_unit = ft.business_unit
WHERE ft.account_type = 'Expense'
GROUP BY b.year, b.business_unit
ORDER BY b.year, b.business_unit;
