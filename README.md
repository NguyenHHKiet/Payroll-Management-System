# PAYROLL MANAGEMENT SYSTEM - C# Winform

**Login Details**:

- **Username**: admin
- **Password**: admin

> Developed By Shell

## DATABASE CONFIGURATION FOR MSSQL

1. **Start SQL Server** (MSSQL).
2. **Create a new database**:

   - Open **SQL Server Management Studio (SSMS)**.
   - Connect to your database server (e.g., `localhost`).
   - Create a new database named `payroldb`:

     ```sql
     CREATE DATABASE payroldb;
     ```

3. **Run query the SQL File**:
   - The SQL file contains all necessary tables and procedures for the Payroll Management System to work.

**NOTE**: Without the database, the project will not function properly.

> The SQL file is located inside the "Database" folder!

## REQUIREMENTS

- **SQL Server** (any version of Microsoft SQL Server, such as 2017, 2019, or higher).
- **SQL Server Management Studio (SSMS)** for database management.
- **Microsoft SQL Server Data Provider for .NET**:
  - Ensure that the necessary MSSQL client libraries are installed. The project uses `System.Data.SqlClient` to interact with the MSSQL database, so you need the required .NET libraries.
- Download **SAP Crystal Reports** version for Microsoft Visual Studio.
  - Install crystal reports runtime engine for .net framework (64 bit).

## SYSTEM USAGE

- Login using the **admin** credentials to access the system.
- The system allows you to manage employee payroll, view reports, and perform CRUD operations.

If you encounter any issues, make sure the database is correctly set up and the connection string is properly configured.
