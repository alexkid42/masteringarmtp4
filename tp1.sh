#!/bin/bash

# echo ON
set -x

# define variables
resourceGroupName="contoso-simple-paas"
resourceProviderNamespace="Microsoft.Web"
resourceTypeName="Sites"
resourceGroupLocation="France Central"

randomString=$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c6) 
appNamePrefix="contoso" 
appServicePlanName="$appNamePrefix-$randomString" 
webAppName="$appNamePrefix-$randomString"

# create resourcegroup
az group create --name "$resourceGroupName" --location "$resourceGroupLocation"

# create service plan
az appservice plan create --resource-group $resourceGroupName --name $appServicePlanName --sku S1 --location "$resourceGroupLocation" 

# Create web app
az webapp create --resource-group $resourceGroupName --plan $appServicePlanName --name $webAppName 
 


