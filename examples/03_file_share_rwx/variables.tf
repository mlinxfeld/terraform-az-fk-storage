// examples/03_file_share_rwx/variables.tf

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
    example = "03_file_share_rwx"
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

variable "file_shares" {
  description = <<EOT
Azure File Shares to create (RWX-ready storage layer).

Example:
file_shares = {
  shared = { quota_gb = 100 }
}

quota_gb:
- typical values: 10, 100, 500
EOT
  type = map(object({
    quota_gb    = number
    access_tier = optional(string)
    metadata    = optional(map(string), {})
  }))
  default = {
    shared = {
      quota_gb = 100
      metadata = {
        purpose = "rwx"
      }
    }
  }
}
