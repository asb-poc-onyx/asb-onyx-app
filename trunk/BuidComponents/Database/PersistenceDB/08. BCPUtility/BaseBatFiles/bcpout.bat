@echo off

rem Usage: bcpout.bat SERVER DB USER PASSWORD FILENAME OBJECT

echo Exporting %2.%6 to filename %5.bcp
bcp %2..%6 out DataFiles\%5.bcp -fFormatFiles\%5.fmt -S%1 -U%3 -P%4
