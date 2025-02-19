@echo off

echo Dropping foreign keys
echo sqlcmd -S%1 -d%2 -U%3 -P%4 -iOnyxKeyScripts\drop_foreign_keys.sql
sqlcmd -S%1 -d%2 -U%3 -P%4 -iOnyxKeyScripts\drop_foreign_keys.sql
