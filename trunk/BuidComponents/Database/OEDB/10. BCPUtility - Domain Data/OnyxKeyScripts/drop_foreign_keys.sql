/*
** Purpose: Drop all foreign keys.
**
** @Rm++
**
** Revision History
** ---------------------------------------------------------------------------
** Date        Name     Description
** ---------------------------------------------------------------------------
** 04/28/2006  KeithK   Created based on DMT drop constraint sproc.
**
** @Rm--
*/
DECLARE @constraint_statement NVARCHAR(4000),
        @error                INT,
        @return_code          INT

-- drop foreign keys and unique constraints
DECLARE constraint_cursor CURSOR FOR
   SELECT 'ALTER TABLE ' + sot.name + ' DROP CONSTRAINT ' + sof.name
     FROM sysobjects sof
     JOIN sysobjects sot
       ON sof.parent_obj = sot.id
    WHERE sof.xtype      IN ('F')
    ORDER BY sof.xtype, sot.name, sof.name

SET @return_code = 0

OPEN constraint_cursor

FETCH NEXT FROM constraint_cursor INTO @constraint_statement

WHILE (@@fetch_status <> -1)
BEGIN 
   IF (@@fetch_status <> -2)
   BEGIN

      -- Execute the constraint statement
      EXEC (@constraint_statement)

      -- Check for errors on statement
      SET @error = @@error
      IF @error > 0 SET @return_code = 1

      IF @return_code > 0 BREAK

      FETCH NEXT FROM constraint_cursor INTO @constraint_statement
   END
END 

CLOSE constraint_cursor

DEALLOCATE constraint_cursor
   


