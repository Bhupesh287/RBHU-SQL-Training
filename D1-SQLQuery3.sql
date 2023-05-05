use [AdventureWorks2012]
select * from [HumanResources].[Department]

--SHOW ME ALL THE DEPARTMENTS
select name from [HumanResources].[Department]

--SHOW ME ALL THE GroupNmaes
select GroupName from [HumanResources].[Department]

--SHOW ME ALL THE DISTINCT GroupNames
select distinct groupname from [HumanResources].[Department]

--SHOW ALL THE DEPARTMENT NAMES WHO ARE A PART OF MANUFACTURING
select name,groupname from [HumanResources].[Department] where groupname like 'Manufacturing'


--GIVE ME ALL THE EMPLOYEES FROM EMPLOYEE TABLE
select * from [HumanResources].[Employee]

--GIVE ME ALL THE EMPLOYEES WHO HAVE A ORGLEVEL=2
select * from [HumanResources].[Employee] where OrganizationLevel = 2

--GIVE ME ALL THE EMPLOYEES WHO HAVE A ORGLEVEL = 2 or 3
select * from [HumanResources].[Employee] where OrganizationLevel IN(2,3)

--GIVE ME LIST OF EMPLOYEES WHO HAS JOBTITLE FACILITIES MANAGER
select * from [HumanResources].[Employee] where JobTitle like 'FACILITIES MANAGER'

--GIVE ME ALL THE EMPLOYEES WHO HAVE MANAGER WORD IN THEIR TITLE
select * from [HumanResources].[Employee] where JobTitle like '%manager%'

--GIVE ME ALL THE EMPLOYEES WHO ARE BORN AFTER JAN 1 1980
select * from [HumanResources].[Employee] where BirthDate > '1/1/1980'

--GIVE ME ALL THE EMPLOYEES WHO ARE BORN BETWEEN JAN 1 1970 AND JAN 1 1980
select * from [HumanResources].[Employee] where BirthDate between '1/1/1970' and '1/1/1980'



select * from [Production].[Product]

--CALCULATED COLUMN
select name, listprice from [Production].[Product]
select name, listprice, listprice + 10 as adjusted_listprice from [Production].[Product]

--INTO--CREATING NEW TABLE FROM EXISTING ONE TO STORE RESULT
select name, listprice, listprice + 10 as adjusted_listprice into [Production].[Product_2] from [Production].[Product]
select * from [Production].[Product_2]

--TEMPORARY TABLE
select name, listprice, listprice + 10 as adjusted_listprice into #temptable from [Production].[Product]
select * from #temptable

--DELETE
delete from [Production].[Product_2] where name like 'Bearing ball'
select * from [Production].[Product_2]

--UPDATE
update [Production].[Product_2] set name='Adj race' where name like 'adjustable race'
select * from [Production].[Product_2]