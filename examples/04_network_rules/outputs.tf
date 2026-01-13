// examples/04_network_rules/outputs.tf

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

output "network_rules_applied" {
  description = "Indicates that network rules are enforced on the Storage Account."
  value       = true
}
