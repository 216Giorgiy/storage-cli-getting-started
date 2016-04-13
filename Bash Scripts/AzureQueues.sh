#!/usr/bin/env bash

# Azure Queue Service Sample - The Queue Service provides reliable messaging for workflow processing and for communication
# between loosely coupled components of cloud services. This sample demonstrates how to perform common tasks including
# creating, listing, and deleting queues.
# For more documentation, refer to http://go.microsoft.com/fwlink/?LinkId=786321
# For Cmdlet reference, refer to http://go.microsoft.com/fwlink/?LinkId=785079

# Provide the name of your Storage account.
export AZURE_STORAGE_ACCOUNT=<Storage Account Name>

# Provide the your Storage account key.
export AZURE_STORAGE_ACCESS_KEY=<Storage Account Key>

# Provide a name for your new queue.
queue_name=<Queue Name>

printf "\n1. Create a new queue.\n"
azure storage queue create $queue_name

printf "\n2. Show details of the queue.\n"
azure storage queue show $queue_name

printf "\n3. List all queues.\n"
azure storage queue list --prefix *

printf "\n4. Delete queue\n"
azure storage queue delete $queue_name

printf "\nDone\n\n"
