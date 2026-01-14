// examples/06_private_endpoint_file_with_vm/network.tf

module "vnet" {
  source = "git::https://github.com/mlinxfeld/terraform-az-fk-vnet.git?ref=v0.1.1"

  name                = var.vnet_name
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  address_space = ["10.10.0.0/16"]

  subnets = {

    fk-subnet-private-vm = {
        address_prefixes = ["10.10.10.0/24"]
    }

    fk-subnet-private-endpoints = {
        address_prefixes = ["10.10.20.0/24"]
    }
  }

  tags = var.tags
}