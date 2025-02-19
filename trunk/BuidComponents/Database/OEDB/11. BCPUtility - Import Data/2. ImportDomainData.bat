@echo off

setlocal

set SERVER=PCCU-ONYX-DEV-l
set DB=uatCCMv7_01
set USER=OnyxDBO
set PWD=onyx

echo SERVER %SERVER%
echo DB     %DB%
echo USER   %USER%
echo PWD    %PWD%

rem Truncate all tables that are to be fully loaded
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_customer_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_customer
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_choice_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_insurance
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_member_plan
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_holding
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_microsegmentation

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_applicant
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_application

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate_map

rem Load data into tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_customer_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_customer
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_choice_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_insurance
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_member_plan
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_holding
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_microsegmentation

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_applicant
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_application

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate_map


echo GRANDPARENT ERRORLEVEL is %ERRORLEVEL%
echo ...

IF ERRORLEVEL 1 (goto ERROR_EXIT)  

endlocal

pause
exit 0

:ERROR_EXIT
echo ERROR 
echo . 
echo Error experienced with last step. 
echo .
echo Error Level is %ERRORLEVEL%
echo Please investigate
pause
exit 1