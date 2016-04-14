rem Azure Table Service Sample - Demonstrates how to perform common tasks using the Microsoft Azure Table storage
rem including creating, listing, and deleting tables.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786322
rem For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=786325

rem Provide the name of your Storage account.
set AZURE_STORAGE_ACCOUNT=<StorageAccountName>

rem Provide your Storage account key.
set AZURE_STORAGE_ACCESS_KEY=<StorageAccountKey>

rem Provide a name for your new table.
set table_name=<Table Name>

rem 1. Create a new table.
call azure storage table create %table_name%

rem 2. List all tables.
call azure storage table list %table_name%

rem 3. Remove table
call azure storage table delete %table_name%

echo "Done"
