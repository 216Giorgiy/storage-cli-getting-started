#!/usr/bin/env bash

# Azure Storage Blob Sample - Demonstrates how to use the Blob Storage service.
# Blob storage stores unstructured data such as text, binary data, documents or media files.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786321
# For Cmdlet reference, see http://go.microsoft.com/fwlink/?LinkId=786320

# Provide the name of your Storage account.
export AZURE_STORAGE_ACCOUNT=<Storage Account Name>

# Provide your Storage account key.
export AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

# Provide a name for your new container.
container_name=<Container Name>

# Provide a name for your new blob.
blob_name=<Blob Name>

# Provide the full path to a file you want to upload.
file_to_upload=</full/path/to/file>

# Provide the full path to a directory you wish to use for downloaded blobs.
destination_folder=<~/DownloadedBlobs>
mkdir $destination_folder

printf "\n1. Create a new container.\n"
azure storage container create $container_name

printf "\n2. Upload a blob into a container.\n"
azure storage blob upload $file_to_upload $container_name $blob_name

printf "\n3. List all blobs in a container.\n"
azure storage blob list $container_name

printf "\n4. Download blob.\n"
azure storage blob download $container_name $blob_name $destination_folder/$blob_name

printf "\n5. Delete container\n"
azure storage container delete $container_name

# Remove environment variables
unset AZURE_STORAGE_ACCOUNT
unset AZURE_STORAGE_ACCESS_KEY

printf "\nDone\n\n"
