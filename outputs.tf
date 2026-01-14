// outputs.tf

output "storage_account_id" {
  description = "Storage account resource ID."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Storage account name."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_file_endpoint" {
  description = "Primary File endpoint."
  value       = azurerm_storage_account.this.primary_file_endpoint
}

output "container_names" {
  description = "Created blob container names."
  value       = [for k, v in azurerm_storage_container.this : v.name]
}

output "file_share_names" {
  description = "Created file share names."
  value       = [for k, v in azurerm_storage_share.this : v.name]
}

output "primary_access_key" {
  description = "Primary access key for the Storage Account (used by consumers such as VMs mounting Azure Files)."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}