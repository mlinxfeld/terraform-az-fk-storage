// examples/04_network_rules/resource_group.tf

resource "azurerm_resource_group" "foggykitchen_rg" {
  name     = var.resource_group_name
  location = var.location
}

