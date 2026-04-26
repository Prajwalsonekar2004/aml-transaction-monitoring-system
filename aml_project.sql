SELECT * FROM aml_account LIMIT 20;
SELECT * FROM aml_transactions LIMIT 20;

ALTER TABLE aml_account ADD COLUMN transaction_id SERIAL PRIMARY KEY
ALTER TABLE aml_account RENAME COLUMN transaction_id TO account_id

ALTER TABLE aml_transactions ADD COLUMN transaction_id SERIAL PRIMARY KEY


SELECT * FROM aml_account LIMIT 20;
SELECT * FROM aml_transactions LIMIT 20;
-- 1. HIGH VALUE TRANSACTIONS
WITH high_txn AS (
SELECT *
FROM aml_transactions
WHERE amount_paid > 500000
)

SELECT from_bank, COUNT(*) AS suspicious_account, ROUND(SUM(amount_paid::NUMERIC),2) AS total_amount
FROM high_txn
GROUP BY from_bank
ORDER BY total_amount DESC
LIMIT 10;

-- 2. FREQUENT TRANSACTIONS (SUSPICIOUS)
SELECT from_bank, to_bank, COUNT(*) AS suspicious_total_tx, 
ROUND(SUM(amount_paid::NUMERIC),2) AS total_suspicious_amount
FROM aml_transactions
WHERE is_laundering = 1
GROUP BY from_bank, to_bank
ORDER BY total_suspicious_amount DESC;

-- 3. LAUNDERING CASES
SELECT COUNT(*) total_suspicious_tx
FROM aml_transactions
WHERE is_laundering = 1;

-- 4.TRANSACTION COUNT PER USER
SELECT from_bank, COUNT(*) AS total_txn
FROM aml_transactions
GROUP BY from_bank
ORDER BY total_txn DESC
LIMIT 10;

-- 5.AVG AMOUNT
SELECT ROUND(AVG(amount_paid::NUMERIC),2) AS avg_amount
FROM aml_transactions;

-- 6.MAX AMOUNT
SELECT ROUND(SUM(amount_paid::NUMERIC),2) AS max_amount
FROM aml_transactions;

-- 7.UNIQUE RECEIVERS
SELECT from_bank, COUNT(*) AS total_txn, COUNT(DISTINCT to_bank) AS unique_receiver
FROM aml_transactions
GROUP BY from_bank
ORDER BY total_txn DESC
LIMIT 10;

-- 8.TRANSACTIONS PER DAY
SELECT from_bank, DATE(timestamp), COUNT(*) AS txn_per_day
FROM aml_transactions
GROUP BY from_bank, DATE(timestamp)
ORDER BY txn_per_day DESC
LIMIT 10;

-- Creating features table
CREATE TABLE aml_features AS 
SELECT t.from_bank, COUNT(*) AS txn_count, AVG(t.amount_paid) AS avg_amount, MAX(t.amount_paid) AS max_amount,
COUNT(DISTINCT t.to_bank) AS unique_receivers
FROM aml_transactions t
GROUP BY t.from_bank;

-- creating daily txn table
CREATE TABLE aml_daily_features AS
SELECT from_bank, DATE(timestamp) AS date, COUNT(*) AS txn_per_day
FROM aml_transactions 
GROUP BY from_bank, DATE(timestamp);

SELECT * FROM aml_features LIMIT 20;
SELECT * FROM aml_account LIMIT 20;
SELECT * FROM aml_transactions LIMIT 20;
SELECT * FROM aml_daily_features LIMIT 20;

-- KPI's
-- total customers
SELECT COUNT(*) AS total_customers
FROM aml_final_result;

-- High Risk Customers
SELECT COUNT(*) AS high_risk_customers
FROM aml_final_result
WHERE risk_category = 'High Risk';

-- Medium Risk Customers
SELECT COUNT(*) AS total_midrisk_customers
FROM aml_final_result
WHERE risk_category = 'Medium Risk';

-- High Risk Customers
SELECT COUNT(*) AS total_alert_customers
FROM aml_final_result
WHERE alert = 'ALERT';

-- Charts
-- RISK DISTRIBUTION
SELECT risk_category, COUNT(*) AS total_risk_based_customer
FROM aml_final_result
GROUP BY risk_category
ORDER BY total_risk_based_customer DESC;

-- top risky customer
SELECT from_bank, risk_score
FROM aml_final_result
WHERE risk_score = 100
GROUP BY from_bank, risk_score
ORDER BY risk_score DESC
LIMIT 10;

SELECT * FROM aml_final_result LIMIT 20;
-- avg risk scrore by sender bank
SELECT from_bank, COUNT(*) AS high_risk_customer, ROUND(AVG(risk_score),2) AS avg_risk_score
FROM aml_final_result
GROUP BY from_bank
ORDER BY avg_risk_score DESC
LIMIT 10;