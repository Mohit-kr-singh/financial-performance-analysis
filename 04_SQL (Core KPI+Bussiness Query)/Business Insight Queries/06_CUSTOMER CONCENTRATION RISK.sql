-- Question: How dependent are we on top customers?
-- Insight : Revenue Concentration by Customer
SELECT
    customer_id,
    SUM(amount) AS customer_revenue,
    ROUND(
        SUM(amount) * 100.0 /
        (SELECT SUM(amount)
         FROM financial_transactions
         WHERE account_type = 'Revenue'),
        2
    ) AS revenue_percentage
FROM financial_transactions
WHERE account_type = 'Revenue'
AND customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY revenue_percentage DESC
LIMIT 10;

-- Interpretation:- Revenue is highly distributed
--                  No single customer dominates revenue
--                  Business is not over-dependent on a few customers
--                  Customer CUST10307 generated ₹42.21 lakh
--                  They contribute 0.49% of total company revenue
-- Insight:- The top 10 customers individually contribute less than 0.5% each 
--           to total revenue, indicating a well-diversified customer base with 
--           low revenue concentration risk. This reduces dependency on a small 
--           set of customers and improves revenue stability.