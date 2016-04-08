rem Azure Storage Blob Sample - Demonstrates how to use the Blob Storage service.
rem Blob storage stores unstructured data such as text, binary data, documents or media files.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786321
rem For Cmdlet reference, see http://go.microsoft.com/fwlink/?LinkId=786320

rem Provide the name of your Storage account.
call AZURE_STORAGE_ACCOUNT=<StorageAccountName>

rem Provide the name of your Storage account.
set AZURE_STORAGE_ACCESS_KEY=<StorageAccountKey>

rem Provide a name for your new container.
set ContainerName=<ContainerName>

rem Provide a name for your new blob
set BlobName=<BlobName>

rem Provide the full path to a file you want to upload.
set FileToUpload=<C:\full\path\to\file>

rem Provide the full path to a directory you wish to use for downloaded blobs.
set DestinationFolder=<C:\DownloadedImages>
mkdir %DestinationFolder%

rem 1. Create a new container.
call azure storage container create %ContainerName%

rem 2. Upload a blob into a container.
call azure storage blob upload %FileToUpload% %ContainerName% %BlobName%

rem 3. List all blobs in a container.
call azure storage container list %ContainerName%

rem 4. Download blob:
call azure storage blob download %ContainerName% %BlobName% %DestinationFolder%

rem 5. Delete blob
call azure storage blob delete %ContainerName% %BlobName%
