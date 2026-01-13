// examples/01_basic_storage_account/variables.tf

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
    example = "01_basic_storage_account"
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
