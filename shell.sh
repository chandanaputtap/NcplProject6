#!/bin/bash

# Load Azure Service Principal credentials
source .env

# Login to Azure using Service Principal credentials
echo "Logging into Azure using Service Principal..."
az login --service-principal --username $AZURE_APP_ID --password $AZURE_PASSWORD --tenant $AZURE_TENANT

# Verify login
if [ $? -ne 0 ]; then
    echo "Azure login failed!"
    exit 1
fi
echo "Azure login successful!"


# Deploy the ARM template
echo "Deploying ARM template to create storage account..."

# Check if deployment was successful
if [ $? -ne 0 ]; then
    echo "Deployment failed!"
    exit 1
fi
echo "Storage account deployed successfully!"
az deployment group create --resource-group NcplAzureProject6-RG --template-file storageAccount.json
