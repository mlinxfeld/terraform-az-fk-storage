// examples/05_private_endpoint_blob/variables.tf

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
    example = "05_private_endpoint_blob"
  }
}

# Storage account baseline knobs (keep consistent across examples)
variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "Storage account tier."
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication type."
}

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = "Storage account kind."
}

variable "access_tier" {
  type        = string
  default     = "Hot"
  description = "Access tier (for StorageV2/BlobStorage)."
}

variable "vnet_name" {
  description = "Existing VNet Name to link the Private DNS Zone to."
  type        = string
  default     = "fk-vnet"
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

variable "my_public_ip" {
  description = "Your current public IP address for firewall exception"
  type        = string
  default     = ""
}