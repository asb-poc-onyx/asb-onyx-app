@echo off

echo Creating standard foreign keys sqlcmd -S%1 -d%2 -U%3 -P ... -iOnyxKeyScripts\persistenceDB_create_standard_foreign_keys.sql
sqlcmd -S%1 -d%2 -U%3 -P%4 -iOnyxKeyScripts\persistenceDB_create_standard_foreign_keys.sql

echo Creating custom foreign keys
cd "..\02. Foreign Keys"
for /r %%f in (*.sql) do sqlcmd -S%1 -d%2 -U%3 -P%4 -i"%%f"
