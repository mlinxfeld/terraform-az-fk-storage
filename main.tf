// main.tf

locals {
  # Gate creation by both flag + non-empty map (nice UX)
  effective_containers  = (var.create_containers && length(var.containers) > 0) ? var.containers : {}
  effective_file_shares = (var.create_file_shares && length(var.file_shares) > 0) ? var.file_shares : {}

  # access_tier only meaningful for StorageV2 / BlobStorage
  access_tier_enabled = contains(["StorageV2", "BlobStorage"], var.account_kind)

  # network rules only when enabled
  network_rules_enabled = var.enable_network_rules
}

resource "azurerm_storage_account" "this" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = local.access_tier_enabled ? var.access_tier : null
  https_traffic_only_enabled      = var.https_traffic_only_enabled
  min_tls_version                 = var.min_tls_version
  public_network_access_enabled   = var.public_network_access_enabled
  allow_nested_items_to_be_public = false

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  for_each = local.effective_containers

  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = try(each.value.access_type, "private")
  metadata              = try(each.value.metadata, {})
}

resource "azurerm_storage_share" "this" {
  for_each = local.effective_file_shares

  name                 = each.key
  storage_account_name = azurerm_storage_account.this.name
  quota                = each.value.quota_gb
  access_tier          = try(each.value.access_tier, null)
  metadata             = try(each.value.metadata, {})

  depends_on = [
    azurerm_storage_account_network_rules.this
  ]
}

resource "azurerm_storage_account_network_rules" "this" {
  count              = var.enable_network_rules ? 1 : 0
  storage_account_id = azurerm_storage_account.this.id

  default_action             = var.network_rules.default_action
  ip_rules                   = var.network_rules.ip_rules
  virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
  bypass                     = var.network_rules.bypass

  depends_on = [
    azurerm_storage_account.this
  ]
}
