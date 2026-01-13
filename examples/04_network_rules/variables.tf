// examples/04_network_rules/variables.tf

variable "name_prefix" {
  description = "Prefix for storage account name (lowercase only). Example: fksa"
  type        = string
  default     = "fksa"
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.name_prefix)) && length(var.name_prefix) <= 10
    error_message = "name_prefix must be lowercase letters/numbers only and max 10 chars."
  }
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region, e.g. westeurope."
  type        = string
  default     = "westeurope"
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default = {
    project = "terraform-az-fk-storage"
    example = "04_network_rules"
  }
}

variable "account_tier" {
  description = "Storage account tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type."
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Storage account kind."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Access tier (only for StorageV2/BlobStorage)."
  type        = string
  default     = "Hot"
}

variable "network_rules" {
  description = <<EOT
Network rules for Azure Storage Account.

Typical secure baseline:
- default_action = "Deny"
- allow AzureServices
- allow specific IPs or subnets

Example:
network_rules = {
  default_action = "Deny"
  bypass         = ["AzureServices"]
  ip_rules       = ["1.2.3.4/32"]
}
EOT

  type = object({
    default_action             = string
    bypass                     = optional(list(string), ["AzureServices"])
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })

  default = {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}