# Airbnb End-to-End Data Engineering Project

![AWS](https://img.shields.io/badge/AWS-232F3E?logo=amazonaws&logoColor=white)
![S3](https://img.shields.io/badge/S3-569A31?logo=amazons3&logoColor=white)
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?logo=snowflake&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?logo=dbt&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white)
![Star Schema](https://img.shields.io/badge/Star_Schema-6B7280)
![Metadata--Driven%20Pipelines](https://img.shields.io/badge/Metadata--Driven_Pipelines-111827)

> Portfolio project for building a modern ELT pipeline using AWS S3, Snowflake, dbt, Git, and analytics-ready dimensional modeling.

## Project Overview

This project demonstrates an end-to-end Airbnb-style data engineering workflow built around a layered architecture:

- **AWS S3** stores the raw source files.
- **Snowflake Bronze** receives raw ingested data.
- **dbt Silver** applies cleansing, standardization, and business rules.
- **dbt Gold** creates analytics-ready models, including a **star schema**.
- **Metadata-driven pipelines** reduce hardcoding and make model generation easier to maintain.
- **Git / GitHub** is used for version control, collaboration, and release management.

The goal is to show how a data pipeline can be designed in a clean, scalable, and portfolio-friendly way while following modern analytics engineering practices.

## Architecture
<img width="5400" height="3281" alt="Airbnb DE Project AD" src="https://github.com/user-attachments/assets/a1197773-af65-4758-9d31-3579e5a0e855" />


## Concepts Covered

- Data ingestion from object storage into a warehouse
- Medallion architecture: Bronze, Silver, Gold
- Incremental loading in dbt
- IAM-based secure access between AWS and Snowflake
- Reusable dbt models and templated SQL
- Metadata-driven joins and model creation
- Star schema design for analytics
- Snapshot-based historical tracking / SCD Type 2 concepts
- dbt tests for data quality and reliability
- Git-based version control for a production-style workflow

## End-to-End Flow

1. Raw Airbnb files land in **Amazon S3**.
2. Data is loaded into **Snowflake Bronze** as raw, lightly processed tables.
3. **Silver models** clean and standardize the dataset.
4. **Gold models** combine business logic and create analytics layers.
5. Final curated tables are shaped into a **star schema** for reporting and BI.
6. All changes are tracked in **Git** for repeatability and team collaboration.

## Project Highlights

- Modular architecture for easier debugging and scaling
- Incremental transformations for better performance
- Metadata-based configuration to reduce repetitive SQL
- Analytics-ready output designed for dashboards and reporting
- Portfolio-friendly structure that is easy to explain in interviews

## Sample Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| Storage | AWS S3 | Raw file landing zone |
| Warehouse | Snowflake | Centralized SQL processing |
| Transformation | dbt | SQL transformation framework |
| Version Control | Git / GitHub | Collaboration and release tracking |
| Modeling | Star Schema | BI-friendly analytical design |
| Pipeline Design | Metadata-driven logic | Dynamic, reusable transformations |

## Folder Structure

```text
.
├── assets/
│   └── airbnb-end-to-end-architecture.png
├── README.md
└── PRD.md
```

## Concepts in Practice

### Bronze Layer
Raw data is stored with minimal changes so the original source can always be traced.

### Silver Layer
Business logic is applied here. Typical activities include deduplication, type casting, standard naming, and filtering bad records.

### Gold Layer
The final business-ready layer where facts and dimensions are curated for consumption by BI tools and analysts.

### Metadata-Driven Pipeline
Instead of hardcoding every table join or transformation, metadata drives the pipeline behavior. This helps when new tables are introduced or source logic changes.

### Star Schema
The star schema organizes data into a central fact table surrounded by dimension tables for fast and intuitive analytics.

## Result

The final result is a reusable, well-structured Airbnb analytics pipeline that demonstrates:

- modern cloud data engineering practices
- scalable dbt development
- warehouse-centric ELT design
- maintainable Git-based project organization

## Credits

Project inspiration and learning flow are based on the YouTube tutorial shared by Ansh Lamba: `Airbnb End-To-End Data Engineering Project (For Beginners) | DBT + Snowflake + AWS`.
