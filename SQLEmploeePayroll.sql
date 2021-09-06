--UC1 create a new database and use 
Create Database payroll_services
use payroll_services
--UC2 create a table of employee that has column of Id,name,salary,startdate.
create table employee_payroll (Id int identity (1,1) Primary key , name varchar(50) , salary decimal(12,2) Not Null , start datetime Not Null) 
select * from  employee_payroll
--UC3 Ability to create employee payroll data in the payroll service database as part of CURD Operation.
insert into employee_payroll(name, salary, start) VALUES
('Bill', 1000000.00, '2021-09-04'),
('Terisha', 2000000.00, '2021-09-04'),
('Charlie', 3000000.00, '2021-09-04')
--UC4 Ability to retrieve all the employee payroll data that isadded to payroll service database.
select * from employee_payroll
--UC5 Ability to retrieve salary data for a particularemployee as well as all employees who havejoined in a particular data range from thepayroll service database.
select salary from employee_payroll where name = 'Bill' 
select salary from employee_payroll WHERE start BETWEEN CAST('2021-01-01' AS DATE) AND GETDATE()
--UC6 Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add gender varchar(1)
select * from  employee_payroll
UPDATE employee_payroll set gender ='M' where name = 'Bill' or name ='Charlie'
update employee_payroll set gender = 'F' where name ='Terisha'
select * from employee_payroll
--UC7 Ability to find sum, average, min, maxand number of male and female employees
select AVG(salary) from employee_payroll where gender = 'M' GROUP BY gender 
select AVG(salary) from employee_payroll where gender = 'F' Group BY gender
select gender , sum(salary) from employee_payroll GROUP by gender
select gender , min(salary) from employee_payroll GROUP by gender
select gender , max(salary) from employee_payroll GROUP by gender
select * from  employee_payroll
--UC8 Ability to extend employee_payroll data to store employee information like employee phone, address and department - Ensure employee department is non
alter table employee_payroll add phone varchar(250)
alter table employee_payroll add address varchar(250)
alter table employee_payroll add department varchar(150) NOT NULL default 'dep'
alter table employee_payroll add default 'TBD' for address
update employee_payroll set address ='TBD'
select * from employee_payroll
--UC9 Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
--sp_rename 'employee_payroll.salary' , 'basic_pay'
alter table employee_payroll add deduction Decimal(12,2) NOT NULL default 0
alter table employee_payroll add taxable_pay Decimal(12,2) NOT NULL default 0
alter table employee_payroll add tax Decimal(12,2) NOT NULL default 0
alter table employee_payroll add net_pay Decimal(12,2) NOT NULL default 0
select * from  employee_payroll
--UC10 Ability to add Terisha has another department 
INSERT INTO employee_payroll(name, department, gender, salary , deduction, taxable_pay, tax, net_pay, start) VALUES
('Terisha', 'Marketting', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2018-01-03' )
select * from  employee_payroll where name = 'Terisha' 
select * from  employee_payroll




