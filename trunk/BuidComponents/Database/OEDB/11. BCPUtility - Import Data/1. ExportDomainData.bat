@echo off

setlocal

set SERVER=PCCU-ONYX-DEV-l
set DB=devCCMv7_DataImport
set USER=OnyxDBO
set PWD=onyx

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_customer_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_customer
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_choice_account
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_insurance
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_member_plan
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_product_holding
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_microsegmentation

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_applicant
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_loan_application

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_fee_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpout.bat %SERVER% %DB% %USER% %PWD% ct_import_product_credit_rate_map

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
