
---------------------------TRANSACTIONS------------------------------------------
SELECT * FROM [Sales].[SalesTerritory]

BEGIN TRANSACTION
     UPDATE [Sales].[SalesTerritory] SET CostYTD=1.00 WHERE TerritoryID=1
COMMIT TRANSACTION

SELECT * FROM [Sales].[SalesTerritory]

---------------------------------------------------------------------------------
--@@error (0 means success , >0 means error)

DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
INSERT INTO [Sales].[SalesTerritory]
           ([Name],[CountryRegionCode],[Group],[SalesYTD],[SalesLastYear],[CostYTD],[CostLastYear],[rowguid],[ModifiedDate])
     VALUES
           ('Bhupesh','US','IND',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF5',GETDATE())

SET @ERRORRESULTS= @@ERROR

IF (@ERRORRESULTS=0)
BEGIN
     PRINT 'SUCCEEDS....'
     COMMIT TRANSACTION
END
ELSE
BEGIN
     PRINT 'STATEMENT FAILED...'
	 ROLLBACK TRANSACTION
END


SELECT * FROM [Sales].[SalesTerritory]

------------------------------------------------------------------------------------------
--Custom error message

DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
INSERT INTO [Sales].[SalesTerritory]
           ([Name],[CountryRegionCode],[Group],[SalesYTD],[SalesLastYear],[CostYTD],[CostLastYear],[rowguid],[ModifiedDate])
     VALUES
           ('Bhupesh','US','IND',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF5',GETDATE())

SET @ERRORRESULTS= @@ERROR

IF (@ERRORRESULTS=0)
BEGIN
     PRINT 'SUCCEEDS....'
     COMMIT TRANSACTION
END
ELSE
BEGIN
     RAISERROR('STATEMENT FAILED- THIS IS MY CUSTOM MESSAGE',17,2)
	 ROLLBACK TRANSACTION
END

-------------------------------------------------------------------------------------
--TRY AND CATCH

BEGIN TRY
  BEGIN TRANSACTION
  DECLARE @ERRORRESULTS VARCHAR(50)
  BEGIN TRANSACTION
  INSERT INTO [Sales].[SalesTerritory]
           ([Name],[CountryRegionCode],[Group],[SalesYTD],[SalesLastYear],[CostYTD],[CostLastYear],[rowguid],[ModifiedDate])
     VALUES
           ('Bhupesh','US','IND',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF5',GETDATE())
  COMMIT TRANSACTION
END TRY

BEGIN CATCH
  PRINT 'CATCH STATEMENT ENTERED'
  ROLLBACK TRANSACTION
END CATCH

-------------------------------------------------------------------------------------------

