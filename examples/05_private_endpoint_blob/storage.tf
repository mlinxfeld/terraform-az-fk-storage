// examples/05_private_endpoint_blob/storage.tf

module "storage" {
  source = "github.com/mlinxfeld/terraform-az-fk-storage"

  name                = local.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  # Private endpoint scenario: disable public network access
  public_network_access_enabled = false

  # keep example focused
  create_containers    = false
  create_file_shares   = false
  enable_network_rules = false

  tags = var.tags
}
