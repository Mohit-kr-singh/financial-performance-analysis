--  1:- Revenue KPI 

ALTER TABLE financial_transactions    --first we will create a year column
ADD COLUMN year INT;
update financial_transactions
set year= Extract(YEAR from transaction_date)

ALTER TABLE financial_transactions     -- same we do for months also
ADD COLUMN month INT;
UPDATE financial_transactions
SET month = EXTRACT(MONTH FROM transaction_date);

--revenue by year and business Unit
SELECT
    year,
    business_unit,
    SUM(amount) AS total_revenue
FROM financial_transactions
WHERE account_type = 'Revenue'
GROUP BY year, business_unit
ORDER BY year, business_unit;

