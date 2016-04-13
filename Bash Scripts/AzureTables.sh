#!/usr/bin/env bash

# Azure Table Service Sample - Demonstrates how to perform common tasks using the Microsoft Azure Table storage
# including creating, listing, and deleting tables.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786321
# For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=785079

# Provide the name of your Storage account.
export AZURE_STORAGE_ACCOUNT=<Storage Account Name>

# Provide your Storage account key.
export AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

# Provide a name for your new table.
table_name=<Table Name>

printf "\n1. Create a new table.\n"
azure storage table create $table_name

printf "\n2. List all tables.\n"
azure storage table list $table_name

printf "\n3. Remove table\n"
azure storage table delete $table_name

unset AZURE_STORAGE_ACCOUNT
unset AZURE_STORAGE_ACCESS_KEY

printf "\nDone\n\n"
