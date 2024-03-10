create DATABASE DWHSpag

CREATE TABLE WarehouseManager (
    ManagerID INT PRIMARY KEY IDENTITY,
    ManagerName VARCHAR(100) NOT NULL,
    ManagerDOB DATE NOT NULL,
    ManagerAge INT NOT NULL,
    ManagerGender VARCHAR(100) NOT NULL,
    ManagerEmail VARCHAR(100) NOT NULL,
    ManagerPhoneNumber BIGINT NOT NULL,
    ManagerCreatedDate DATE NOT NULL
);

-- Insert 15 rows of random dummy data into WarehouseManager table
DECLARE @Counter INT = 1
WHILE @Counter <= 15
BEGIN
    INSERT INTO WarehouseManager (ManagerName, ManagerDOB, ManagerAge, ManagerGender, ManagerEmail, ManagerPhoneNumber, ManagerCreatedDate)
    VALUES (
        CONCAT('Manager', @Counter),
        DATEADD(year, -FLOOR(RAND()*(50-25+1))+25, GETDATE()),
        FLOOR(RAND()*(60-25+1))+25,
        CASE WHEN RAND() < 0.5 THEN 'Male' ELSE 'Female' END,
        CONCAT('manager', @Counter, '@example.com'),
        RAND()*9999999999,
        DATEADD(day, -FLOOR(RAND()*365)+1, GETDATE())
    );
    SET @Counter = @Counter + 1;
END;

UPDATE WarehouseManager
SET ManagerGender = 'Female' WHERE ManagerGender = 'Fem	ale';

select * from WarehouseManager

CREATE TABLE Warehouse(
	WarehouseID int NOT NULL,
	WarehouseName VARCHAR(100) NOT NULL,
	WarehousePhoneNumber BIGINT NOT NULL UNIQUE,
	WarehouseCapacity int NOT NULL,
	WarehouseCountry VARCHAR(100) NOT NULL,
	WarehouseState VARCHAR(100) NOT NULL,
	WarehouseCity VARCHAR(100)NOT NULL,
	WarehouseArea VARCHAR(100) NOT NULL,
	WarehouseZIPCode int NOT NULL,
	WarehouseTemparature VARCHAR(100) NOT NULL,
	IsTemperatureControlled BIT NOT NULL,
	WarehouseCreationDate date NOT NULL,
	WarehouseLife int NOT NULL,
	WarehouseUpdatedDate date NOT NULL,
	IsWarehouseActive BIT NOT NULL,
	WarehouseAccessHours VARCHAR(100)NOT NULL,
	WarehouseEmergencyExits int NOT NULL,
	WarehouseCCTVs int NOT NULL,
	WarehouseFireSuppressionSystem int NOT NULL,
	WarehouseRacks int NOT NULL,
	ManagerID int NOT NULL,
	PRIMARY KEY (WarehouseID),
	FOREIGN KEY (ManagerID) REFERENCES WarehouseManager(ManagerID)
);

-- Insert rows of dummy data into Warehouse table for 15 warehouses
INSERT INTO Warehouse (WarehouseID, WarehouseName, WarehousePhoneNumber, WarehouseCapacity, WarehouseCountry, WarehouseState, WarehouseCity, WarehouseArea, WarehouseZIPCode, WarehouseTemparature, IsTemperatureControlled, WarehouseCreationDate, WarehouseLife, WarehouseUpdatedDate, IsWarehouseActive, WarehouseAccessHours, WarehouseEmergencyExits, WarehouseCCTVs, WarehouseFireSuppressionSystem, WarehouseRacks, ManagerID)
VALUES
    (1, 'Warehouse A', 1234567890, 1000, 'Country A', 'State A', 'City A', 'Area A', 12345, 'Cool', 1, '2022-01-01', 10, '2022-01-01', 1, '24/7', 2, 10, 1, 50, 1),
    (2, 'Warehouse B', 2345678901, 1500, 'Country B', 'State B', 'City B', 'Area B', 23456, 'Dry', 0, '2022-01-02', 15, '2022-01-02', 1, '8AM-8PM', 3, 15, 1, 75, 2),
    (3, 'Warehouse C', 3456789012, 2000, 'Country C', 'State C', 'City C', 'Area C', 34567, 'Cold', 1, '2022-01-03', 20, '2022-01-03', 0, '9AM-6PM', 4, 20, 0, 100, 3),
    (4, 'Warehouse D', 4567890123, 1200, 'Country D', 'State D', 'City D', 'Area D', 45678, 'Warm', 1, '2022-01-04', 12, '2022-01-04', 1, '8AM-10PM', 2, 12, 1, 60, 4),
    (5, 'Warehouse E', 5678901234, 1800, 'Country E', 'State E', 'City E', 'Area E', 56789, 'Hot', 0, '2022-01-05', 18, '2022-01-05', 0, '10AM-6PM', 3, 18, 0, 90, 5),
    (6, 'Warehouse F', 6789012345, 1400, 'Country F', 'State F', 'City F', 'Area F', 67890, 'Cool', 1, '2022-01-06', 14, '2022-01-06', 1, '7AM-9PM', 4, 14, 1, 70, 6),
    (7, 'Warehouse G', 7890123456, 1600, 'Country G', 'State G', 'City G', 'Area G', 78901, 'Dry', 0, '2022-01-07', 16, '2022-01-07', 1, '9AM-5PM', 2, 16, 1, 80, 7),
    (8, 'Warehouse H', 8901234567, 2200, 'Country H', 'State H', 'City H', 'Area H', 89012, 'Cold', 1, '2022-01-08', 22, '2022-01-08', 0, '10AM-8PM', 3, 22, 0, 110, 8),
    (9, 'Warehouse I', 9012345678, 1300, 'Country I', 'State I', 'City I', 'Area I', 90123, 'Warm', 1, '2022-01-09', 13, '2022-01-09', 1, '9AM-7PM', 2, 13, 1, 65, 9),
    (10, 'Warehouse J', 1134567890, 1700, 'Country J', 'State J', 'City J', 'Area J', 12345, 'Hot', 0, '2022-01-10', 17, '2022-01-10', 0, '8AM-4PM', 3, 17, 0, 85, 10),
    (11, 'Warehouse K', 2245678901, 1900, 'Country K', 'State K', 'City K', 'Area K', 23456, 'Cool', 1, '2022-01-11', 19, '2022-01-11', 1, '10AM-9PM', 4, 19, 1, 95, 11),
    (12, 'Warehouse L', 3356789012, 2100, 'Country L', 'State L', 'City L', 'Area L', 34567, 'Dry', 0, '2022-01-12', 21, '2022-01-12', 0, '9AM-8PM', 2, 21, 0, 105, 12),
    (13, 'Warehouse M', 4367890123, 1300, 'Country M', 'State M', 'City M', 'Area M', 45678, 'Warm', 1, '2022-01-13', 13, '2022-01-13', 1, '8AM-6PM', 3, 13, 1, 65, 13),
    (14, 'Warehouse N', 5478901234, 1700, 'Country N', 'State N', 'City N', 'Area N', 56789, 'Hot', 0, '2022-01-14', 17, '2022-01-14', 0, '10AM-7PM', 4, 17, 0, 85, 14),
    (15, 'Warehouse O', 6389012345, 2000, 'Country O', 'State O', 'City O', 'Area O', 67890, 'Cool', 1, '2022-01-15', 20, '2022-01-15', 1, '7AM-10PM', 2, 20, 1, 100, 15);

select * from Warehouse


CREATE TABLE IF NOT EXISTS "ProductExpiryDate" (
	"EDateID" int NOT NULL,
	"ExpiryYear" date NOT NULL,
	"ExpiryQuarter" date NOT NULL,
	"ExpiryMonth" date NOT NULL,
	"ExpiryWeek" date NOT NULL,
	"ExpiryDay" date NOT NULL,
	PRIMARY KEY ("EDateID")
);

CREATE TABLE IF NOT EXISTS "Inventory" (
	"InventoryID" int NOT NULL,
	"InventoryName" string NOT NULL,
	"InventoryRackNumber" int NOT NULL,
	"InventoryBatchNumber" string NOT NULL UNIQUE,
	"Inventory_Initial_Quantity_Ordered" int NOT NULL,
	"InventoryQuantityUsed" int NOT NULL,
	"InventoryQuantityinTransit" int NOT NULL,
	"InventoryQuantityinStock" int NOT NULL,
	"InventoryReorderThreshold" int NOT NULL,
	"InventoryDamagedQuantity" int NOT NULL,
	"InventoryStockStatus" string NOT NULL,
	"WarehouseID" int NOT NULL,
	PRIMARY KEY ("InventoryID")
);

]

CREATE TABLE IF NOT EXISTS "CustomerSalesOrder" (
	"OrderID" int NOT NULL,
	"OrderedQuantity" int NOT NULL,
	"ProductID" int NOT NULL,
	"TotalPrice" decimal NOT NULL,
	"OrderDate" date NOT NULL,
	"ShippingCost" decimal NOT NULL,
	"ShippingStatus" string NOT NULL,
	"ShippingMode" string NOT NULL,
	"ShippingDate" int NOT NULL,
	"CustomerID" int NOT NULL
);

CREATE TABLE IF NOT EXISTS "Product" (
	"ProductID" int NOT NULL,
	"ProductName" string NOT NULL,
	"ProductCategory" string NOT NULL,
	"ProductDescription" string NOT NULL,
	"ProductColor" string NOT NULL,
	"ProductSize" int NOT NULL,
	"ProductWeight" float NOT NULL,
	"InStock" boolean NOT NULL,
	"EDateID" int NOT NULL,
	"InventoryID" int NOT NULL,
	"RawMaterialID" int NOT NULL,
	PRIMARY KEY ("ProductID")
);

CREATE TABLE IF NOT EXISTS "TransactionTable" (
	"OrderID" int NOT NULL UNIQUE,
	PRIMARY KEY ("OrderID")
);



CREATE TABLE IF NOT EXISTS "Customers" (
	"CustomerID" int NOT NULL,
	"CustomerName" string NOT NULL,
	"CustomerEmail" string NOT NULL UNIQUE,
	"Customernumber" int NOT NULL UNIQUE,
	"CustomerJoin" date NOT NULL,
	"CustomerLife" int NOT NULL,
	"CustomerDOB" date NOT NULL,
	"CustomerAge" int NOT NULL,
	"CustomerGender" string NOT NULL,
	"IsActive" boolean NOT NULL,
	"CustomerLastPurchaseDate" date NOT NULL,
	PRIMARY KEY ("CustomerID")
);

CREATE TABLE IF NOT EXISTS "CustomerLocation" (
	"CLocID" int NOT NULL,
	"CustomerCountry" string NOT NULL,
	"CustomerState" string NOT NULL,
	"CustomerCity" string NOT NULL,
	"CustomerArea" string NOT NULL,
	"CustomerZIPCode" int NOT NULL,
	"IsDefault" boolean NOT NULL,
	"CustomerID" int NOT NULL,
	PRIMARY KEY ("CLocID")
);

CREATE TABLE IF NOT EXISTS "CustomerDeliveryOrder" (
	"DeliveryID" int NOT NULL,
	"DeliveredDate" date NOT NULL,
	"DeliveryDuration" int NOT NULL,
	"DeliveryStatus" string NOT NULL,
	"QuantityDelivered" int NOT NULL,
	"PaymentDate" date NOT NULL,
	"PaymentMethod" string NOT NULL,
	"PaymentStatus" boolean NOT NULL,
	"IsOrderCompleted" boolean NOT NULL,
	"OrderID" int NOT NULL,
	"CLocID" int NOT NULL,
	PRIMARY KEY ("DeliveryID")
);


ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_fk11" FOREIGN KEY ("WarehouseID") REFERENCES "Warehouse"("WarehouseID");
ALTER TABLE "Warehouse" ADD CONSTRAINT "Warehouse_fk20" FOREIGN KEY ("ManagerID") REFERENCES "WarehouseManager"("ManagerID");
ALTER TABLE "CustomerSalesOrder" ADD CONSTRAINT "CustomerSalesOrder_fk0" FOREIGN KEY ("OrderID") REFERENCES "TransactionTable"("OrderID");

ALTER TABLE "CustomerSalesOrder" ADD CONSTRAINT "CustomerSalesOrder_fk2" FOREIGN KEY ("ProductID") REFERENCES "Product"("ProductID");

ALTER TABLE "CustomerSalesOrder" ADD CONSTRAINT "CustomerSalesOrder_fk9" FOREIGN KEY ("CustomerID") REFERENCES "Customers"("CustomerID");
ALTER TABLE "Product" ADD CONSTRAINT "Product_fk8" FOREIGN KEY ("EDateID") REFERENCES "ProductExpiryDate"("EDateID");

ALTER TABLE "Product" ADD CONSTRAINT "Product_fk9" FOREIGN KEY ("InventoryID") REFERENCES "Inventory"("InventoryID");

ALTER TABLE "Product" ADD CONSTRAINT "Product_fk10" FOREIGN KEY ("RawMaterialID") REFERENCES "RawMaterials"("RawMaterialID");



ALTER TABLE "CustomerLocation" ADD CONSTRAINT "CustomerLocation_fk7" FOREIGN KEY ("CustomerID") REFERENCES "Customers"("CustomerID");
ALTER TABLE "CustomerDeliveryOrder" ADD CONSTRAINT "CustomerDeliveryOrder_fk9" FOREIGN KEY ("OrderID") REFERENCES "CustomerSalesOrder"("OrderID");

ALTER TABLE "CustomerDeliveryOrder" ADD CONSTRAINT "CustomerDeliveryOrder_fk10" FOREIGN KEY ("CLocID") REFERENCES "CustomerLocation"("CLocID");