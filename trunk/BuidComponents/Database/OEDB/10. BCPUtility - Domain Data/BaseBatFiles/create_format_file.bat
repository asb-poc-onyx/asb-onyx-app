@echo off

rem Usage: create_format_file.bat SERVER DB USER PASSWORD OBJECT

echo Creating format file for: %5
bcp %2..%5 format nul -fFormatFiles\%5.fmt -S%1 -U%3 -P%4 -n
