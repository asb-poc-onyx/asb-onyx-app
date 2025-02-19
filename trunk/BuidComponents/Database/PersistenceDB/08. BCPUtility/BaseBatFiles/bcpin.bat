@echo off

rem Usage: bcpin.bat SERVER DB USER PASSWORD OBJECT

echo Importing %5
bcp %2..%5 in DataFiles\%5.bcp -fFormatFiles\%5.fmt -S%1 -U%3 -P%4 -E
