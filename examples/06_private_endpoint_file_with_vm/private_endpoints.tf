// examples/06_private_endpoint_file_with_vm/private_endpoints.tf

module "private_endpoint_file" {
  source = "github.com/mlinxfeld/terraform-az-fk-private-endpoint"

  name                = "${local.storage_account_name}-pe-file"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
  subnet_id           = module.vnet.subnet_ids["fk-subnet-private-endpoints"]

  private_connection_resource_id = module.storage.storage_account_id
  subresource_names              = ["file"]
  is_manual_connection           = false

  private_dns_zone_group_name = "default"
  private_dns_zone_ids        = [azurerm_private_dns_zone.fk_file_dns_zone.id]

  tags = var.tags

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.fk_file_dns_zone_link
  ]
}
