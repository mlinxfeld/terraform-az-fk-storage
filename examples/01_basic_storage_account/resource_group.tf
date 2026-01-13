// examples/01_basic_storage_account/resource_group.tf

resource "azurerm_resource_group" "foggykitchen_rg" {
  name     = var.resource_group_name
  location = var.location
}

