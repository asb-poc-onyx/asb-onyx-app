@echo off

rem Usage: truncate_table.bat SERVER DB USER PASSWORD OBJECT

echo Executing query: %5
sqlcmd -S%1 -d%2 -U%3 -P%4 -Q %5
