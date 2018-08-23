#!/bin/bash

# echo ON
set -x

#generate random string
randomString=$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c6) 

# define variables
resourceGroupName="contoso-simple-iaas"
resourceGroupLocation="France Central"
vnetContoso="vnet-contoso"

# create resourcegroup
#az group create --name "$resourceGroupName" --location "$resourceGroupLocation" 

# create vnet
az network vnet create -g $resourceGroupName -n $vnetContoso --address-prefix "172.16.0.0/16"

# create firt subnet
az network vnet subnet create --vnet-name $vnetContoso --name "subnet-1" -g $resourceGroupName --address-prefix 172.16.1.0/24

# create second subnet 
az network vnet subnet create --vnet-name $vnetContoso --name "subnet-2" -g $resourceGroupName  --address-prefix 172.16.2.0/24

# Create a storage account
az storage account create -n "storage-$randomString" -g $resourceGroupName -l "$resourceGroupLocation" --sku Standard_LRS
