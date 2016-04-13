#!/usr/bin/env bash

# Azure Storage File Sample - Demonstrates how to use the File Storage service.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=785077
# For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=785079

# Provide the name of your Storage account.
export AZURE_STORAGE_ACCOUNT=<Storage Account Name>

# Provide your Storage account key.
export AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

# Provide a name for your new share
share_name=<Share Name>

# Provide a name for you new directory
directory_name=<Directory Name>

# Provide the full path to the file you want to upload.
full_path_to_file=</full/path/to/file>

# Provide the name of the file. NOTE: This should be an exact match to the file name you've provided in full_path_to_file.
file_name=<File Name>

# Provide the full path for a new local directory
destination_path=<~/DownloadedFiles>
mkdir $destination_path

printf "\n1. Create a new share.\n"
azure storage share create $share_name

printf "\n2. Create a new directory within the share.\n"
azure storage directory create $share_name $directory_name

printf "\n3. Upload new file into directory.\n"
azure storage file upload $full_path_to_file $share_name $directory_name

printf "\n4. List contents within share.\n"
azure storage file list $share_name

printf "\n5. List contents within directory.\n"
azure storage file list $share_name $directory_name

printf "\n.6 Download the file.\n"
source_path=$directory_name/$file_name
azure storage file download $share_name $source_path $destination_path

printf "\n7. Delete the share.\n"
azure storage share delete $share_name

# Remove environment variables
unset AZURE_STORAGE_ACCOUNT
unset AZURE_STORAGE_ACCESS_KEY

printf "\nDone\n\n"
