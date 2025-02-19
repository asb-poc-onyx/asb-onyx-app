@echo off

setlocal

set SERVER="10.99.8.131,59730"
set DB=devCCMv7_01
set SERVERpersistence="10.99.8.131,59730"
set DBpersistence=devCCMv7_persistanceDB_01
set USER=OnyxDBO
set PWD=onyx


rem ###########################################################################################################################################################################
rem 
rem Reference Tables from persistenceDB
rem
rem ###########################################################################################################################################################################


rem Actions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButton 		ActionButton
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionButtonMl 	ActionButtonMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroup 		ActionGroup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionGroupMl 		ActionGroupMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfile 	ActionListProfile
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% ActionListProfileMl 	ActionListProfileMl

rem Broker

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% Broker 		Broker

rem End Points

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPoint 		EndPoint
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointProperty 	EndPointProperty
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointPropertyName 	EndPointPropertyName
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointType 		EndPointType
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EndPointTypeMl 	EndPointTypeMl
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% EntityGroupMapper 	EntityGroupMapper

rem LBO

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboObject 		LboObject
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% LboPropertyMapper 	LboPropertyMapper

rem Navigator Configuration

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master 		navigator_entity_field_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_field_master_ml 	navigator_entity_field_master_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master 		navigator_entity_master
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_entity_master_ml 		navigator_entity_master_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_object_type 			navigator_object_type

rem Navigator Operators

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator 			navigator_operator
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_operator_ml 			navigator_operator_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% navigator_property_master 		navigator_property_master

rem Transactions

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_log_type 	transaction_log_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVERpersistence% %DBpersistence% %USER% %PWD% transaction_type 	transaction_type


rem ###########################################################################################################################################################################
rem
rem Reference Tables from OEAS
rem
rem ###########################################################################################################################################################################

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% country 			country 
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% country_ml 		country_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% incident_product		incident_product	
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% incident_product_ml	incident_product_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% reference_field		reference_field
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% reference_field_ml	reference_field_ml	
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% reference_lookup		reference_lookup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% reference_parameter	reference_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% reference_parameter_ml	reference_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% region			region
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% region_ml			region_ml

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_format_file.bat %SERVER% %DBpersistence% %USER% %PWD% users			users

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

