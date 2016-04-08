@REM Azure Storage File Sample - Demonstrate how to use the File Storage service.
@REM For documentation, refer to: "http://go.microsoft.com/fwlink/?LinkId=785084"
@REM For "how to install Azure CLI", refer to: "http://go.microsoft.com/fwlink/?LinkId=785093"

SET AZURE_STORAGE_ACCOUNT=<Storage Account Name>
SET AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

SET share_name=demoshare
SET directory_name=demodirectory
SET file_name=AzureFiles.bat
SET destination_file=DownloadedFile.bat
SET source_path=demodirectory/%file_name%

echo "Creating the file share..."
azure storage share create %share_name%

echo "Creating the directory..."
azure storage directory create %share_name% %directory_name%

echo "Uploading the file..."
azure storage file upload %file_name% %share_name% %directory_name%

echo "Listing the files and directories..."
azure storage file list %share_name% 
azure storage file list %share_name% %directory_name%

echo "Downloading the file..."
azure storage file download %share_name% %source_path% %destination_file%

echo "Deleting the share..."
azure storage share delete %share_name%

echo "Deleting the downloaded file..."
del %destination_file%


echo "Resetting environment variables..."
SET AZURE_STORAGE_ACCOUNT= 
SET AZURE_STORAGE_ACCESS_KEY=
SET share_name=
SET directory_name=
SET file_name=
SET destination_file=
SET source_path=

echo "Done"
