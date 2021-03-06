CREATE OR ALTER PROCEDURE Game.DropTables
AS
/***************************************************************************************************
File: DropTables.sql
----------------------------------------------------------------------------------------------------
Procedure:      Game.DropTables
Create Date:    2021-02-01 
Author:         Sorob Cyrus
Description:    Drops all Game Tables  
Call by:        TBD, UI, Add hoc
Steps:          NA
Parameter(s):   None
Usage:          EXEC Game.DropTables
****************************************************************************************************
SUMMARY OF CHANGES
Date			Author				Comments 
------------------- ------------------- ------------------------------------------------------------
****************************************************************************************************/
SET NOCOUNT ON;

DECLARE @ErrorText VARCHAR(MAX),      
        @Message   VARCHAR(255),   
        @StartTime DATETIME,
        @SP        VARCHAR(50),
        @SQL       NVARCHAR(MAX);

BEGIN TRY;   
SET @ErrorText = 'Unexpected ERROR in setting the variables!';

SET @SQL = SPACE(0);
SET @SP = OBJECT_NAME(@@PROCID);
SET @StartTime = GETDATE();    
SET @Message = 'Started SP ' + @SP + ' at ' + FORMAT(@StartTime , 'MM/dd/yyyy HH:mm:ss');   
RAISERROR (@Message, 0,1) WITH NOWAIT;

-------------------------------------------------------------------------------
SET @ErrorText = 'Failed dropping tables.';

SELECT @SQL += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'Game';

EXECUTE sp_executesql @SQL;

SET @Message = 'Completed dropping tables.';
RAISERROR(@Message, 0,1) WITH NOWAIT;
-------------------------------------------------------------------------------

SET @Message = 'Completed SP ' + @SP + '. Duration in Seconds:  '   
   + CONVERT(VARCHAR(12), CONVERT(DECIMAL(6,2),datediff(S, @StartTime, getdate()))); 
RAISERROR(@Message, 0,1) WITH NOWAIT;

END TRY

BEGIN CATCH;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

	SET @ErrorText = 'Error: '+CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),'NULL'))      
					  +', Severity = '+CONVERT(VARCHAR,ISNULL(ERROR_SEVERITY(),'NULL'))      
					  +', State = '+CONVERT(VARCHAR,ISNULL(ERROR_STATE(),'NULL'))      
					  +', Line = '+CONVERT(VARCHAR,ISNULL(ERROR_LINE(),'NULL'))      
					  +', Procedure = '+CONVERT(VARCHAR,ISNULL(ERROR_PROCEDURE(),'NULL'))      
					  +', Server Error Message = '+CONVERT(VARCHAR(100),ISNULL(ERROR_MESSAGE(),'NULL'))      
					  +', SP Defined Error Text = '+@ErrorText;

	THROW 66000, @ErrorText, 1;

END CATCH;      

