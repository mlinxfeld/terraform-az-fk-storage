// examples/03_file_share_rwx/storage.tf

module "storage" {
  source = "github.com/mlinxfeld/terraform-az-fk-storage"

  # Storage account names must be lowercase letters and numbers, 3-24 chars
  name                = "${var.name_prefix}${random_string.suffix.result}"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  https_traffic_only_enabled    = true
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true

  # RWX via Azure File Share
  create_file_shares = true
  file_shares        = var.file_shares

  # Keep this example focused: no blob containers / no network hardening yet
  create_containers    = false
  enable_network_rules = false

  tags = var.tags
}
