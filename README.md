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
1. Transaction ID
2. Reference ID
3. Incoming or Outgoing
4. Receive Date
5. Expected Date
6. Delivery Date
7. Order Date
8. Item Quantity
8. Item UOM
10. Item Breakdown Qty. 1
11. Item Breakdown UOM. 2
12. Length
13. Width
14. Height
15. Weight
16. Manufacturing Date
17. Expiry Date
18. Limit Date
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



