SELECT * FROM [Sales].[SalesTerritory]

------------------------------------------------------------------------------------------------------
-----------------------------USER DEFINED FUNCTIONS---------------------------------------------------

--CREATING FUNCTION (Which Returns Scalar value)

CREATE FUNCTION YTDSALES()
RETURNS MONEY
AS
BEGIN
DECLARE @YTDSALES MONEY
SELECT @YTDSALES=SUM(SALESYTD) FROM [Sales].[SalesTerritory]
RETURN @YTDSALES
END

--EXECUTION OF FUNCTION
DECLARE @YTDRESULTS AS MONEY
SELECT @YTDRESULTS = DBO.YTDSALES()
PRINT @YTDRESULTS


DROP FUNCTION YTDSALES

---------------------------------------------------------------------------------
------------------------PARAMETERIZED FUNCTIONS----------------------------------

SELECT * FROM [Sales].[SalesTerritory]

--CREATING FUNCTION (Which does Sum of Sales by Group Name passed by user)

CREATE FUNCTION YTD_GROUP(@GROUP VARCHAR(50))
RETURNS MONEY
AS
BEGIN
DECLARE @YTDSALES MONEY
SELECT @YTDSALES=SUM(SALESYTD) FROM [Sales].[SalesTerritory] WHERE [Group] = @GROUP
RETURN @YTDSALES
END

--EXECUTION OF FUNCTION
DECLARE @RESULTS AS MONEY
SELECT @RESULTS = DBO.YTD_GROUP('Europe')
PRINT @RESULTS

DROP FUNCTION YTD_GROUP

-----------------------------------------------------------------------------------
---------------------FUNCTION RETURNING TABLE--------------------------------------

SELECT * FROM Sales.SalesTerritory

--CREATING FUNCTION (Which returns table)

CREATE FUNCTION TABFUNC(@TerritoryID INT)
RETURNS TABLE 
AS 
RETURN SELECT * FROM SALES.SalesTerritory WHERE TerritoryID= @TerritoryID


--EXECUTION OF FUNCTION

SELECT * FROM [dbo].[TABFUNC](7)

DROP FUNCTION TABFUNC

-----------------------------------------------------------------------------------------------------------