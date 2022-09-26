@maxLength(11)
param storageAccountPrefix string = 'bicep'
param location string = resourceGroup().location
var storageName = toLower('${storageAccountPrefix}${uniqueString(subscription().id)}')


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
