# **Library Management System**

Welcome to the Library Management System repository. This project provides a comprehensive solution for building and managing a fully functional library database using **Microsoft SQL Server**. It offers streamlined book tracking, borrower administration, and loan management.

## Project Summary

This repository includes:
- **Database Design**: Implementation of relational tables in the database.
- **SQL Procedures & Functions**: Core procedures and functions to handle library operations and reporting.
- **Triggers**: Automated mechanisms to capture changes in book availability.
- **Bonus Features**: Advanced analytics for loan data.

---

## ERM Diagram

The **Entity-Relationship Model (ERM)** diagram illustrates how the database entities interact, showcasing the attributes and relationships between tables.

<a href="https://github.com/MohammadKhamalan/Library-Management-System" target="_blank">
    <img src="ERM Diagram.png" alt="ERM Diagram">
</a>

---

## Key Features

### For Library Administrators
- **Book Management**: Insert, update, or delete book entries.
- **Borrower Management**: Register new users and modify borrower records.
- **Loan Tracking**: Record and monitor loan transactions.

### For Borrowers
- **Search Capabilities**: Look up books by title, author, category, or ISBN.
- **Loan History Access**: Review previously borrowed items and due dates.
- **Overdue Monitoring**: Track overdue items and estimate late fees.

---

## SQL Procedures and Functions

### Stored Procedures:
- `sp_AddNewBorrower`: Registers a borrower, ensuring email uniqueness.
- `sp_BorrowedBooksReport`: Generates a report of borrowed books within a specified date range.

### User-Defined Functions:
- `fn_CalculateOverdueFees`: Calculates overdue fees based on overdue days.
- `fn_BookBorrowingFrequency`: Counts how often a book has been borrowed.

---

## Trigger Implementation

- **Book Status Change Tracker**: Logs changes in book status between Available and Borrowed.

---

## Bonus Analytical Feature

- **Top Lending Days Analysis**: Identifies the three weekdays with the highest percentage of loans, helping staff optimize scheduling and stock planning.

