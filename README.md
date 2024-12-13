# CAR_PROJECT Database System

## Overview
**CAR_PROJECT** is a comprehensive database system designed for managing the operations of a car dealership. It includes structured tables for handling critical aspects such as dealers, employees, cars, customers, sales, payments, and service details. This project demonstrates efficient database design and implementation using SQL.

## Features
- **Dealers Management**: Stores details of car dealers, including contact information and addresses.
- **Employee Records**: Maintains information about employees, including their roles and contact details.
- **Car Inventory**: Tracks available cars with specifications and pricing.
- **Customer Details**: Keeps records of customers to enhance customer relationship management.
- **Sales Tracking**: Records sales transactions with relevant details.
- **Payments**: Manages payment information for transparency.
- **Service Records**: Logs service details for cars to ensure quality maintenance.

## Database Structure
The database contains the following tables:
1. **DEALERS**:
   - `DEALER_ID`: Primary key.
   - `DEALER_NAME`, `CONTACT_NUMBER`, `EMAIL`, `ADDRESS`.
2. **EMPLOYEES**:
   - `EMP_ID`: Primary key.
   - `FIRST_NAME`, `LAST_NAME`, `POSITION`, `PHONE_NUMBER`.
3. **CARS**:
   - `CAR_ID`: Primary key.
   - `MODEL`, `BRAND`, `PRICE`, `DEALER_ID` (Foreign key).
4. **CUSTOMERS**:
   - `CUSTOMER_ID`: Primary key.
   - `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`.
5. **SALES**:
   - `SALE_ID`: Primary key.
   - `CAR_ID`, `CUSTOMER_ID`, `DATE`, `TOTAL_AMOUNT`.
6. **PAYMENTS**:
   - `PAYMENT_ID`: Primary key.
   - `SALE_ID`, `PAYMENT_METHOD`, `STATUS`.
7. **SERVICE_DETAILS**:
   - `SERVICE_ID`: Primary key.
   - `CAR_ID`, `SERVICE_DATE`, `DESCRIPTION`, `COST`.

## Prerequisites
- MySQL or any compatible relational database management system.
- Basic understanding of SQL.

## Setup Instructions
1. Install MySQL on your system.
2. Clone or download this repository.
3. Open the SQL file (`project sql.sql`) in a MySQL client or editor.
4. Execute the file to create the database and tables.
5. (Optional) Populate the tables with sample data for testing.

## How to Use
1. Modify the SQL file to suit your specific requirements if necessary.
2. Use the database for car dealership management operations.
3. Integrate with frontend or backend applications for extended functionality.

## License
This project is licensed under the MIT License. You are free to use, modify, and distribute it with attribution.

## Acknowledgments
Special thanks to mentors and peers who supported this project.

---


