// examples/05_private_endpoint_blob/private_endpoints.tf

resource "azurerm_private_endpoint" "fk_blob_pe" {
  name                = local.pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["fk-subnet-private-endpoints"]
  tags                = var.tags

  private_service_connection {
    name                           = "${local.storage_account_name}-psc-blob"
    private_connection_resource_id = module.storage.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.fk_blob_dns_zone.id]
  }

}