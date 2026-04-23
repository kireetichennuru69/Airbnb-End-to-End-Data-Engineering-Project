# Airbnb End-to-End Data Engineering Project  
## Product Requirements Document (PRD)

---

## 1. Objective

Design and implement a **scalable, maintainable, and analytics-ready ELT pipeline** using modern cloud-native tools.

The system should:
- Ingest raw Airbnb data
- Transform it into structured datasets
- Support business intelligence and analytics use cases
- Follow best practices in data engineering and analytics engineering

---

## 2. Background & Problem Statement

Airbnb-like platforms generate high-volume, multi-dimensional data across:
- Listings
- Hosts
- Bookings
- Reviews

Raw data is not directly usable for analytics due to:
- Inconsistent formats
- Missing values
- Lack of relationships
- No historical tracking

### Problem

Build a system that:
- Cleans and standardizes raw data
- Applies business logic
- Produces analytics-ready datasets
- Enables efficient querying and reporting

---

## 3. Goals & Success Metrics

### Goals
- Build a production-style ELT pipeline
- Implement Medallion Architecture (Bronze, Silver, Gold)
- Enable analytics via star schema modeling
- Ensure scalability and maintainability

### Success Metrics
- Query performance improvement in Gold layer
- Reduction in transformation redundancy
- High data quality (validated via dbt tests)
- Ease of adding new datasets using metadata-driven logic

---

## 4. Architecture Overview

![Architecture](assets/airbnb-end-to-end-architecture.png)

### Architecture Pattern: Medallion

| Layer | Description |
|------|------------|
| Bronze | Raw ingested data |
| Silver | Cleaned and standardized data |
| Gold | Business-level analytics models |

---

## 5. Data Flow

1. Raw data is uploaded to **AWS S3**
2. Snowflake ingests data into **Bronze tables**
3. dbt transforms data into **Silver models**
4. Business logic applied in **Gold models**
5. Data structured into **Star Schema**
6. Output consumed by BI tools

---

## 6. Functional Requirements

### Data Ingestion
- Load CSV/structured files from S3 into Snowflake
- Maintain raw data integrity

### Data Transformation
- Clean null values
- Standardize column formats
- Deduplicate records

### Data Modeling
- Create fact and dimension tables
- Implement star schema

### Historical Tracking
- Implement SCD Type 2 using dbt snapshots

### Data Quality
- Apply dbt tests:
  - Not null
  - Unique
  - Referential integrity

---

## 7. Non-Functional Requirements

| Requirement | Description |
|------------|------------|
| Scalability | Handle increasing data volume |
| Performance | Optimized queries using incremental models |
| Maintainability | Metadata-driven design |
| Reliability | Data quality validation via tests |
| Security | IAM-based access control |

---

## 8. Data Modeling Approach

### Star Schema Design

**Fact Table**
- Booking facts (price, duration, revenue)

**Dimension Tables**
- Listings
- Hosts
- Locations
- Dates

### Benefits
- Faster query performance
- Simplified BI reporting
- Clear relationships

---

## 9. Metadata-Driven Pipeline

Instead of hardcoding transformations:
- Metadata defines joins and transformations
- Reduces repetitive SQL
- Enables easy scalability

---

## 10. Technology Stack

| Layer | Tool |
|------|------|
| Storage | AWS S3 |
| Warehouse | Snowflake |
| Transformation | dbt |
| Version Control | Git |
| Modeling | Star Schema |


---

## 11. Testing Strategy

Using dbt:
- Schema tests
- Data integrity tests
- Custom SQL tests

---

## 12. Deployment Strategy

- Code managed in GitHub
- dbt runs executed locally or via CI/CD (future)
- Version-controlled releases

---

## 13. Risks & Mitigation

| Risk | Mitigation |
|-----|-----------|
| Data inconsistency | Data validation tests |
| Schema changes | Metadata-driven design |
| Performance issues | Incremental models |

---

## 14. Future Enhancements

- Airflow orchestration
- CI/CD integration
- Real-time streaming pipelines
- Data observability tools

---

## 15. Conclusion

This project demonstrates a **production-style data engineering system** with:

- Scalable architecture
- Clean transformation layers
- Analytics-ready outputs
- Strong engineering practices

---
