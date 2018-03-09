# wms
warehouse record keeper (Warehouse Management System)

In general requirements of a warehouse management system, functions for incoming and outgoing items/cargoes must be available as recorded transactions. These 2 functions will then be basis for actual inventory records and therefore shall have the following data recorded in a database:
-Customer Details
1. Customer Code - customer-code INT(50) PK
2. Customer Name - customer-name VARCHAR(50)
3. Address - customer-address VARCHAR(150)
4. Contact Person - customer-contactperson VARCHAR(50)
5. Contact Number - customer-contactnumber VARCHAR(12)
6. TIN Number - customer-tin VARCHAR(12)
7. Payment Terms - customer-paymentterms INT(120)
8. Remarks - customer-remarks VARCHAR(200)

-Item Details
1. Customer/Owner Code - customer-code INT(50) FK
2. Item Code - item-code VARCHAR(15) PK
3. Item Description - item-description VARCHAR(150)
4. Remarks - item-remarks VARCHAR(200)

-Transaction Details
1. Transaction ID - trans_id INT(12) PK
2. Customer Reference - trans_customerreference VARCHAR(15)
3. Incoming or Outgoing - trans_transactiontype ENUM ('outgoing', 'incoming', 'sortout')
4. Receive Date - trans_receivedate DATETIME DEFAULT 0
5. Expected Date - trans_expecteddate DATETIME NULL
6. Delivery Date - trans_deliverydate DATETIME DEFAULT 0
7. Order Date - trans_orderdate DATETIME DEFAULT 0
8. Item Quantity - trans_itemqty DECIMAL(10,4)
8. Item UOM - trans_itemuom ENUM('plt/s','rol/s','box/s','can/s','drm/s', 'ctn/s')
10. Item Breakdown Qty.  - trans_breakdownqty DECIMAL(10,4)
11. Item Breakdown UOM.  - trans_breakdownuom ENUM('plt/s','rol/s','box/s','can/s','drm/s', 'ctn/s')
12. Length - trans_itemlength DECIMAL(10,4)
13. Width - trans_itemwidth DECIMAL(10,4)
14. Height - trans_itemheight DECIMAL(10,4)
15. Weight - trans_itemweight DECIMAL(10,4)
16. Manufacturing Date - trans_mfgdate DATETIME DEFAULT 0
17. Expiry Date - trans_expdate DATETIME DEFAULT 0
18. Limit Date - 
19. Location ID/Name
20. Remarks

-Transport Details
1. Shipper Name
2. Delivery Address
3. Consinee Name
4. Origin Address
5. Trailer Number
6. Trailer Type
7. Remarks

-System Company Data
1. Company Code
2. Company Name
3. Company Address
4. Warehouse Name
5. License Type
6. License Key
7. Capacity 

-System User Data
1. Company Code
2. Username
3. Password
4. First Name
5. Middle Name
6. Last Name
7. Email Address
8. User Privilege

-Other Details
1. Document Attachment
2. Picture Attachment
3. Bad Order Report
4. Other Reference

These details shall be able to fill out details in order to generate reports like the following:
Cargo Receipt Form
Delivery Receipt Form
Inventory Report
Monitoring Report



