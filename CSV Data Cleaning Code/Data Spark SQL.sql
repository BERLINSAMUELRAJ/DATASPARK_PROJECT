-- Create Customers table --
USE Data_Spark;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='customers' AND xtype='U')
BEGIN
    CREATE TABLE customers (
        CustomerKey INT,
        Gender VARCHAR(10),
        Name NVARCHAR(255),
        City NVARCHAR(255),
        StateCode VARCHAR(50),
        State NVARCHAR(255),
        ZipCode VARCHAR(20),
        Country VARCHAR(100),
        Continent VARCHAR(50),
        Birthday DATE
    )
END


-- Create Exchange Rate Table --
CREATE TABLE Exchange_Rates (
    Date DATE,
    Currency VARCHAR(50),
    Exchange FLOAT
);



-- Create Products Table --
CREATE TABLE Products (
    ProductKey INT,
    [Product Name] VARCHAR(255),
    Brand VARCHAR(100),
    Color VARCHAR(100),
    [Unit Cost USD] FLOAT,
    [Unit Price USD] FLOAT,
    SubcategoryKey INT,
    Subcategory VARCHAR(255),
    CategoryKey INT,
    Category VARCHAR(255)
);


-- Create Table Sales -- 
CREATE TABLE Sales (
    [Order Number] INT,
    [Line Item] INT,
    [Order Date] DATE,
    [Delivery Date] DATE,
    CustomerKey INT,
    StoreKey INT,
    ProductKey INT,
    Quantity INT,
    [Currency Code] NVARCHAR(10)
);


-- Create Stores Table --
CREATE TABLE Stores (
    StoreKey INT,
    Country NVARCHAR(100),
    State NVARCHAR(100),
    [Square Meters] INT,
    [Open Date] DATE
);

