rem Azure Storage Management Sample - Demonstrates how to create and manage storage accounts.
rem For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786322
rem For Cmdlet reference, see http://go.microsoft.com/fwlink/?LinkId=786325

rem Provide your subscription ID
rem To retrieve your subscription ID, run the following two commands:
  rem azure login
  rem azure account list
set subscription_id=<Subscription ID>

rem Provide the name of the resource group that will be created.
set resource_group_name=<Resource Group Name>

rem Provide the name of the Storage account that will be created.
set storage_account_name=<Storage Account Name>

rem Specify the type of Storage account to create and another type that will be used for updating the Storage account. Valid values are:
  rem LRS (locally-redundant storage)
  rem ZRS (zone-redundant storage)
  rem GRS (geo-redundant storage)
  rem RAGRS (read access geo-redundant storage)
  rem PLRS (premium locally-redundant storage)
set type=<GRS>
set new_type=<RAGRS>

rem Specify the location of the Storage account to create.
rem To view available locations for Storage, go to http://go.microsoft.com/fwlink/?LinkId=786652 or run the following command:
  rem azure provider show Microsoft.Storage
rem NOTE: Location names must be lowercase with no spaces. For example, East US = eastus.
set location=<Location>

echo "1. Enable Azure CLI Resource Manager commands."
call azure config mode arm

echo "2. Set default Azure subscription."
call azure account set %subscription_id%

echo "3. Create new resource group."
call azure group create %resource_group_name% %location%

echo "4. Create new Storage account."
call azure storage account create --resource-group %resource_group_name% --location %location% --type %type% %storage_account_name%

echo "5. Show details of Storage account."
call azure storage account show --resource-group %resource_group_name% %storage_account_name%

echo "6. List all Storage accounts in subscription."
call azure storage account list

echo "7. Get access keys for Azure Storage account."
call azure storage account keys list --resource-group %resource_group_name% %storage_account_name%

echo "8. Renew primary access key for Azure Storage account."
call azure storage account keys renew --resource-group %resource_group_name% --primary %storage_account_name%

echo "9. Print Azure Storage connection string."
call azure storage account connectionstring show --resource-group %resource_group_name% %storage_account_name%

echo "10. Update Storage account type."
call azure storage account set --resource-group %resource_group_name% --type %new_type% %storage_account_name%
call azure storage account show --resource-group %resource_group_name% %storage_account_name%

echo "11. Delete Storage account."
call azure storage account delete --resource-group %resource_group_name% %storage_account_name%

echo "12. Delete resource group."
call azure group delete %resource_group_name%

echo "Done"
