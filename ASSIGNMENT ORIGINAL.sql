							----------- SET-1 ----------

                                      -- QUESTION-1 --

create database assignment;
use assignment;


                                      -- QUESTION-2 --
                                      
-- CONSOLIDATE DATA IMPORTING

									 -- QUESTION-3--

CREATE TABLE COUNTRIES(
NAME VARCHAR(25),
POPULATION INT,
CAPITAL VARCHAR(25));

SELECT * FROM COUNTRIES;

								       -- QUESTION-3A --

INSERT INTO COUNTRIES VALUES
('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta');

SELECT * FROM COUNTRIES;

INSERT INTO COUNTRIES VALUES
('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');


                                        -- QUESTION-3B --

INSERT INTO COUNTRIES VALUES
('Algeria',120,'Algiers'),
('Greenland',99,'Nuuk'),
('Afghanistan',150,'kabul'),
('Ukrain',88,'Kyiv'),
('kenya',75,'Nairobi');

                                         -- QUESTION-3C --

UPDATE COUNTRIES SET CAPITAL='New Delhi' WHERE  NAME='INDIA';

										 -- QUESTION-4 --

ALTER TABLE COUNTRIES RENAME TO BIG_COUNTRIES;

SELECT * FROM BIG_COUNTRIES;

                                         -- QUESTION-5A --

CREATE TABLE PRODUCT(
PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
PRODUCT_NAME VARCHAR(30) NOT NULL UNIQUE,
SUPPLIER_ID INT UNSIGNED,
FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS (SUPPLIER_ID)); 

                                        -- QUESTION-5B --

CREATE TABLE SUPPLIERS(
SUPPLIER_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
SUPPLIER_NAME VARCHAR(30),
LOCATION VARCHAR(30));

                                        -- QUESTION-5C --

CREATE TABLE STOCK(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
PRODUCT_ID INT,
BALANCE_STOCK VARCHAR(30),
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID));

SELECT * FROM PRODUCT;
SELECT * FROM SUPPLIERS;
SELECT * FROM STOCK;


SELECT COLUMN_NAME,CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME ='PRODUCT';

SELECT COLUMN_NAME,CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME ='STOCK';

                                         -- QUESTION-6 --

INSERT INTO PRODUCT VALUES
(1,'MOBILES',101),
(2,'REFRIGERATORS',102),
(3,'AIR CONDITIONERS',103),
(4,'TELIVISIONS',104),
(5,'LAPTOPS',105);

INSERT INTO SUPPLIERS VALUES
(101,'APPLE','MUMBAI'),
(102,'WHIRPOOL','HYDERABAD'),
(103,'SAMSUNG','KOLKATA'),
(104,'SONY','VIZAG'),
(105,'HP','BANGALORE');

INSERT INTO STOCK VALUES
(201,1,10),
(202,2,5),
(203,3,15),
(204,4,20),
(205,5,25);


ALTER TABLE STOCK MODIFY COLUMN BALANCE_STOCK INT;

DESCRIBE STOCK;

                                        -- QUESTION-7 --

ALTER TABLE SUPPLIERS MODIFY COLUMN SUPPLIER_NAME VARCHAR(30) UNIQUE NOT NULL;

                                        -- QUESTION-8A --

ALTER TABLE EMP ADD COLUMN DEPTNO INT UNSIGNED;


SELECT * FROM EMP;

SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

                                         -- QUESTION-8B --

UPDATE EMP
SET DEPTNO = (
      CASE      WHEN MOD(EMP_NO,2)=0 THEN 20
		        WHEN MOD(EMP_NO,3)=0  THEN 30 
		        WHEN MOD (EMP_NO,4)=0 THEN 40 
                WHEN MOD (EMP_NO,5)=0 THEN 50
                ELSE 10
                END);
                
    
                                        -- QUESTION-9 --
    
CREATE UNIQUE INDEX UNIQUE_VALUE ON EMPLOYEE (EMPID);

                                        -- QUESTION-10 --

CREATE VIEW EMP_SAL AS
  SELECT EMP_NO,FIRST_NAME,LAST_NAME,SALARY FROM EMP   ORDER BY SALARY ASC;

                
SELECT VIEW_CATALOG,VIEW_SCHEMA,VIEW_NAME FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE TABLE_SCHEMA = 'ASSIGNMENT' AND TABLE_NAME = 'EMP';



						        ----------------- SET-2  ---------------
                                  
                                  
                                  
  SELECT * FROM EMPLOYEE;                                

                                            -- QUESTION-1 --

SELECT * FROM EMPLOYEE WHERE SALARY > 3000;


                                            -- QUESTION-2A --
                                             
SELECT * FROM STUDENTS;

ALTER TABLE STUDENTS ADD COLUMN GRADES VARCHAR(30);

UPDATE STUDENTS
SET GRADES =(
CASE  WHEN MARKS BETWEEN 40 AND 50 THEN 'SECOND CLASS'
	  WHEN MARKS BETWEEN 50 AND 60 THEN 'FIRST CLASS'
      WHEN MARKS BETWEEN 60 AND 80 THEN 'FIRST CLASS'
      WHEN MARKS BETWEEN 81 AND 100 THEN  'DISTINCTION'
      ELSE 'THIRD CLASS'
      END);


SELECT * FROM STUDENTS 
WHERE GRADES='FIRST CLASS';
                
                                             -- QUESTION-2B --
     
SELECT * FROM STUDENTS 
WHERE GRADES='DISTINCTION';   
     
     
											 -- QUESTION-3 --
 
   SELECT * FROM STATION;
   
   SELECT DISTINCT CITY
   FROM  STATION WHERE MOD(ID,2)=0;
     
                                             -- QUESTION-4 --
     
   SELECT COUNT(CITY)- COUNT(DISTINCT CITY) FROM STATION;
   
   
                                             -- QUESTION-5A --
     
	SELECT DISTINCT CITY FROM STATION 
    WHERE LEFT (CITY,1) IN ('A','E','I','O','U');
     
                                              -- QUESTION-5B --
     
     
     SELECT DISTINCT CITY FROM STATION
     WHERE LEFT (CITY,1)  IN ('A','E','I','O','U') AND RIGHT (CITY,1) IN ('A','E','I','O','U'); 
     
     
                                              -- QUESTION-5C --
                                              
     SELECT DISTINCT CITY FROM STATION 
     WHERE LEFT (CITY,1) NOT IN ('A','E','I','O','U');
     
     
                                             -- QUESTION-5D --
     
     SELECT DISTINCT CITY FROM STATION
     WHERE LEFT (CITY,1) NOT IN ('A','E','I','O','U') AND RIGHT (CITY,1) NOT IN ('A','E','I','O','U');
     
     
     
     
											-- QUESTION-6 --
      
	SELECT * FROM EMP;
     
	SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMPLOYEE_NAME,SALARY FROM EMP
    WHERE SALARY >2000 AND  (SELECT TIMESTAMPDIFF(MONTH,HIRE_DATE,CURRENT_DATE)<=36)
    ORDER BY SALARY DESC;
     
     
	

                                           -- QUESTION-7 --
    
                                               
SELECT DEPTNO,SUM(SALARY) FROM EMPLOYEE
GROUP BY
DEPTNO;
    
    
                                          -- QUESTION-8 --
    SELECT * FROM CITY;
    
    SELECT COUNT(ID)  FROM CITY WHERE  POPULATION >100000 ;
    
    
                                          -- QUESTION-9 --
     
     SELECT * FROM CITY;
     
     SELECT SUM(POPULATION) FROM CITY
     WHERE DISTRICT='CALIFORNIA';
    
                                         -- QUESTION-10 --
    
    SELECT * FROM CITY;
    
    SELECT AVG(POPULATION) FROM CITY
    GROUP BY 
    DISTRICT;
    
    
    
                                          -- QUESTION-11 --
    
    SELECT * FROM ORDERS;
    SELECT * FROM CUSTOMERS;
    
    SELECT ORDERNUMBER,STATUS,CUSTOMERNUMBER,CUSTOMERNAME FROM ORDERS
    LEFT JOIN 
	CUSTOMERS 
    USING (CUSTOMERNUMBER)
    WHERE  STATUS='DISPUTED';
    
    
    
    
						-------------- SET-3 --------------
    
                                 -- QUESTION-1 --
    
    SELECT * FROM ORDERS;
     
	DROP PROCEDURE ORDER_STATUS;
     
    DELIMITER //
    CREATE PROCEDURE ORDER_STATUS(IN order_year INT, IN order_month INT)
    BEGIN 
    SELECT ORDERNUMBER,ORDERDATE,STATUS FROM ORDERS
    WHERE year(ORDERDATE) = order_year  AND month(ORDERDATE)=order_month;
    END//
    DELIMITER ;
    
    CALL ORDER_STATUS(2003,2);
    
								-- QUESTION-2A --
   
   SELECT * FROM ORDERS;
   SELECT * FROM CUSTOMERS;
    
    SELECT * FROM CANCELLATIONS;
    
    DROP TABLE CANCELLATIONS;
    
   CREATE TABLE CANCELLATIONS(
    ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CUSTOMERNUMBER INT, 
    CONSTRAINT FOREIGN KEY (CUSTOMERNUMBER) REFERENCES CUSTOMERS (CUSTOMERNUMBER),
    ORDERNUMBER INT,
    CONSTRAINT FOREIGN KEY (ORDERNUMBER) REFERENCES ORDERS (ORDERNUMBER),
    COMMENTS VARCHAR(100));
      
	
								-- QUESTION-2B --
    drop trigger trigger_on_cancelled;
    
    
    DELIMITER // 
    CREATE TRIGGER trigger_on_cancelled    
    AFTER UPDATE 
         ON ORDERS FOR EACH ROW
         BEGIN
			    IF NEW.status = 'Cancelled' THEN
				INSERT INTO CANCELLATIONS (CUSTOMERNUMBER, ORDERNUMBER, COMMENTS)
				SELECT CustomerNumber, orderNumber, comments FROM ORDERS
				WHERE orderNumber = NEW.orderNumber AND Status = NEW.status;
                end if;
		        END //
	DELIMITER ;
    
    
    
    show triggers;
    
    
								-- QUESTION-3A --
    
    DELIMITER //   
CREATE FUNCTION PURCHASE_STATUS( C_NO int) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE STATUS VARCHAR(20);
    DECLARE VAR1 NUMERIC;
    SET VAR1 = (SELECT SUM(AMOUNT) FROM PAYMENTS WHERE CUSTOMERNUMBER = C_NO);
    IF   VAR1 < 25000 THEN SET STATUS = 'SILVER';
    ELSEIF VAR1 BETWEEN 25000 AND 50000 THEN SET STATUS = 'GOLD';
    ELSEIF  VAR1 > 50000 THEN
        SET STATUS = 'PLATINUM';
    END IF;
    RETURN (STATUS) ;
END //
DELIMITER ;
    
   SELECT PURCHASE_STATUS(166); 
    
    
								-- QUESTION-3B --
    
   
    
    SELECT * FROM PAYMENTS;
    
     ALTER TABLE PAYMENTS ADD COLUMN PURCHASE_STATUS VARCHAR (50);
    
    UPDATE PAYMENTS
    SET PURCHASE_STATUS= (CASE WHEN AMOUNT  < 25000 THEN 'SILVER'
                          WHEN AMOUNT BETWEEN 25000 AND 50000 THEN 'GOLD'
                          WHEN AMOUNT > 50000 THEN ' PLATINUM'
                          END);
    
    SELECT CUSTOMERNUMBER,CUSTOMERNAME,PURCHASE_STATUS FROM CUSTOMERS
    JOIN PAYMENTS
    USING (CUSTOMERNUMBER);
    
                                -- QUESTION-4 --
    
    SELECT * FROM MOVIES;
    
    
    DELIMITER //
    CREATE TRIGGER TRIGGER_MOVIES_UPDATE
    AFTER DELETE ON MOVIES FOR EACH ROW
    BEGIN
      UPDATE RENTALS
      SET MOVIEID=ID
      WHERE MOVIEID =OLD.ID;
    END //
    DELIMITER ;
    
    
    DELIMITER //
    CREATE TRIGGER TRIGGER_MOVIES_DELETE
    AFTER DELETE ON MOVIES FOR EACH ROW
    BEGIN
     DELETE FROM RENTALS
     WHERE MOVIEID NOT IN (SELECT DISTINCT ID FROM MOVIES);
     END //
     DELIMITER ;
     
     
    
                                 -- QUESTION-5 --
    
SELECT * FROM EMPLOYEE;
    
 Select FNAME from EMPLOYEE order by Salary DESC limit 2,1;


                                -- QUESTION-6 --
    
SELECT * FROM EMPLOYEE;

SELECT * FROM (
SELECT FNAME, SALARY, DENSE_RANK() 
OVER(ORDER BY  SALARY DESC) RNK FROM EMPLOYEE) A;
    
    
 
 
 
  

  
  
  
  
  