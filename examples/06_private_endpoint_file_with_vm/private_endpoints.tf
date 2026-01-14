// examples/06_private_endpoint_file_with_vm/private_endpoints.tf

resource "azurerm_private_endpoint" "fk_file_pe" {
  name                = "${local.storage_account_name}-pe-file"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["fk-subnet-private-endpoints"]
  tags                = var.tags

  private_service_connection {
    name                           = "${local.storage_account_name}-psc-file"
    private_connection_resource_id = module.storage.storage_account_id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }

  # Works across azurerm versions: nested zone group block
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.fk_file_dns_zone.id]
  }

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.fk_file_dns_zone_link
  ]
}