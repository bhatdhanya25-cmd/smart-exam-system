# Smart Exam System

## Project Overview

Smart Exam System is a PostgreSQL-based database project designed to manage students, teachers, subjects, exams, and student exam performance.

This project demonstrates relational database design, SQL query writing, data normalization, analytical queries, and reporting concepts.

---

# Tech Stack

* PostgreSQL
* SQL
* VS Code
* Git & GitHub
* dbdiagram.io

---

# Features

* User Management
* Student Management
* Teacher Management
* Department Management
* Subject Management
* Exam Management
* Student Exam Attempts
* Analytical Queries
* Ranking System using Window Functions
* Views for Reporting

---

# Database Concepts Used

## Constraints

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* CHECK
* NOT NULL

## SQL Concepts

* JOINS
* GROUP BY
* ORDER BY
* Aggregate Functions
* Views
* Window Functions

---

# Project Structure

```text
smart_exam_system/
│
├── database/
│   ├── schema.sql
│   ├── queries.sql
│   └── views.sql
│
├── docs/
│   └── er_diagram.png
│
└── README.md
```

---

# ER Diagram

The ER diagram represents relationships between:

* Users
* Students
* Teachers
* Departments
* Subjects
* Exams
* Student Exam Attempts

---

# Important Queries

## Student Result Report

* Displays student exam performance
* Uses multiple JOIN operations

## Student Ranking

* Uses DENSE_RANK() window function
* Generates leaderboard based on exam scores

## Average Score Analysis

* Uses AVG() and GROUP BY
* Calculates exam-wise performance

---

# Sample Functionalities

* Add Students
* Add Teachers
* Create Exams
* Store Exam Scores
* Generate Reports
* Rank Students
* Analyze Results

---

# Future Improvements

* FastAPI Backend Integration
* Power BI Dashboard
* Authentication System
* HTML/CSS Frontend
* REST APIs

---

# Author

Dhanya K M
