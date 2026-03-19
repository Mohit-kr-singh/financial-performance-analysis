-- Creating customer table
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name TEXT,
    segment TEXT,
    join_date date,
    region TEXT,
    status TEXT
);

--creating vendor table
CREATE TABLE vendors (
    vendor_id VARCHAR(50) PRIMARY KEY,
    vendor_name TEXT,
    category TEXT,
    region TEXT,
    active text
);

--creating headcount table
CREATE TABLE headcount (
    employee_id VARCHAR(10) PRIMARY KEY,
    employee_name VARCHAR(100),
    business_unit VARCHAR(50),
    join_date DATE,
    status VARCHAR(20),
    region VARCHAR(20),
    cost_to_company NUMERIC(12,2)
);

--creating budget table

CREATE TABLE budget (
    year INT,
    month INT,
    business_unit TEXT,
    budgeted_revenue NUMERIC,
    budgeted_expense NUMERIC,
    PRIMARY KEY (year, month, business_unit)
);

--creating financial_transaction table
CREATE TABLE financial_transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    transaction_date DATE,
    amount NUMERIC,
    account_type TEXT,
    category TEXT,
    business_unit TEXT,
    region TEXT,
    customer_id VARCHAR(50),
    vendor_id VARCHAR(50),
    description TEXT,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_vendor
        FOREIGN KEY (vendor_id)
        REFERENCES vendors(vendor_id)
);


SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM vendors;
SELECT COUNT(*) FROM headcount;
SELECT COUNT(*) FROM budget;
SELECT COUNT(*) FROM financial_transactions;

--FOREIGN KEY VALIDATION CHECK
SELECT COUNT(*) 
FROM financial_transactions ft
LEFT JOIN customers c
ON ft.customer_id = c.customer_id
WHERE ft.customer_id IS NOT NULL
AND c.customer_id IS NULL;