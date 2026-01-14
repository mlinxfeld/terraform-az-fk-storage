// examples/05_private_endpoint_blob/dns.tf

resource "azurerm_private_dns_zone" "fk_blob_dns_zone" {
  name                = local.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "fk_blob_dns_zone_link" {
  name                  = "${local.storage_account_name}-dnslink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.fk_blob_dns_zone.name
  virtual_network_id    = module.vnet.vnet_id
  registration_enabled  = false
  tags                  = var.tags
}

