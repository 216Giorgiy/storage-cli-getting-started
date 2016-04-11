rem Azure Queue Service Sample - The Queue Service provides reliable messaging for workflow processing and for communication
rem between loosely coupled components of cloud services. This sample demonstrates how to perform common tasks including
rem creating, listing, and deleting queues.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786321
rem For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=785079

rem Provide the name of your Storage account.
set AZURE_STORAGE_ACCOUNT=<StorageAccountName>

rem Provide the name of your Storage account.
set AZURE_STORAGE_ACCESS_KEY=<StorageAccountKey>

rem Provide a name for your new queue.
set queue_name=<Queue Name>

rem 1. Create a new queue.
call azure storage queue create %queue_name%

rem 2. Show details of the queue.
call azure storage queue show %queue_name%

rem 3. List all queues.
call azure storage queue list --prefix *

rem 4. Remove queue
call azure storage queue delete %queue_name%
