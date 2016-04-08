REM Azure Storage Blob Sample - Demonstrate how to use the Blob Storage service.
REM Blob storage stores unstructured data such as text, binary data, documents or media files.
REM Blobs can be accessed from anywhere in the world via HTTP or HTTPS.

REM Provide the name of your Storage account.
set AZURE_STORAGE_ACCOUNT=<StorageAccountName>

REM Provide the name of your Storage account.
set AZURE_STORAGE_ACCESS_KEY=<StorageAccountKey>

REM Provide a name for your new container.
set ContainerName=<ContainerName>

REM Provide a name for your new blob
set BlobName=<BlobName>

REM Provide the full path to a file you want to upload.
set FileToUpload=<C:\full\path\to\file>

REM Provide the full path to a directory you wish to use for downloaded blobs.
set DestinationFolder=<C:\DownloadedImages>
mkdir %DestinationFolder%

REM 1. Create a new container.
CALL azure storage container create %ContainerName%

REM 2. Upload a blob into a container.
CALL azure storage blob upload %FileToUpload% %ContainerName% %BlobName%

REM 3. List all blobs in a container.
CALL azure storage container list %ContainerName%

REM 4. Download blob:
CALL azure storage blob download %ContainerName% %BlobName% %DestinationFolder%

REM 5. Delete blob
REM CALL azure storage blob delete %ContainerName% %BlobName%
