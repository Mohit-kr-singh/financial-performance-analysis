-- Question: Which months show abnormal expense spikes?
SELECT
    year,
    month,
    abs(SUM(amount)) AS total_expense
FROM financial_transactions
WHERE account_type = 'Expense'
GROUP BY year, month
ORDER BY total_expense DESC;

--Insight:- Monthly expense analysis revealed consistent spending 
--          patterns across years, with peak expenses observed in specific months. 
--          Expenses are recorded as negative values, so absolute values were used to 
--          correctly identify high-cost periods.