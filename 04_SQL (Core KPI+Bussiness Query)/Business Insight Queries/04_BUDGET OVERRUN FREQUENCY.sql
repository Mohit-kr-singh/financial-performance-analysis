--Question: Which business units exceed budget most often?
with monthly_expense as 
(
    SELECT 
        year,
        month,
        business_unit,
        sum(amount) as actual_expense
    from financial_transactions
    where account_type='Expense'
    group by year,month,business_unit
)
SELECT
    b.business_unit,
    COUNT(*) AS over_budget_months
FROM budget b
JOIN monthly_expense me
    ON b.year = me.year
    AND b.month = me.month
    AND b.business_unit = me.business_unit
WHERE me.actual_expense > b.budgeted_expense
GROUP BY b.business_unit
ORDER BY over_budget_months DESC;


-- Observation:- No business unit exceeded its monthly budget during the analysis period

-- Insight:- Budget planning was conservative
--           Expense controls were effective across units

-- Conclusion:- Budget overrun risk is currently low
