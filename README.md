# terraform-az-fk-storage

This repository contains a reusable **Terraform / OpenTofu module** and progressive examples for deploying **Azure Storage** resources — from basic public access, through network hardening, to fully private access integrated with Virtual Machines.

It is part of the **FoggyKitchen.com training ecosystem** and is designed as a clean, composable **storage layer** that builds on top of an existing Azure networking foundation (VNet, subnets).

---

## 🎯 Purpose

The goal of this repository is to provide a **clear, educational, and architecture-aware reference implementation** for Azure Storage using Infrastructure as Code.

It focuses on:
- Azure Storage Accounts (StorageV2)
- Blob Containers and File Shares
- Network Rules and access boundaries
- Private Endpoints and Private DNS
- Real consumers (Virtual Machines) accessing storage privately

This is **not** a full landing zone or opinionated enterprise platform.
It is a **learning-first, building-block module**.

---

## ✨ What the module does

Depending on configuration and example used, the module can create:

- Azure Storage Account (StorageV2)
- Blob Containers
- File Shares
- Network Rules (IP / VNet allowlists)
- Private Endpoints (Blob, File)
- Integration with:
  - Azure Virtual Networks
  - Private DNS Zones
  - Virtual Machines

The module intentionally does **not** create:

- Virtual Networks or subnets
- Network Security Groups
- Bastion
- Load Balancers
- AKS clusters
- Monitoring or backup resources

Each of those concerns belongs in its own dedicated module.

---

## 📂 Repository Structure

```bash
terraform-az-fk-storage/
├── examples/
│   ├── 01_basic_storage_account/
│   ├── 02_blob_containers/
│   ├── 03_file_share_rwx/
│   ├── 04_network_rules/
│   ├── 05_private_endpoint_blob/
│   ├── 06_private_endpoint_file_with_vm/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

---

## 🚀 Example Usage

```hcl
module "storage" {
  source = "git::https://github.com/mlinxfeld/terraform-az-fk-storage.git?ref=v0.1.0"

  name                = "fksaexample"
  location            = "westeurope"
  resource_group_name = "fk-rg"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  create_containers = true
  containers = {
    artifacts = {}
    logs      = {}
  }

  tags = {
    project = "foggykitchen"
    env     = "dev"
  }
}
```

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `storage_account_id` | ID of the created Azure Storage Account. |
| `storage_account_name` | Name of the created Azure Storage Account. |
| `primary_blob_endpoint` | Primary Blob service endpoint (public or private, depending on configuration). |
| `primary_file_endpoint` | Primary File service endpoint (used for Azure Files access). |
| `container_names` | List of Blob Container names created by the module (if enabled). |
| `file_share_names` | List of File Share names created by the module (if enabled). |
| `primary_access_key` | Primary access key for the Storage Account (used by consumers such as VMs mounting Azure Files). |

---

## 🧠 Design Philosophy

- Storage access is a **networking problem first**
- Public endpoints and private access must be **explicit**
- DNS is part of the architecture, not an afterthought
- One example = one architectural concept
- Outputs are first-class citizens
- Modules are designed to be **composed**, not expanded endlessly

---

## 🧩 Related Modules & Courses

- terraform-az-fk-vnet
- terraform-az-fk-compute
- terraform-az-fk-aks
- terraform-oci-fk-oke

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.

© 2025 FoggyKitchen.com — Cloud. Code. Clarity.
