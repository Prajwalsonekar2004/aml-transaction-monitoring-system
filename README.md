# AML Transaction Monitoring & Risk Detection System

## Project Overview

This project simulates a real-world **Anti-Money Laundering (AML) system** used by financial institutions to detect suspicious transactions and high-risk customers.

The system processes large-scale transaction data, applies AML rules, generates risk scores, and visualizes insights through an interactive Power BI dashboard.

---

## Objective

* Identify suspicious transaction patterns
* Detect high-risk customers
* Build a rule-based AML monitoring system
* Provide actionable insights through dashboards

---

## Tech Stack

* **Python** – Data cleaning, preprocessing, AML logic
* **SQL (PostgreSQL)** – Data storage, aggregation, feature engineering
* **Power BI** – Dashboard and visualization

---

## Key Features

### Data Processing

* Cleaned and transformed large transaction dataset (~100K+ records)
* Stored structured data in PostgreSQL

### Feature Engineering (SQL)

* Transaction frequency per customer
* Average and maximum transaction amount
* Unique receiver count (layering detection)
* Daily transaction spikes (burst detection)

### AML Rule Engine

Implemented rule-based detection:

* High-value transactions
* High-frequency activity
* Layering behavior
* Burst transactions

### Risk Scoring System

* Generated risk scores (0–100)
* Classified customers into:

  * High Risk
  * Medium Risk
  * Low Risk

### Alert System

* High Risk → **ALERT**
* Medium Risk → **REVIEW**
* Low Risk → **SAFE**

---

## Dashboard Insights

### Executive Overview

* Total transactions
* High-risk and medium-risk customers
* Risk distribution

### Customer Behavior Analysis

* Transaction volume vs amount
* Risk-based behavioral patterns

### AML Pattern Detection

* Layering activity
* Burst transactions
* High-value transfers

### Alert Monitoring

* Active alerts and reviews
* Top high-risk customers
* Investigation-ready table

---

## Dataset

Dataset used from Kaggle: https://www.kaggle.com/datasets/ealtman2019/ibm-transactions-for-anti-money-laundering-aml

---

## Dashboard Preview

### AML Overview

![AML Overview](./screenshots/overview.png)

### Customer Behavior Analysis

![Behavior](./screenshots/behavior.png)

### AML Pattern Analysis

![Patterns](./screenshots/patterns.png)

### Alert Monitoring

![Alerts](./screenshots/alerts.png)

---

## Key Learnings

* Built end-to-end data pipeline (Python + SQL + BI)
* Applied real-world AML detection logic
* Designed scalable feature engineering using SQL
* Created business-focused dashboards

---

## Business Impact

This system helps financial institutions:

* Detect potential money laundering activities
* Prioritize high-risk customers
* Improve compliance monitoring

---

## How to Run

1. Load dataset
2. Clean data using Python
3. Store data in PostgreSQL
4. Run SQL scripts for feature engineering
5. Load final table into Power BI

---

## 👤 Author

**Prajwal Sonekar**
Aspiring Data Analyst | Fintech Enthusiast
