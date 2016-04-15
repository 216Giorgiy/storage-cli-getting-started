rem Azure Storage Blob Sample - Demonstrates how to use the Blob Storage service.
rem Blob storage stores unstructured data such as text, binary data, documents or media files.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786322
rem For Cmdlet reference, see http://go.microsoft.com/fwlink/?LinkId=786325

rem Provide the name of your Storage account.
set AZURE_STORAGE_ACCOUNT=<Storage Account Name>

rem Provide your Storage account key.
set AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

rem Provide a name for your new container.
set container_name=<Container Name>

rem Provide a name for your new blob.
set blob_name=<Blob Name>

rem Provide the full path to a file you want to upload.
set file_to_upload=<C:\full\path\to\file>

rem Provide the full path to a directory you wish to use for downloaded blobs.
set destination_folder=<C:\DownloadedImages>

echo "1. Create a new container."
call azure storage container create %container_name%

echo "2. Upload a blob into a container."
call azure storage blob upload %file_to_upload% %container_name% %blob_name%

echo "3. List all blobs in a container."
call azure storage blob list %container_name%

echo "4. List all blobs in a container (json)."
call azure storage blob list --json %container_name%

echo "5. Download blob."
call azure storage blob download %container_name% %blob_name% %destination_folder%

echo "6. Delete container"
call azure storage container delete %container_name%

echo "Done"
