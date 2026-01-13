// examples/02_blob_containers/storage.tf

module "storage" {
  source = "../../"

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

  # Enable blob containers in this example
  create_containers = true
  containers        = var.containers

  # Still not using file shares / network rules here
  create_file_shares   = false
  enable_network_rules = false

  tags = var.tags
}
