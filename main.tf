# Configure the Azure Provider
provider "azurerm" {
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret 
  tenant_id       = var.azure-tenant-id
  version = "=2.5.0"
  features {}
}
resource "azurerm_resource_group" "shane" {
  name     = "shane"
  location = "southeast asia"
}

resource "azurerm_storage_account" "shanestrtacnt" {
  name                     = "shanestrtacnt"
  resource_group_name      = azurerm_resource_group.shane.name
  location                 = azurerm_resource_group.shane.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "staging"
  }
}