// examples/02_blob_containers/outputs.tf

output "storage_account_name" {
  description = "Storage account name."
  value       = module.storage.storage_account_name
}

output "storage_account_id" {
  description = "Storage account resource ID."
  value       = module.storage.storage_account_id
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint."
  value       = module.storage.primary_blob_endpoint
}

output "primary_file_endpoint" {
  description = "Primary file endpoint."
  value       = module.storage.primary_file_endpoint
}

output "container_names" {
  description = "Created blob container names."
  value       = module.storage.container_names
}
