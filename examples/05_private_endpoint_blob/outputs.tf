// examples/05_private_endpoint_blob/outputs.tf

output "storage_account_name" {
  description = "Storage account name."
  value       = module.storage.storage_account_name
}

output "storage_account_id" {
  description = "Storage account resource ID."
  value       = module.storage.storage_account_id
}

output "private_endpoint_id" {
  description = "Private Endpoint resource ID."
  value       = azurerm_private_endpoint.fk_blob_pe.id
}

output "private_endpoint_private_ip" {
  description = "Private IP address assigned to the Private Endpoint (Blob)."
  value       = azurerm_private_endpoint.fk_blob_pe.private_service_connection[0].private_ip_address
}

output "private_dns_zone_name" {
  description = "Private DNS zone used for Blob Private Link."
  value       = azurerm_private_dns_zone.fk_blob_dns_zone.name
}
