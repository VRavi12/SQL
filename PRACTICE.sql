USE hr;


-- DQL (DATA QUERY LANGUAGE)-SELECT

SELECT * FROM EMPLOYEES;

-- SELECT COLUMNS FROM MY CHOICE 

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 9000;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = 'IT PROG' AND SALARY > 9000;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY >= 9000 AND SALARY <= 12000;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 12000;


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

-- ORDER BY CLAUSE (SORTING THE DATA)
SELECT * FROM EMPLOYEES
ORDER BY JOB_ID,SALARY;

SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES
ORDER BY JOB_ID,SALARY;

-- IN OPERATOR 
SELECT * FROM EMPLOYEES 
WHERE JOB_ID IN ('IT_PROG','SA_MAN');


SELECT * FROM EMPLOYEES
WHERE JOB_ID  NOT IN ('IT_PROG','SA_MAN');


---  NULL VALUES 
SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT  NULL;


-- CASE WHEN THEN EXPESSION 
-- SIMPLE CASE EXPRESSION 
-- SEARCHED CASE EXPRESSION

select EMPLOYEE_ID, JOB_ID, SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.5+SALARY 
           WHEN  'SA_MAN' THEN SALARY*0.2+SALARY
           ELSE SALARY 
           END AS UPDATED_SALARY
           FROM EMPLOYEES;

-- SEARCHED CASE EXPRESSION


select EMPLOYEE_ID, JOB_ID, SALARY,DEPARTMENT_ID,
CASE WHEN JOB_ID = 'IT_PROG' THEN (SALARY * 0.5)+SALARY
    WHEN  DEPARTMENT_ID = 90 THEN (SALARY -2000)+SALARY
    ELSE SALARY
    END UPDATED_SALARIES
    FROM EMPLOYEES;
    
    
    SELECT * FROM EMPLOYEES;
    
    -- HANDELLING NULL VALUES(IFNULL,COALESCE)
    
    select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY,DEPARTMENT_ID,
    COMMISSION_PCT,IFNULL(COMMISSION_PCT,0) UPDATED_COMM FROM EMPLOYEES;
    
    
    SELECT * FROM LOCATIONS;
    SELECT STATE_PROVINCE,CITY,STREET_ADDRESS,LOCATION_ID, COALESCE(STATE_PROVINCE,CITY,STREET_ADDRESS)  UPDATED_DATA FROM LOCATIONS;
    
    
    
    
    
    -- DDL(DATA DEFINITION LANGUAGE)
    -- CREATE,ALTER,(ADD,RENAME,DROP),TRUNCATE,COMMENT
    
    
    -- CHARACTERS-- CHAR(20)-RAVI ,VARCHAR(20)
    -- NUMBERS - INT,DECIMAL(P,S)-PRECISSION, SCALE (8,2) 1234.23
    -- INT UNSIGNED
    -- DATE 'YYYY-MM-DD'
    
    CREATE DATABASE EXCELR;
    
    USE EXCELR;
    
    CREATE TABLE TRAINING(
    EMP_ID INT UNSIGNED,
    FIRST_NAME VARCHAR (100),
    LAST_NAME VARCHAR (100),
    SALARY DECIMAL (10,3));
    
SELECT * FROM  TRAINING;

ALTER TABLE TRAINING ADD COLUMN PHONE_NUMBER VARCHAR (15);

ALTER TABLE TRAINING ADD column AADHAR VARCHAR (15) AFTER LAST_NAME;

SELECT * FROM TRAINING;

ALTER TABLE TRAINING DROP COLUMN AADHAR;




SELECT * FROM TRAINING;

ALTER TABLE TRAINING  DROP SALARY, DROP PHONE_NUMBER;

ALTER TABLE TRAINING ADD SALARY DECIMAL(10,2), ADD PHONE_NUMBER VARCHAR(30);

ALTER TABLE TRAINING RENAME COLUMN SALARY TO CTC;


-- ALTER TABLE TARINING RENAME SALARY TO CTC; (COLUMN KEYWORD REQUIRED HERE)

USE HR;
CREATE TABLE COPIED AS (SELECT * FROM EMPLOYEES WHERE FALSE);
SELECT * FROM COPIED;

SELECT EMPLOYEE_ID, EMAIL,SALARY FROM COPIED;

DESC COPIED;

ALTER TABLE COPIED MODIFY COLUMN FIRST_NAME VARCHAR(50);

SHOW FULL COLUMNS FROM EMPLOYEES;

ALTER TABLE EMPLOYEES  MODIFY COLUMN HIRE_DATE DATE COMMENT 'JOINING DATE';



-- DML (DATA MANIPULAION LANGUAGE)- INSERT,UPDATE,DELETE,SAVEPOINT
-- TCL (TRANSACTION CONTROL LANGUAGE)- COMMIT,ROLLBACK


-- SEARCHED CASE EXPRESSION 
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,DEPARTMENT_ID,SALARY,
CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY*0.5+SALARY
     WHEN DEPARTMENT_ID = 90 THEN (SALARY-2000)+SALARY
     WHEN FIRST_NAME = 'STEVEN' THEN (SALARY+2000)+SALARY
     ELSE SALARY
     END UPDATED_SALARY
     FROM EMPLOYEES;
     
     USE HR;
     
     SET AUTOCOMMIT =0;
     
     
     
	SELECT * FROM EMPLOYEES;
    
    UPDATE EMPLOYEES 
    SET SALARY=(
    CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.5+SALARY
				WHEN 'SA_MAN' THEN SALARY*0.2+SALARY
                WHEN 'SA REP' THEN SALARY*0.1+SALARY
                ELSE SALARY
                END);
                
 CREATE TABLE NEW(
 EMP_ID INT UNSIGNED NOT NULL,
 FIRST_NAME VARCHAR(20),
 LAST_NAME VARCHAR(20),
 SALARY DECIMAL(10,2));
    
DROP TABLE NEW;
                
SELECT * FROM NEW;

DESC NEW;


 
 
 
 
 
 -- 3rd day class
                
                
CREATE TABLE NEW(
EMP_ID INT UNSIGNED,
FIRST_NAME VARCHAR(30),
LAST_NAME VARCHAR(30),
SALARY DECIMAL (10,2));


SELECT * FROM NEW;

INSERT INTO NEW VALUES(101,'RAVI','KUMAR',10000);
 
 
 INSERT INTO NEW VALUES
 (101,'RAVI','KUMAR',10000),
 (101,'RAVI','KUMAR',10000),
 (101,'RAVI','KUMAR',10000);
 
 
 INSERT INTO NEW (FIRST_NAME,LAST_NAME) VALUES ('RAVI','KUMAR');
 
 INSERT INTO NEW VALUES(101,'RAVI','KUMAR',NULL);
     
     
SET AUTOCOMMIT=0;-- 
	
INSERT INTO NEW VALUES (102,'ABC','XYZ',15000);

ROLLBACK;

COMMIT;


-- UPDATING THE DATA

SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = 25000
WHERE EMPLOYEE_ID=102;

ROLLBACK;

UPDATE EMPLOYEES 
SET SALARY=25000,FIRST_NAME='RAVI'
WHERE EMPLOYEE_ID=102;

ROLLBACK;
COMMIT;


UPDATE EMPLOYEES
SET COMMISSION_PCT = IFNULL (COMMISSION_PCT,0)
WHERE COMMISSION_PCT IS NULL;


UPDATE EMPLOYEES
SET SALARY =(
CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.5+SALARY
            WHEN 'SA_MAN' THEN SALARY*0.2+SALARY
            WHEN 'SA_REP' THEN SALARY*0.1+SALARY
            ELSE SALARY
            END)
where employee_id=employee_id;

select * from EMPLOYEES;

UPDATE EMPLOYEES
 SET SALARY =(
 CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.5+SALARY
             WHEN 'SA_MAN' THEN SALARY*0.2+SALARY
             WHEN 'SA_REP' THEN SALARY*0.1+SALARY
             ELSE SALARY
             END);
            
select * FROM NEW;

DROP TABLE NEW;

CREATE DATABASE RELATIONS;

DROP DATABASE RELATIONS;

CREATE DATABASE RELATIONS;

USE Relations;

create table relations(
emp_id int unsigned primary key,
first_name varchar(20),
last_name varchar(20),
department_id int unsigned);

drop table relations;



CREATE TABLE DEPARTMENTS(
DEPARTMENT_ID INT UNSIGNED PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(30));


CREATE TABLE EMP1 (
EMP_ID INT UNSIGNED PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
DEPARTMENT_ID INT UNSIGNED,
CONSTRAINT EMPLOYEE_FK FOREIGN KEY (DEPARTMENT_ID) 
REFERENCES DEPARTMENTS1 (DEPARTMENT_ID) ON DELETE SET NULL ON UPDATE CASCADE);


select * from departments1;
select * from EMP1;


SELECT COLUMN_NAME,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'EMP1';

 DROP TABLE NEW;
 
CREATE TABLE NEW(
EMP_ID INT UNSIGNED,
FIRST_NAMER VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY DECIMAL(10,2));

SELECT COLUMN_NAME,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'NEW';

ALTER TABLE NEW ADD PRIMARY KEY(EMP_ID);

ALTER TABLE NEW DROP PRIMARY KEY;

ALTER TABLE NEW ADD COLUMN AADHAR_NO VARCHAR(20) AFTER  EMP_ID;

SELECT * FROM NEW;

INSERT INTO  NEW VALUES
(101,6015,'RAVI','KUMAR',10000),
(NULL,1234,'RAVI','KUMAR',20000),
(103,3456,'RAVI','KUMAR',30000);

DROP TABLE NEW;

CREATE TABLE NEW(
EMP_ID INT UNSIGNED UNIQUE,
AADHAR_NO VARCHAR(20),
FIRST_NAMER VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY DECIMAL(10,2));

SELECT  * FROM NEW;

ALTER TABLE NEW DROP CONSTRAINT EMP_ID;

ALTER TABLE NEW ADD CONSTRAINT EMP_UNQ UNIQUE (EMP_ID);

CREATE DATABASE RELATIONS;

USE RELATIONS;

CREATE TABLE EMPLOYEES(
EMP_ID INT UNSIGNED PRIMARY KEY,
FIRST_NAME VARCHAR (20),
LAST_NAME VARCHAR(20),
DEPARTMENT_ID INT UNSIGNED,
FOREIGN KEY (DEPARTMENT_ID)  REFERENCES  DEPARTMENTS (DEPARTMENT_ID));

DROP TABLE DEPARTMENTS;
DROP TABLE EMPLOYEES;

CREATE TABLE DEPARTMENTS(
DEPARTMENT_ID INT UNSIGNED PRIMARY KEY,
DEPARTMENT_NAME VARCHAR (20));

DROP DATABASE  RELATIONS;


INSERT INTO  DEPARTMENTS VALUES (90,'IT');

INSERT INTO EMPLOYEES VALUES (101,'RAVI','KUMAR',90);

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- ON UPDATE DELETE 
-- ON DELETE SET NULL
-- ON DELETE CASCADE



CREATE TABLE DEPARTMENTS1(
DEPARTMENT_ID INT UNSIGNED PRIMARY KEY,
DEPARTMENT_NAME VARCHAR (20));

CREATE TABLE EMPLOYEES1(
EMP_ID INT UNSIGNED PRIMARY KEY,
FIRST_NAME VARCHAR (20),
LAST_NAME VARCHAR(20),
DEPARTMENT_ID INT UNSIGNED,
FOREIGN KEY (DEPARTMENT_ID)  REFERENCES  DEPARTMENTS (DEPARTMENT_ID) ON DELETE SET NULL ON UPDATE CASCADE);

INSERT INTO EMPLOYEES1 VALUES(101,'RAVI','KUMAR',90);

INSERT INTO  DEPARTMENTS1 VALUES (90,'IT');

UPDATE DEPARTMENTS1 
SET DEPARTMENT_ID =60
WHERE DEPARTMENT_ID=90;


SELECT * FROM EMPLOYEES1;
SELECT * FROM DEPARTMENTS1;

DELETE FROM DEPARTMENTS1 WHERE DEPARTMENT_ID=60;



-- joins
-- INNER JOIN
-- OUTER JOIN
      -- LEFT OUTER JOIN
      -- RIGHT OUTER JOIN
      -- FULL OUTER JOIN
 -- CROSS JOIN
 -- SELF JOIN
 
 
 USE HR;
 
 SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
 JOIN
 DEPARTMENTS
 USING (DEPARTMENT_ID);
 
  SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
 LEFT JOIN
 DEPARTMENTS
 USING (DEPARTMENT_ID);
 
 
 use hr;
 select * from employees;
 select * from departments;
 
 select e1.employee_id,e1.first_name emp_first_name,e1.last_name emp_last_name,
 e2.manager_id,e2.first_name mgr_first_name,e2.last_name mgr_last_name
 from employees e1
join
employees e2
on (e1.manager_id=e2.employee_id);


 SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
 left JOIN
 DEPARTMENTS
 USING (DEPARTMENT_ID)
 union
 SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
 LEFT JOIN
 DEPARTMENTS
 USING (DEPARTMENT_ID);
 
 
USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
LEFT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
RIGHT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

-- JOINING WITH ON CLAUSE

ALTER TABLE DEPARTMENTS RENAME COLUMN DEPARTMENT_ID TO DEPT_ID;

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
JOIN 
DEPARTMENTS
ON (EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPT_ID);

select e1.employee_id,e1.first_name emp_first_name,e1.last_name emp_last_name,
e2.manager_id,e2.first_name mgr_first_name,e2.last_name mgr_last_name
from employees e1
join
employees e2
on (e1.manager_id=e2.employee_id);


select e1.employee_id,e1.first_name,e1.last_name,
e2.manager_id,e2.first_name mgr_first_name,e2.last_name mgr_last_name
from employees e1
join
employees e2
on (e1.manager_id=e2.employee_id);

-- cross join
select * from employees
cross join
deaprtments;

use hr;

-- cross join
select * from employees
cross join
departments;

alter table departments rename column dept_id to department_id;

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
LEFT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID)
union
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,DEPARTMENT_NAME FROM EMPLOYEES
right JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

-- concatenate
select * from employees;

select employee_id,concat(first_name,' ',last_name) emp_name from employees;


-- joining  theree tables

select * from employees;
select * from departments;
select * from locations;

select employee_id,first_name,last_name,salary,department_id,department_name,state_province from employees
join departments 
using (department_id)
join locations
using (location_id);


-- aggregate functions
-- sum,min,max,count,avg

select round(sum(salary),2),avg(salary),min(salary),max(salary),count(salary) from employees;

-- ciel. floor

select job_id, round(sum(salary),2),avg(salary),min(salary),max(salary),count(salary) from employees
group by job_id
having avg(salary)>11000;

-- views
select * from employees;

create view roles as (select employee_id,first_name,last_name,department_id from employees);

select * from roles;


use relations;
create table new1(
emp_id int unsigned,
first_name varchar(20),
last_name varchar(20),
salary decimal (8,2));

select * from new1;

insert into new1 values (101,'ravi','kumar',10000);

insert into new1 values 
(102,'ravi','kumar',20000),
(102,'ravi','kumar',30000),
(102,'ravi','kumar',40000);

create view emp_new as (select emp_id,first_name,last_name,salary from new1);

alter view emp_new as
select emp_id,first_name,last_name,salary  from new1
where salary between 10000 and 30000;


select * from emp_new;


use hr;

-- stored procedures
 
 
delimiter //
create procedure x()
begin 
select * from employees where salary between 11000 and 12000;
end //
delimiter ;

call x();

select * from employees;

delimiter //
create procedure get_data1()
begin 
select employee_id,first_name,last_name,salary,department_id,department_name from employees
join 
departments
using (department_id);
end //
delimiter ;

drop procedure y;

-- stored procedure with IN arguement

delimiter //
create procedure y(in var1 varchar(20),in var2 int)
begin
select * from employees
where job_id = var1 and salary > var2;
end //
delimiter ;

call y('it_prog',8000);
call y('it_prog',10000);
 

delimiter //
create procedure get_data (in var1 int,in var2 int)
begin 
select * from employees
where salary between var1 and var2;
end //
delimiter ;

call get_data(5000,10000);


call get_data1();

 -- stored procedue with IN OUT arguements
 
delimiter //
create procedure get_data4(in var1 varchar(10),out var2 decimal(10,2))
begin
select * from employees
where job_id= var1 and avg(salary)=var2;
end //
delimiter ;

call get_data4('it_prog',@var2);

select @var2;

drop procedure home_work;

delimiter //
create procedure home_work(in var1 varchar (10),out var2 decimal (10,2))
begin 
select avg(salary) into var2 from employees
where job_id = var1;
end //
delimiter ;

call home_work('it_prog',@var2);

select * from employees;


select distinct job_id from employees;


use relations;

create table trigger1(
cust_no int,
age int,
name varchar(20));

select * from trigger1;

delimiter //
create trigger verify_age
before insert on trigger1 for each row
begin
if new.age < 0 then set new.age= 0;
elseif new.age is null then set new.age= 0; 
end if;
end //
delimiter ;


insert into trigger1 values (1,10,'ravi');

insert into trigger1 values (1,-10,'ravi');

insert into trigger1 values (1,null,'ravi');


select * from trigger1;

drop table person;
create table person(
id int primary key auto_increment,
name varchar(30) not null,
email varchar(30),
birthdate date);

create table log(
id int auto_increment,
personid int,
message text not null,
primary key (id,personid));

delimiter //
create trigger after_people_insert_data
after insert on person for each row
begin
if new.birthdate is null then
insert into log (personid,message) values (new.id,concat('hey',  new.name, 'please provide your date of birth'));
end if ;
end //
delimiter ;

insert into person values (1,'ravi','ravi.gmail',null);

select * from person;

select * from log;

use hr;
create table customers(
id int unsigned primary key auto_increment,
name_1 varchar (20));


select * from customers;

delimiter //
create trigger verify_age
before insert on customers for  each row
begin if new.age < 0 then set new.age=0;
elseif new.age is null then set new.age=0;
end if;
end //
delimiter ;

insert into customers (name_1) values ('ravi');

alter table  customers auto_increment=100;

drop table customers;

select * from employees;

 
select max(salary) from employees; 
select min(salary) from employees;
select * from employees where sno=2 or sno=4;

use hr;

select * from employees;
select * from departments;

select employee_id,first_name,department_id,department_name from employees
left join departments 
using (department_id);

select employees.employee_id,employees.first_name,departments.department_name,employees.department_id from employees
left join departments on
employees.department_id=departments.department_id;

select department_id,count(first_name) from employees
group by department_id;



use hr;
select * from employees;
select * from departments;
select * from jobs;
select * from locations;
select * from new;
select * from people;
select * from countries;
select * from job_history;


select first_name,department_id,sum(salary) as Total,commission_pct from employees
group by department_id;


select employee_id,department_id,location_id,first_name from employees
join 
departments
using (department_id);

select employee_id,first_name,max(salary) from employees
group by department_id;

select employee_id,first_name,department_id,
rank() over (partition by department_id order by  salary desc) as Rank1 from employees
where Rank1=1;


use hr;
select * from employees;

select * from employees
where job_id="it_prog";

use hr;

select * from employees;

select First_name,last_name from employees
where first_name like '%a';

select first_name,last_name from employees
where first_name like 'a%';

select first_name,last_Name from employees
where first_name like '%a%';

select distinct(job_id) as idd from employees;

select count(job_id) from employees;

select distinct(count(job_id)) from employees;

select count(distinct(job_id)) from employees;

select job_id,count(job_id) as cnt from employees
group by job_id;


use hr;

select * from employees;

select employee_id,job_id,first_name,avg(salary),salary from employees
group by job_id
having salary > avg(salary);

select job_id,count(job_id) from employees
group by job_id
having count(job_id) >2;


select employee_id,job_id,first_name,avg(salary),salary from employees
group by job_id
having salary > avg(salary)
order by salary asc;

select employee_id,job_id,first_name,avg(salary),salary from employees
group by job_id
having salary > avg(salary)
order by salary desc;


select * from employees;

update employees 
set first_name="Steve"
where employee_id=102;

insert into employees values
(300,"Valli","stella","abcdvalli","590.423.4560","1998-02-05","IT_PROG",16200.00,null,103,60);

delete from employees
where employee_id=300;

select * from departments;
select * from locations;

select e.employee_id,concat(first_name," ",last_name) as Full_name,
d.department_id,d.department_name,job_id,l.location_Id,l.city from employees e
left join departments d on e.department_id=d.department_id
left join locations l on d.location_id=l.location_id;

select e.employee_id,concat(first_name," ",last_name) as Full_name,
d.department_id,d.department_name,job_id,l.location_Id,l.city from employees e
right join departments d on e.department_id=d.department_id
right join locations l on d.location_id=l.location_id;


use hr;

select e.employee_id,e.first_name,e.salary,m.employee_id as mgr_id,m.first_name as mgr_name,m.salary as mgr_salary
from employees e 
inner join employees m on e.manager_id=m.employee_id
where e.salary > m.salary;

select e.employee_id,e.first_name,m.employee_id as mgr_id,m.first_name as mgr_name
from employees e
inner join employees m on e.manager_id=m.employee_id;

select e.employee_id,e.first_name,e.salary,m.employee_id,m.first_name,m.salary as mgr_salary 
from employees e
inner join employees m on e.manager_id=m.employee_id
where m.salary > e.salary;

select e.employee_id,e.first_name,e.salary,m.employee_id,m.first_name,m.salary as mgr_salary 
from employees e
inner join employees m on e.manager_id=m.employee_id
where m.salary <= e.salary;



----------------------------- practice -------------------------------




use hr;
select * from employees
where salary>2500 and department_id=20;

select * from employees
where department_id=30;

select e.employee_id,e.first_name,m.manager_id
 from employees e
 inner join employees m on e.manager_id =m.employee_id
 where e.manager_id=30;
 
 select department_id,manager_id from employees;

select * from employees
where job_id like  "%man" 
group by department_id=20 and 50 and 30;


use hr;


CREATE TABLE IF NOT EXISTS Employee_data (
 `EMPNO` INT,
 `ENAME` VARCHAR(6) CHARACTER SET utf8mb4,
 `JOB` VARCHAR(9) CHARACTER SET utf8mb4,
 `MGR` INT,
 `HIREDATE` DATETIME,
 `SAL` INT,
 `COMM` INT,
 `DEPTNO` INT);

select * from employee_data;

drop table employee_data;

INSERT INTO Employee_data VALUES
 (7369,'SMITH','CLERK',7902,'1980-12-17 00:00:00',800,NULL,20),
 (7499,'ALLEN','SALESMAN',7698,'1981-02-20 00:00:00',1600,300,30),
 (7521,'WARD','SALESMAN',7698,'1981-02-22 00:00:00',1250,500,30),
 (7566,'JONES','MANAGER',7839,'1981-04-02 00:00:00',2975,NULL,20),
 (7654,'MARTIN','SALESMAN',7698,'1981-09-28 00:00:00',1250,1400,30),
 (7698,'BLAKE','MANAGER',7839,'1981-05-01 00:00:00',2850,NULL,30),
 (7782,'CLARK','MANAGER',7839,'1981-06-09 00:00:00',2450,NULL,10),
 (7788,'SCOTT','ANALYST',7566,'1982-12-09 00:00:00',3000,NULL,20),
 (7839,'KING','PRESIDENT',NULL,'1981-11-17 00:00:00',5000,NULL,10),
 (7844,'TURNER','SALESMAN',7698,'1981-09-08 00:00:00',1500,0,30),
 (7876,'ADAMS','CLERK',7788,'1983-01-12 00:00:00',1100,NULL,20),
 (7900,'JAMES','CLERK',7698,'1981-12-03 00:00:00',950,NULL,30),
 (7902,'FORD','ANALYST',7566,'1981-12-03 00:00:00',3000,NULL,20),
 (7934,'MILLER','CLERK',7782,'1982-01-23 00:00:00',1300,NULL,10);

CREATE TABLE DEPT(
DEPT_NO INT,
DEPT_NAME VARCHAR (10),
LOC VARCHAR (10));

SELECT * FROM DEPT;
INSERT INTO DEPT VALUES
(10,"ACCOUNTING","NEWYORK"),
(20,"RESEARCH","DALLAS"),
(30,"SALES","CHICAGO"),
(40,"OPERATIONS","BOSTON");


SELECT * FROM EMPLOYEE_DATA;
-- Display all the employees who are getting 2500 and excess salaries in department 20--

SELECT * FROM EMPLOYEE_DATA
WHERE SAL >=2500 AND DEPTNO=20;

--  Display all the managers working in 20 & 30 department.--

SELECT * FROM EMPLOYEE_DATA
WHERE JOB LIKE "MAN%" 
GROUP BY  DEPTNO=20 AND 30;

-- Display all the managers who don’t have a manager--

SELECT E.MGR,E.JOB,M.MGR AS NO_MGR FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA M ON E.MGR=M.EMPNO
WHERE E.JOB="MANAGER";

-- Display all the employees who are getting some commission with their designation is neither MANANGER nor ANALYST--

SELECT * FROM EMPLOYEE_DATA
WHERE JOB NOT IN ("ANALYST","MANAGER") AND COMM IS NOT NULL;


--  Display all the ANALYSTs whose name doesn’t ends with ‘S’--

SELECT ENAME,JOB FROM EMPLOYEE_DATA
WHERE JOB ="ANALYST" AND ENAME NOT LIKE "%S";

-- Display all the employees whose naming is having letter ‘E’ as the last but one character--

SELECT * FROM EMPLOYEE_DATA
WHERE ENAME LIKE "%E";

-- Display all the employees who total salary is more than 2000.(Total Salary = Sal + Comm) --



SELECT *, SAL+IFNULL(COMM,0) AS TOTAL_SAL  FROM EMPLOYEE_DATA 
WHERE SAL+IFNULL(COMM,0) >2000;



-- Display all the employees who are getting some commission in department 20 & 30.--

SELECT * FROM EMPLOYEE_DATA
WHERE COMM IS NOT NULL
ORDER BY DEPTNO;

--  Display all the managers whose name doesn't start with A & S--

SELECT * FROM EMPLOYEE_DATA
WHERE JOB = "MANAGER" AND ENAME NOT LIKE "A%" AND ENAME NOT LIKE "S%";

-- Display all the employees who earning salary not in the range of 2500 and 5000 in department 10 & 20-- 

SELECT * FROM EMPLOYEE_DATA
WHERE SAL NOT BETWEEN 2500 AND 5000
GROUP BY DEPTNO=10 AND 20;

-- Display job-wise maximum salary.--
 
 SELECT *, MAX(SAL) FROM EMPLOYEE_DATA
 GROUP BY JOB;

-- Display the departments that are having more than 3 employees under it.--

SELECT DEPTNO,JOB,COUNT(DEPTNO) AS CNT FROM EMPLOYEE_DATA
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

SELECT DEPTNO,JOB,COUNT(*) FROM EMPLOYEE_DATA
GROUP BY DEPTNO HAVING COUNT(*) >=3
ORDER BY DEPTNO ASC;


-- Display job-wise average salaries for the employees whose employee number is not from 7788 to 7790.--

SELECT *, AVG(SAL) FROM EMPLOYEE_DATA
WHERE EMPNO NOT IN(7788,7790)
GROUP BY JOB;

-- Display department-wise total salaries for all the Managers and Analysts, only if the average salaries for the same is greater than or equal to 3000.--

SELECT ENAME,JOB,SAL+IFNULL(COMM,0) AS TOTAL_SAL FROM EMPLOYEE_DATA
WHERE SAL>(SELECT AVG(SAL) FROM EMPLOYEE_DATA)
GROUP BY JOB="MANAGER","ANALYST";

SELECT JOB,SAL,SAL+IFNULL(COMM,0) AS TOTAL_SAL,AVG(SAL) FROM EMPLOYEE_DATA
GROUP BY JOB ="MANAGER","ANALYST" HAVING AVG(SAL) >=3000;

                                   -- 2D -- 
-- Select only the duplicate records along-with their count.--

SELECT EMPNO,COUNT(EMPNO) FROM EMPLOYEE_DATA
GROUP BY EMPNO
HAVING COUNT(EMPNO) >1;

SELECT JOB,COUNT(JOB) FROM EMPLOYEE_DATA
GROUP BY JOB
HAVING COUNT(JOB) >1;

SELECT EMPNO,COUNT(*) FROM EMPLOYEE_DATA
GROUP BY EMPNO
HAVING COUNT(*) >1;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY JOB ORDER BY JOB) ROW_NUM FROM EMPLOYEE_DATA;

-- Select only the non-duplicate records. --

 SELECT DISTINCT(EMPNO) FROM EMPLOYEE_DATA;

-- Select only the duplicate records that are duplicated only once. --

SELECT *, 
ROW_NUMBER() OVER (PARTITION BY EMPNO ORDER BY EMPNO) ROW_NUM FROM EMPLOYEE_DATA
WHERE ROW_NUM >=1;

CREATE TABLE SKILLS(
ID INT,
NAME_SK VARCHAR (10));
 
INSERT INTO SKILLS VALUES
(101,"Oracle"),
(102,"Oracle"),
(103,"Oracle"),
(101,"Oracle"),
(102,"Java"),
(103,"Java"),
(101,"Java"),
(102,"Java"),
(103,"Java"),
(101,"Java"),
(101,"Java"),
(101,"Oracle"),
(101,"VB"),
(102,"ASP");

SELECT * FROM SKILLS;

-- Select only the duplicate records along-with their count.--

SELECT ID,COUNT(ID) AS CNT FROM SKILLS
GROUP BY ID
HAVING CNT >1;

-- Select only the non-duplicate records.--

SELECT DISTINCT(ID),NAME_SK FROM SKILLS
GROUP BY ID,NAME_SK;

-- Select only the duplicate records that are duplicated only once. --

WITH CTE_DR AS (
SELECT ID,NAME_SK,
ROW_NUMBER() OVER(PARTITION BY ID,NAME_SK ORDER BY ID) RW_NM FROM SKILLS
) 
SELECT * FROM CTE_DR WHERE RW_NM  >=1;

-- Select only the duplicate records that are not having the id=101 --

SELECT *,COUNT(*) FROM SKILLS
WHERE ID NOT IN (101)
GROUP BY ID,NAME_SK
HAVING COUNT(*) >1;


                           -- SUB QUERIES --
-- Display all the employees who are earning more than all the managers-- 

SELECT * FROM EMPLOYEE_DATA
WHERE SAL=(SELECT SAL FROM EMPLOYEE_DATA WHERE SAL > JOB LIKE "MAN%");

SELECT E.DEPTNO,E.JOB,E.ENAME,E.SAL,M.MGR AS MGR_SAL,M.ENAME AS MGR_NAME,M.DEPTNO AS MGR_DNO FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA M ON E.MGR=M.EMPNO
WHERE E.SAL > M.SAL;


SELECT * FROM EMPLOYEE_DATA E,
(SELECT *FROM EMPLOYEE_DATA WHERE EMPNO IN (SELECT MGR FROM EMPLOYEE_DATA)) M
WHERE E.SAL > M.SAL AND E.MGR=M.EMPNO;


-- Display all the employees who are earning more than any of the managers.--

SELECT * FROM DEPT;

SELECT * FROM EMPLOYEE_DATA WHERE SAL > 
ANY (SELECT SAL FROM EMPLOYEE_DATA WHERE JOB="MANAGER");

-- Select employee number, job & salaries of all the Analysts who are earning more than any of the managers.--

SELECT EMPNO,JOB,SAL FROM EMPLOYEE_DATA WHERE JOB ="ANALYST" AND
 SAL > ANY(SELECT SAL FROM EMPLOYEE_DATA WHERE JOB="MANAGER");


-- Select all the employees who work in DALLAS.--

SELECT * FROM EMPLOYEE_DATA
LEFT JOIN DEPT ON EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO
WHERE LOC="DALLAS";

-- Select department name & location of all the employees working for CLARK.--

SELECT DEPTNO,JOB,DEPT_NAME,LOC FROM EMPLOYEE_DATA
LEFT JOIN DEPT ON EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO
WHERE JOB="CLERK";

-- Select all the departmental information for all the managers --
USE HR;
SELECT * FROM DEPT;

SELECT DEPT_NO,DEPT_NAME,JOB,SAL FROM EMPLOYEE_DATA
LEFT JOIN DEPT ON EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO
WHERE JOB="MANAGER";

-- Display the first maximum salary.--

SELECT EMPNO,ENAME,JOB,MAX(SAL) FROM EMPLOYEE_DATA;

SELECT *, MAX(SAL) FROM EMPLOYEE_DATA LIMIT 1;

SELECT * FROM EMPLOYEE_DATA ORDER BY SAL DESC;

SELECT EMPNO,ENAME,JOB, MAX(SAL) FROM EMPLOYEE_DATA;

-- Display the second maximum salary.--

SELECT EMPNO,SAL FROM EMPLOYEE_DATA E1
WHERE 1= (SELECT COUNT(DISTINCT SAL ) FROM EMPLOYEE_DATA E2
WHERE E2.SAL>E1.SAL);

SELECT *, MAX(SALARY) FROM EMPLOYEES;


-- Display the third maximum salary.--

SELECT EMPNO,SAL FROM EMPLOYEE_DATA E1
WHERE 2= (SELECT COUNT(DISTINCT SAL ) FROM EMPLOYEE_DATA E2
WHERE E2.SAL>E1.SAL);

-- Display all the managers & clerks who work in Accounts and Marketing departments. --

USE HR;
SELECT * FROM DEPT;

SELECT * FROM EMPLOYEE_DATA
LEFT JOIN DEPT ON EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO
WHERE JOB IN ("MANAGER","CLERK") AND DEPT_NAME IN ("ACCOUNTING");

-- Display all the salesmen who are not located at DALLAS.--

SELECT * FROM EMPLOYEE_DATA E
LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
WHERE JOB =("SALESMAN") AND LOC NOT IN ("DALLAS");

-- Get all the employees who work in the same departments as of SCOTT --

SELECT * FROM EMPLOYEE_DATA
WHERE ENAME="SCOTT";

SELECT EMPNO,DEPTNO,ENAME,JOB,DEPT_NAME FROM EMPLOYEE_DATA
LEFT JOIN DEPT ON EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO
WHERE DEPTNO =(SELECT DEPTNO FROM EMPLOYEE_DATA WHERE ENAME="SCOTT");

-- Select all the employees who are earning same as SMITH.--

SELECT EMPNO,ENAME,SAL FROM EMPLOYEE_DATA
WHERE SAL =(SELECT SAL FROM EMPLOYEE_DATA WHERE ENAME="SMITH");

-- Display all the employees who are getting some commission in marketing department where the employees have joined only on weekdays.--

SELECT * FROM EMPLOYEE_DATA;

SELECT *,WEEKDAY(HIREDATE) AS HD FROM EMPLOYEE_DATA E
LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
WHERE DEPT_NAME IN ("SALES") AND HD != (5,6);

SELECT * FROM DEPT;


SELECT *,WEEKDAY(HIREDATE) AS HD
 FROM EMPLOYEE_DATA;

SELECT * FROM EMPLOYEE_DATA E
LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
WHERE HIREDATE NOT IN (WEEKDAY(HIREDATE),5,6);


-- Display all the employees who are getting more than the average salaries of all the employees --

SELECT * FROM EMPLOYEE_DATA
WHERE SAL >(SELECT  AVG(SAL) FROM EMPLOYEE_DATA);

USE HR;
-- Select department name & location of all the employees working for CLARK.--

SELECT *, DEPT_NAME,LOC FROM EMPLOYEE_DATA E
LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
WHERE JOB="CLERK";

-- Select all the departmental information for all the managers --

SELECT * FROM EMPLOYEE_DATA E
LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
WHERE JOB ="MANAGER";

-- Select all the employees who work in DALLAS. --

 SELECT * FROM EMPLOYEE_DATA E
 LEFT JOIN DEPT D ON E.DEPTNO=D.DEPT_NO
 WHERE LOC ="DALLAS";

--  Delete the records from the DEPT table that don’t have matching records in EMP --

USE HR;
-- Display all the departmental information for all the existing employees and if a department has no employees display it as “No employees”. --

SELECT EMPNO,DEPTNO,ENAME,DEPT_NAME FROM EMPLOYEE_DATA 
FULL  JOIN DEPT  ON  EMPLOYEE_DATA.DEPTNO=DEPT.DEPT_NO;


USE HR;

SELECT * FROM EMPLOYEE_DATA;

SELECT * FROM EMPLOYEE_DATA
WHERE DEPTNO=(SELECT DEPTNO FROM EMPLOYEE_DATA WHERE ENAME="SCOTT");


SELECT E.EMPNO,E.ENAME,E.JOB,E.HIREDATE,E1.MGR,E1.HIREDATE AS MGR_HIREDATE FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA E1 ON E.MGR=E1.EMPNO
WHERE E1.HIREDATE < E.HIREDATE;

SELECT E.EMPNO,E.ENAME,E.SAL,E.MGR,E1.ENAME AS MGR_NAME,E1.SAL AS MGR_SAL FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA E1 ON E.EMPNO =E1.MGR
WHERE E.SAL > E1.SAL;


SELECT E.EMPNO,E.ENAME,E.SAL,E1.EMPNO,E1.ENAME,E1.SAL AS EMP_SAL FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA E1 ON E.EMPNO=E1.EMPNO
WHERE E.SAL =E1.SAL;


SELECT * FROM EMPLOYEE_DATA
WHERE SAL =(SELECT SAL FROM EMPLOYEE_DATA WHERE ENAME="SMITH");


SELECT E.EMPNO,E.ENAME,E.HIREDATE,E1.EMPNO AS MGR_NO,
E1.ENAME AS MGR_NAME,E1.HIREDATE AS MGR_HIREDATE FROM EMPLOYEE_DATA E
INNER JOIN EMPLOYEE_DATA E1 ON E.MGR=E1.EMPNO;

use hr;

use project;

drop table ant;

create table ant (
id int);

insert into ant values (1),
 (1),
 (2),
 (2),
 (null);

select * from ant;

create table bat(
id int);
insert into bat values (1),
(2),
(null);

select * from bat;

select a.id,b.id from ant a 
inner join bat b on a.id=b.id;

select a.id,b.id from ant a 
left join bat b on a.id=b.id;

select a.id,b.id from ant a 
right join bat b on a.id=b.id;

select a.id,b.id from ant a 
left join bat b on a.id=b.id
union
select a.id,b.id from ant a 
right join bat b on a.id=b.id;


use hr;

select * from employees;

select count(*) from employees;

select distinct employee_id from employees;

select * from dim_customer;

select customer_code,count(1)  from dim_customer
group by customer_code having count(1) > 1;


select * from dimcustomer;

select customerkey,count(1) from dimcustomer
group by customerkey having count(1) >1;

use hr;
select employee_id, count(1) from employees
group by employee_id having count(1) > 1;

select * from employees;

select * from employees where
department_id not in (select department_id  from departments);

select e.employee_id,e.first_name,e.salary,
d.department_id,d.department_name from employees e
left join departments d on e.department_id = d.department_id;

select * from (select employees.*, dense_rank() 
over(partition by department_id order by salary desc) as rn from employees) a
where rn =2;


select * from employees;

select e.employee_id,e.first_name,e.manager_id,e.salary,m.employee_id as mgr_id,
m.first_name as mgr_name,m.salary as mgr_salary from employees e
inner join employees m on e.manager_id = m.employee_id
where e.salary >m.salary;














