@echo off

rem Usage: bcpout.bat SERVER DB USER PASSWORD OBJECT

echo Exporting %5
bcp %2..%5 out DataFiles\%5.bcp -fFormatFiles\%5.fmt -S%1 -U%3 -P%4
