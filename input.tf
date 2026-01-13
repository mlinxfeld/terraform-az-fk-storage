// input.tf

#####################################
# Core
#####################################

variable "name" {
  description = "Storage account name (must be globally unique, 3-24 chars, lowercase + numbers)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

#####################################
# Storage Account SKU / settings
#####################################

variable "account_tier" {
  description = "Storage account tier."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Replication type."
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "ZRS", "GRS", "RAGRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "account_replication_type must be one of: LRS, ZRS, GRS, RAGRS, GZRS, RAGZRS."
  }
}

variable "account_kind" {
  description = "Storage account kind."
  type        = string
  default     = "StorageV2"
  validation {
    condition     = contains(["StorageV2", "BlobStorage", "FileStorage", "BlockBlobStorage"], var.account_kind)
    error_message = "account_kind must be one of: StorageV2, BlobStorage, FileStorage, BlockBlobStorage."
  }
}

variable "access_tier" {
  description = "Access tier (only valid for BlobStorage/StorageV2)."
  type        = string
  default     = "Hot"
  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "access_tier must be Hot or Cool."
  }
}

variable "https_traffic_only_enabled" {
  description = "Force HTTPS."
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version."
  type        = string
  default     = "TLS1_2"
  validation {
    condition     = contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "min_tls_version must be TLS1_0, TLS1_1, or TLS1_2."
  }
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

#####################################
# Optional: Blob containers
#####################################

variable "create_containers" {
  description = "Create blob containers."
  type        = bool
  default     = false
}

variable "containers" {
  description = <<EOT
Map of blob containers to create.
Example:
containers = {
  logs = { access_type = "private" }
  public = { access_type = "blob" }
}
access_type: private|blob|container
EOT
  type = map(object({
    access_type = optional(string, "private")
    metadata    = optional(map(string), {})
  }))
  default = {}
}

#####################################
# Optional: Azure File Shares
#####################################

variable "create_file_shares" {
  description = "Create Azure File Shares."
  type        = bool
  default     = false
}

variable "file_shares" {
  description = <<EOT
Map of file shares to create.
Example:
file_shares = {
  shared = { quota_gb = 100, access_tier = "TransactionOptimized" }
}
quota_gb: 1..5120 (service limits may vary)
access_tier: Hot|Cool|TransactionOptimized|Premium (depends on account kind/sku)
EOT
  type = map(object({
    quota_gb    = number
    access_tier = optional(string)
    metadata    = optional(map(string), {})
  }))
  default = {}
}

#####################################
# Optional: Network rules
#####################################

variable "enable_network_rules" {
  description = "Enable network rules block on the storage account."
  type        = bool
  default     = false
}

variable "network_rules" {
  description = <<EOT
Storage account network rules.
If enable_network_rules = true, this object is used.
- default_action: Allow|Deny
- bypass: list like ["AzureServices", "Metrics", "Logging"]
- ip_rules: list of public IPs/CIDRs
- virtual_network_subnet_ids: list of subnet IDs allowed to access
EOT
  type = object({
    default_action             = string
    bypass                     = optional(list(string), ["AzureServices"])
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = {
    default_action = "Allow"
  }
}

