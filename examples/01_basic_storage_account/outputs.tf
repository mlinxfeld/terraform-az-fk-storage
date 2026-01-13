// examples/01_basic_storage_account/outputs.tf

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

