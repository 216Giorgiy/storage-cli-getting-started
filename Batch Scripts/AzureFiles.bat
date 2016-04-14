rem Azure Storage File Sample - Demonstrates how to use the File Storage service.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786322
rem For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=786325

set AZURE_STORAGE_ACCOUNT=<Storage Account Name>
set AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

set share_name=demoshare
set directory_name=demodirectory
set file_name=AzureFiles.bat
set destination_file=DownloadedFile.bat
set source_path=demodirectory/%file_name%

echo "Creating the file share..."
call azure storage share create %share_name%

echo "Creating the directory..."
call azure storage directory create %share_name% %directory_name%

echo "Uploading the file..."
call azure storage file upload %file_name% %share_name% %directory_name%

echo "Listing the files and directories..."
call azure storage file list %share_name%
call azure storage file list %share_name% %directory_name%

echo "Downloading the file..."
call azure storage file download %share_name% %source_path% %destination_file%

echo "Deleting the share..."
call azure storage share delete %share_name%

echo "Deleting the downloaded file..."
del %destination_file%

echo "Done"
