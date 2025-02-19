@echo off

setlocal

set SERVER="pccu-onyx-dev-l,59730"
set DB=devCCMv7_03
set USER=OnyxDBO
set PWD=onyx

echo SERVER %SERVER%
echo DB     %DB%
echo USER   %USER%
echo PWD    %PWD%

rem Drop all foreign keys
echo IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVER% %DB% %USER% %PWD% 
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVER% %DB% %USER% %PWD% 


echo ...
echo GRANDPARENT ERRORLEVEL is %ERRORLEVEL%
echo ...
echo Recreate all foreign keys
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_foreign_keys.bat %SERVER% %DB% %USER% %PWD%
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