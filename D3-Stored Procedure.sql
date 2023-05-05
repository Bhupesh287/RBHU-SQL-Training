-----------------------------------------------------------------
---------------------STORED PROCEDURE----------------------------

--CREATING STORED PROC
CREATE PROCEDURE MyTestProcedure
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]

--CALL THE STORED PROC
EXECUTE MyTestProcedure

------------------------------------------------------------

--CREATING STORED PROC(By making NOCOUNT OFF)---in messages it will show how many rows affected
CREATE PROCEDURE MyTestProcedure2
AS
SET NOCOUNT OFF
SELECT * FROM [HumanResources].[Shift]

--CALL THE STORED PROC
EXECUTE MyTestProcedure2

------------------------------------------------------------

--Dropping Stored Proc
DROP PROC MyTestProcedure
DROP PROC MyTestProcedure2

---------------------------------------------------------------------
-------------------PARAMETERIZED STORED PROCEDURE--------------------

CREATE PROCEDURE MyFirstParamProcedure
@Parameter_name varchar(50)
AS
SET NOCOUNT OFF
SELECT * FROM [HumanResources].[Shift] where name = @Parameter_name

--CALL THE STORED PROC
EXECUTE MyFirstParamProcedure @Parameter_name='Day'

EXECUTE MyFirstParamProcedure 'Day'

EXECUTE MyFirstParamProcedure -------------------------------error

DROP PROC MyFirstParamProcedure

-------------------------------------------------------------------------
------------PASSING DEFAULT PARAMETER------------------------------------

CREATE PROCEDURE MyFirstParamProcedure1
@Parameter_name varchar(50)='Evening'
AS
SET NOCOUNT OFF
SELECT * FROM [HumanResources].[Shift] where name = @Parameter_name


--CALL THE STORED PROC

EXECUTE MyFirstParamProcedure1

EXECUTE MyFirstParamProcedure1 @Parameter_name='Day'

EXECUTE MyFirstParamProcedure1 'Day'

-------------------------------------------------------------------------------------
