--Create Database 'DataWarehouse'
create database DataWarehouse;

use DataWarehouse;

-- create schemas
CREATE SCHEMA bronze;
go -- Batch process separator for MSSQL
CREATE SCHEMA silver;
go
CREATE SCHEMA gold;
go

/*
======================================================================================
--DDL(Data Definition Language) Scripts: Create Bronze Tables
======================================================================================
Script Purpose:
      This script creates tables in the 'Bronze' schema, dropping existing tables
      if they alredy exist.
      Run this script to re-define the DDL structure of 'bronze' Tables
======================================================================================
*/

CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);

CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
)

CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT, 
sls_sales INT,
sls_quantity INT,
sls_price INT
)

CREATE TABLE bronze.erp_CUST_AZ12(
CID NVARCHAR(50),
BDATE DATE,
GEN NVARCHAR(50)
)

CREATE TABLE bronze.erp_LOC_A101(
CID NVARCHAR(50),
CNTRY NVARCHAR(50)
)

CREATE TABLE bronze.erp_PX_CAT_G1V2(
id  NVARCHAR(50),
CAT NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENANCE NVARCHAR(50)
)



