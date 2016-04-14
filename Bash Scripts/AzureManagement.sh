# Azure Storage Management Sample - Demonstrates how to create and manage storage accounts.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786322
# For Cmdlet reference, see http://go.microsoft.com/fwlink/?LinkId=786325

# Provide your subscription ID
# To retrieve your subscription ID, run the following two commands:
  # azure login
  # azure account list
subscription_id="<Subscription ID>"

# Provide the name of the resource group that will be created.
resource_group_name="<Resource Group Name>"

# Provide the name of the Storage account that will be created.
storage_account_name="<Storage Account Name>"

# Specify the type of Storage account to create and another type that will be used for updating the Storage account. Valid values are:
  # LRS (locally-redundant storage)
  # ZRS (zone-redundant storage)
  # GRS (geo-redundant storage)
  # RAGRS (read access geo-redundant storage)
  # PLRS (premium locally-redundant storage)
type="<GRS>"
new_type="<RAGRS>"

# Specify the location of the Storage account to create.
# To view available locations for Storage, go to http://go.microsoft.com/fwlink/?LinkId=786652 or run the following command:
  # azure provider show Microsoft.Storage
#NOTE: Location names must be lowercase with no spaces. For example, East US = eastus.
location="<Location>"

printf "\n1. Enable Azure CLI Resource Manager commands.\n"
azure config mode arm

printf "\n2. Set default Azure subscription.\n"
azure account set $subscription_id

printf "\n3. Create new resource group.\n"
azure group create $resource_group_name $location

printf "\n4. Create new Storage account.\n"
azure storage account create --resource-group $resource_group_name --location $location --type $type $storage_account_name

printf "\n5. Show details of Storage account.\n"
azure storage account show --resource-group $resource_group_name $storage_account_name

printf "\n6. List all Storage accounts in subscription.\n"
azure storage account list

printf "\n7. Get access keys for Azure Storage account.\n"
azure storage account keys list --resource-group $resource_group_name $storage_account_name

printf "\n8. Renew primary access key for Azure Storage account.\n"
azure storage account keys renew --resource-group $resource_group_name --primary $storage_account_name

printf "\n9. Print Azure Storage connection string.\n"
azure storage account connectionstring show --resource-group $resource_group_name $storage_account_name

printf "\n10. Update Storage account type.\n"
azure storage account set --resource-group $resource_group_name --type $new_type $storage_account_name
azure storage account show --resource-group $resource_group_name $storage_account_name

printf "\n11. Delete Storage account.\n"
azure storage account delete --resource-group $resource_group_name $storage_account_name

printf "\n12. Delete resource group.\n"
azure group delete $resource_group_name

printf "\nDone\n\n"
