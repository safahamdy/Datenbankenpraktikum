# DBPRA – Datenbankenpraktikum (TU Berlin)

This repository contains solutions to four assignments completed as part of the "Datenbankenpraktikum" (DBPRA) module at TU Berlin. 
The work includes SQL-based queries for analyzing relational data and Java implementations for stored procedures, views, and triggers via JDBC.
Each assignment is organized in its own folder. Every SQL query is documented with comments directly inside the `.sql` files.


## Project Structure
```
.
├── assignment01/
│   ├── SQLQuery01.sql
│   └── ...
├── assignment02/
│   ├── SQLQuery01.sql
│   └── ...
├── assignment03/
│   ├── SQLQuery01.sql
│   └── ...
├── assignment04/
│   └── Exercise04.java
├── DatabaseSchema.jpg 
└── README.md
```




## Assignments Overview

### Assignment 01 – Supplier & Product Analysis

- Performs a series of supply value and supplier-part analyses using joins, grouping, and filters.
- Focuses on Canadian suppliers, value thresholds, and comparisons across nations.

Folder: `aufgabe01/`  


### Assignment 02 – Conditional Joins & Value Comparisons

- Applies nested filters across suppliers, parts, and nations.
- Involves computed values, advanced conditions, and ordering.
- Builds on the schema from Assignment 01.

Folder: `aufgabe02/`



### Assignment 03 – Aggregates, Counts & Subqueries

- Uses `GROUP BY`, `HAVING`, and multi-level joins to analyze relationships between parts and suppliers.
- Adds conditional filters and computes ratios or comparisons.

Folder: `aufgabe03/`


###  Assignment 04 – SQL + Java Integration

Combines SQL and Java to create UDFs, views, a trigger, and a stored procedure for distance-based calculations using the Haversine formula.

Folder: `aufgabe04/`  



##  Database Schema

All queries and logic refer to the schema provided below:

![Database Schema](./DatabaseSchema.jpg)


## Technologies Used

- **SQL** (PostgreSQL/MySQL-compatible)
- **Java** (JDBC API)
- **IntelliJ IDEA** (as development environment)

