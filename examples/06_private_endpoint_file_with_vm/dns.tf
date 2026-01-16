// examples/06_private_endpoint_file_with_vm/dns.tf

resource "azurerm_private_dns_zone" "fk_file_dns_zone" {
  name                = local.dns_zone_name
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "fk_file_dns_zone_link" {
  name                  = "${local.storage_account_name}-dnslink-file"
  resource_group_name   = azurerm_resource_group.foggykitchen_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.fk_file_dns_zone.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
  tags                  = var.tags
}
