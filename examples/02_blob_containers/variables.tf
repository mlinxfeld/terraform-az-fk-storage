// examples/02_blob_containers/variables.tf

variable "name_prefix" {
  description = "Prefix for storage account name (lowercase only). Example: fks"
  type        = string
  default     = "fksa"
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.name_prefix)) && length(var.name_prefix) <= 10
    error_message = "name_prefix must be lowercase letters/numbers only and max 10 chars."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource group name for this example"
  type        = string
  default     = "fk-rg"
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default = {
    project = "terraform-az-fk-storage"
    example = "02_blob_containers"
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

variable "containers" {
  description = <<EOT
Blob containers to create.

access_type:
- private   (recommended default)
- blob
- container

Example:
containers = {
  logs      = { access_type = "private",  metadata = { purpose = "logs" } }
  artifacts = { access_type = "private" }
  public    = { access_type = "blob" }
}
EOT
  type = map(object({
    access_type = optional(string, "private")
    metadata    = optional(map(string), {})
  }))
  default = {
    logs = {
      access_type = "private"
      metadata = {
        purpose = "logs"
      }
    }
    artifacts = {
      access_type = "private"
    }
  }
}