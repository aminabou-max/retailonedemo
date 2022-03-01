
SELECT cus.CUSTOMERNAME as "CustomerName (Db2 for i)", 
       prod."productName" as "Product (GCP Big Query)", 
       pay.paymentDate as "Sales Date (Db2 for i)", 
       emp.lastname as "Sales Rep Name (Oracle)",
       O.CITY as "Sales Rep City(Oracle)",
       det.quantityOrdered as "Qty(Db2 for i)", 
       det.priceEach as "Unit Price",
       det.quantityOrdered * det.priceEach  as "TOTAL"

FROM "RETAIL"."CUSTOMERS" cus, 
     "RETAIL"."products" prod, 
     "RETAIL"."PAYMENTS" pay, 
      "RETAIL"."EMPLOYEES" emp, 
      "RETAIL"."ORDERS" orders, 
      "RETAIL"."ORDERDETAILS" det ,
      "RETAIL"."OFFICES" O

WHERE cus.customerNumber=pay.customerNumber 
     AND cus.SALESREPEMPLOYEENUMBER=emp.employeeNumber 
     AND orders.ordernumber=det.orderNumber 
     AND det.productCode like prod."productCode"
     AND emp.officecode = O.officecode

ORDER BY TOTAL DESC 
 FETCH FIRST 30 ROWS ONLY; 
 
 CREATE VIEW "RETAIL".TOPSALES as(
   SELECT cus.CUSTOMERNAME as "CustomerName (Db2 for i)", 
       prod."productName" as "Product (GCP Big Query)", 
       pay.paymentDate as "Sales Date (Db2 for i)", 
       emp.lastname as "Sales Rep Name (Oracle)",
       O.CITY as "Sales Rep City(Oracle)",
       det.quantityOrdered as "Qty(Db2 for i)", 
       det.priceEach as "Unit Price",
       det.quantityOrdered * det.priceEach  as "TOTAL"

FROM "RETAIL"."CUSTOMERS" cus, 
     "RETAIL"."products" prod, 
     "RETAIL"."PAYMENTS" pay, 
      "RETAIL"."EMPLOYEES" emp, 
      "RETAIL"."ORDERS" orders, 
      "RETAIL"."ORDERDETAILS" det ,
      "RETAIL"."OFFICES" O

WHERE cus.customerNumber=pay.customerNumber 
     AND cus.SALESREPEMPLOYEENUMBER=emp.employeeNumber 
     AND orders.ordernumber=det.orderNumber 
     AND det.productCode= prod."productCode"
     AND emp.officecode = O.officecode);
     
 SELECT * from "RETAIL"."TOPSALES" ORDER BY TOTAL DESC FETCH FIRST 20 ROWS ONLY;    
 