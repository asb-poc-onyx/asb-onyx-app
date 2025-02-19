@echo off

rem Usage: bcpout_query.bat SERVER DB USER PASSWORD OBJECT QUERY

echo Exporting %5 using query: %6
bcp %6 queryout DataFiles\%5.bcp -fFormatFiles\%5.fmt -S%1 -U%3 -P%4
