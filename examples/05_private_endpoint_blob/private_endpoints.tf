// examples/05_private_endpoint_blob/private_endpoints.tf

module "private_endpoint_blob" {
  source = "github.com/mlinxfeld/terraform-az-fk-private-endpoint"

  name                = local.pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_ids["fk-subnet-private-endpoints"]

  private_connection_resource_id = module.storage.storage_account_id
  subresource_names              = ["blob"]
  is_manual_connection           = false

  private_dns_zone_group_name = "default"
  private_dns_zone_ids        = [azurerm_private_dns_zone.fk_blob_dns_zone.id]

  tags = var.tags
}
