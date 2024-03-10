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

CREATE TABLE IF NOT EXISTS "Warehouse" (
	"WarehouseID" int NOT NULL,
	"WarehouseName" string NOT NULL,
	"WarehousePhoneNumber" int NOT NULL UNIQUE,
	"WarehouseCapacity" int NOT NULL,
	"WarehouseCountry" string NOT NULL,
	"WarehouseState" string NOT NULL,
	"WarehouseCity" string NOT NULL,
	"WarehouseArea" string NOT NULL,
	"WarehouseZIPCode" int NOT NULL,
	"WarehouseTemparature" string NOT NULL,
	"IsTemperatureControlled" boolean NOT NULL,
	"WarehouseCreationDate" date NOT NULL,
	"WarehouseLife" int NOT NULL,
	"WarehouseUpdatedDate" date NOT NULL,
	"IsWarehouseActive" boolean NOT NULL,
	"WarehouseAccessHours" string NOT NULL,
	"WarehouseEmergencyExits" int NOT NULL,
	"WarehouseCCTVs" int NOT NULL,
	"WarehouseFireSuppressionSystem" int NOT NULL,
	"WarehouseRacks	" int NOT NULL,
	"ManagerID" int NOT NULL,
	PRIMARY KEY ("WarehouseID")
);

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

CREATE TABLE IF NOT EXISTS "WarehouseManager" (
	"ManagerID" int NOT NULL,
	"ManagerName" string NOT NULL,
	"ManagerDOB" date NOT NULL,
	"ManagerAge" int NOT NULL,
	"ManagerGender" string NOT NULL,
	"ManagerEmail" string NOT NULL,
	"ManagerPhoneNumber" int NOT NULL,
	"ManagerCreatedDate" date NOT NULL,
	PRIMARY KEY ("ManagerID")
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