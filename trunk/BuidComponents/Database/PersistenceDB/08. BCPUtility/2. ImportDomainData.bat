@echo off

setlocal

set SERVER="10.99.8.144,51379"
set DB=tstCCMv7_01
set SERVERpersistence="10.99.8.144,51379"
set DBpersistence=tstCCMv7_persistanceDB_01
set USER=OnyxDBO
set PWD=onyx

rem ###########################################################################################################################################################################
rem 
rem Reference Tables from persistenceDB
rem
rem ###########################################################################################################################################################################


rem Drop all foreign keys
echo IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% 
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% 

rem Actions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButton
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButtonMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroupMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfile
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfileMl

rem Broker

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% Broker

rem End Points

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPoint
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointProperty
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointPropertyName
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointType
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointTypeMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EntityGroupMapper

rem LBO

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboObject
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboPropertyMapper

rem Navigator Configuration

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_object_type

rem Navigator Operators

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_property_master

rem Transactions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_log_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_type

rem Domain Data from OEAS

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% country
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% country_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% incident_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% incident_product_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_field
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_field_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_lookup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% region
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% region_ml


rem Actions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButton
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButtonMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroupMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfile
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfileMl

rem Broker

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% Broker

rem End Points

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPoint
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointProperty
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointPropertyName
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointType
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointTypeMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EntityGroupMapper

rem LBO

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboObject
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboPropertyMapper

rem Navigator Configuration

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_object_type

rem Navigator Operators

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_property_master

rem Transactions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_log_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_type

rem Domain Data from OEAS

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% country
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% country_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% incident_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% incident_product_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_field
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_field_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_lookup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% reference_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% region
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% region_ml

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% users




echo ...
echo GRANDPARENT ERRORLEVEL is %ERRORLEVEL%
echo ...
rem Recreate all foreign keys
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_foreign_keys.bat %SERVERpersistence% %DBpersistence% %USER% %PWD%

echo ...
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