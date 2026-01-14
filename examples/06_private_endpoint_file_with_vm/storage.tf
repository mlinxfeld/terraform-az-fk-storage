// examples/06_private_endpoint_file_with_vm/storage.tf

module "storage" {
  source = "../../"

  name                = local.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

# Private-only access
  public_network_access_enabled = false

  # We create a File Share in this example
  create_file_shares = true 
  file_shares        = var.file_shares 

  # keep example focused
  create_containers    = false
  enable_network_rules = false

  tags = var.tags
}
