# Azure Storage File Sample - Demonstrates how to use the File Storage service.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=785077
# For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=785079

export AZURE_STORAGE_ACCOUNT=<Storage Account Name>
export AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>
export share_name=demoshare
export directory_name=demodirectory
export file_name=AzureFiles.sh
export destination_file=DownloadedFile.sh
export source_path=demodirectory/$file_name
echo "Creating the file share..."
azure storage share create $share_name
echo "Creating the directory..."
azure storage directory create $share_name $directory_name
echo "Uploading the file..."
azure storage file upload $file_name $share_name $directory_name
echo "Listing the files and directories..."
azure storage file list $share_name
azure storage file list $share_name $directory_name
echo "Downloading the file..."
azure storage file download $share_name $source_path $destination_file
echo "Deleting the share..."
azure storage share delete $share_name
echo "Deleting the downloaded file..."
rm $destination_file
echo "Resetting environment variables..."
export AZURE_STORAGE_ACCOUNT=
export AZURE_STORAGE_ACCESS_KEY=
export share_name=
export directory_name=
export file_name=
export destination_file=
export source_path=
echo "Done"
