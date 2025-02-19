@echo off

rem Usage: create_format_file.bat SERVER DB USER PASSWORD FILENAME OBJECT

echo Creating format file %5.fmt from %2.%6
bcp %2..%6 format nul -fFormatFiles\%5.fmt -S%1 -U%3 -P%4 -n
