/*
================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
================================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.

    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the BULK INSERT command to load data from CSV files into bronze tables.

Parameters:
    None.

    This stored procedure does not accept any parameters
    and does not return any values.

Usage Example:
    EXEC bronze.load_bronze;

================================================================================
*/

--EXECUTING STORED PROCEDURE
EXEC bronze.load_bronze;

--TRUNCATE AND INSERT

CREATE OR ALTER PROCEDURE bronze.load_bronze as 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	BEGIN TRY
	SET @batch_start_time = GETDATE();
			PRINT '=================================================';
			PRINT 'loading Bronze Layer';
			PRINT '=================================================';

			PRINT '-------------------------------------------------';
			PRINT 'Loading CRM Tables';
			PRINT '-------------------------------------------------';
		--TABLE:- bronze.crm_cust_info
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
			PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';
		--TABLE:- bronze.crm_prd_info
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
			PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';

		--TABLE:- bronze.crm_sales_details
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
			PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';

		PRINT '-------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-------------------------------------------------';

		--TABLE:- bronze.erp_CUST_AZ12
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
			PRINT '>> Inserting Data Into: bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';

		--TABLE:- bronze.erp_LOC_A101
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;
			PRINT '>> Inserting Data Into: bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';

		--TABLE:- bronze.erp_PX_CAT_G1V2
		SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
			PRINT '>> Inserting Data Into: bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'H:\My Drive\DA - DS\SQL\SQL Data Warehousing Project\Data Warehousing\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Loading Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> ---------------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT '=================================================';
		PRINT 'loading Bronze Layer Completed';
		PRINT '>> Total Load Duration: ' +CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		PRINT '=================================================';
	END TRY 
	BEGIN CATCH
		PRINT '=================================================';
		PRINT 'ERROR OCCURED DURING LAODING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS VARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS VARCHAR);
		PRINT '=================================================';
	END CATCH
END
