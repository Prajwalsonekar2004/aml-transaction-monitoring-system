# AML Transaction Monitoring & Risk Detection System

## Project Overview

This project simulates a real-world **Anti-Money Laundering (AML) monitoring system** used by financial institutions to detect suspicious transactions and high-risk customers.

It processes transaction data, engineers behavioral features in Python, applies AML rules, generates risk scores, and visualizes insights through a Power BI dashboard.

---

## Objective

* Detect suspicious transaction patterns
* Identify high-risk customers
* Build a rule-based AML detection system
* Create an investigation-ready dashboard

---

## Tech Stack

* **Python (Pandas)** – Data cleaning, feature engineering, AML logic
* **PostgreSQL** – Data storage and querying
* **Power BI** – Dashboard and visualization

---

## Key Features

### Data Processing

* Cleaned and transformed transaction dataset
* Handled missing values, duplicates, and data types
* Loaded structured data into PostgreSQL

---

### Feature Engineering (Python)

Created customer-level behavioral features:

* Transaction count per customer
* Average transaction amount
* Maximum transaction amount
* Unique receivers (layering detection)
* Transactions per day (burst detection)

---

### AML Rule Engine

Implemented rule-based fraud detection:

* High-value transactions
* High-frequency activity
* Layering behavior (multiple receivers)
* Burst transaction patterns

---

### Risk Scoring System

* Generated risk score (0–100)
* Categorized customers into:

  * High Risk
  * Medium Risk
  * Low Risk

---

### Alert System

* High Risk → **ALERT**
* Medium Risk → **REVIEW**
* Low Risk → **SAFE**

---

## Dashboard Highlights

### Executive Overview

* Total transactions
* High-risk and medium-risk customers
* Risk distribution

---

### Customer Behavior Analysis

* Transaction volume vs average amount
* Behavioral patterns across risk categories

---

### AML Pattern Detection

* Layering activity
* Burst transactions
* High-value transfers

---

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

![Overview](./screenshots/overview.png)

### Customer Behavior

![Behavior](./screenshots/behavior.png)

### AML Patterns

![Patterns](./screenshots/patterns.png)

### Alert Monitoring

![Alerts](./screenshots/alerts.png)

---

## Key Learnings

* Built end-to-end AML detection system
* Applied real-world fraud detection logic
* Designed behavioral features for risk analysis
* Developed business-focused dashboards

---

## Business Impact

This system helps financial institutions:

* Detect potential money laundering activities
* Prioritize high-risk customers
* Improve compliance monitoring

---

## How to Run

1. Load dataset
2. Perform data cleaning in Python
3. Engineer features using Pandas
4. Store processed data in PostgreSQL
5. Connect Power BI to database
6. Build dashboard

---

## Author

**Prajwal Sonekar**
Aspiring Data Analyst | Fintech Enthusiast
