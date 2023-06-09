/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Sales].[SalesTerritory]

------------------------------------------------------------------
-------------------VIEW-------------------------------------------

--VIEW

CREATE VIEW MyCustomView AS
SELECT * FROM [AdventureWorks2012].[Sales].[SalesTerritory] 
WHERE CountryRegionCode like 'US' 

SELECT * FROM MyCustomView

-----------------------------------------------------------------------
------------------------TRIGGER----------------------------------------

SELECT * FROM [HumanResources].[Shift]

CREATE TRIGGER Demo_TRIGGER
ON [HumanResources].[Shift]
AFTER INSERT
AS
BEGIN
PRINT 'INSERT IS NOT ALLOWED, YOU NEED APPROVAL'
ROLLBACK TRANSACTION
END
GO


--TEST THE TRIGGER

INSERT INTO [HumanResources].[Shift] 
([Name],[StartTime],[EndTime],[ModifiedDate])
VALUES('BHUPESH','15:00:00.0000000','22:00:00.0000000',GETDATE())


SELECT * FROM [HumanResources].[Shift]

------------------------------------------------------------------------------
------------------DATABASE LEVEL TRIGGER--------------------------------------

CREATE TRIGGER Demo_DBLevel_TRIGGER
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
PRINT 'CREATION OF NEW TABLES NOT ALLOWED'
ROLLBACK TRANSACTION
END
GO

--TEST THE TRIGGER
CREATE TABLE DEMOCREATETABLE(COL1 VARCHAR(10))

-----------------------------------------------------------------------