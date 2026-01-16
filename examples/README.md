# Azure Storage with Terraform/OpenTofu – Training Examples

This directory contains all progressive **storage-focused examples** built around the
`terraform-az-fk-storage` module.

The examples are designed as **incremental building blocks** that introduce Azure Storage
from a minimal baseline, through security controls, and finally into **fully private,
real-world consumption scenarios** using Virtual Machines and Private Endpoints.

These examples are part of the **FoggyKitchen.com training ecosystem** and are used across:
- Azure Fundamentals with Terraform/OpenTofu
- AKS and platform integration courses
- Multicloud (Azure + OCI) architectural training

---

## 🧭 Example Overview

| Example | Title | Key Topics |
|------|------|-----------|
| 01 | **Basic Storage Account** | StorageV2 baseline, HTTPS-only, TLS enforcement |
| 02 | **Blob Containers** | Blob containers, access types, logical data separation |
| 03 | **File Shares (RWX)** | Azure Files, shared storage semantics |
| 04 | **Network Rules** | Public endpoint with restricted access, security baseline |
| 05 | **Blob Private Endpoint** | Fully private Blob access, Private DNS integration |
| 06 | **File Private Endpoint with VMs** | Azure Files over SMB, Private Endpoint, VM consumers |

Each example builds on concepts introduced earlier, but **can be applied independently**
for learning, experimentation, or reuse in other projects.

---

## ⚙️ How to Use

Each example directory contains:

- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the architectural goal
- A **minimal, runnable deployment** (no placeholders)

To run an example:

```bash
cd examples/01_basic_storage_account
tofu init
tofu plan
tofu apply
```

You can apply examples independently, but the **recommended learning path** is sequential:

```
01 → 02 → 03 → 04 → 05 → 06
```

This mirrors real-world Azure storage design:
start simple, add security boundaries, then remove public exposure entirely
and integrate real compute consumers.

---

## 🧩 Design Principles

These examples follow strict design rules:

- One example = one architectural concept
- No unused or placeholder resources
- Clear separation of concerns (storage, networking, compute)
- Designed to integrate cleanly with other FoggyKitchen modules
- Private Endpoints and DNS shown explicitly (no magic)

The examples intentionally avoid:

- Full enterprise landing zones
- Opinionated frameworks
- Hidden cross-example dependencies
- AKS-level abstractions (covered in the AKS module)

---

## 🔗 Related Modules & Training

- [FoggyKitchen Azure Storage Module (terraform-az-fk-storage)](../)
- [FoggyKitchen Azure VNet Module (terraform-az-fk-vnet)](https://github.com/mlinxfeld/terraform-az-fk-vnet)
- [FoggyKitchen Azure Compute Module (terraform-az-fk-compute)](https://github.com/mlinxfeld/terraform-az-fk-compute)
- [FoggyKitchen AKS Module (terraform-az-fk-aks)](https://github.com/mlinxfeld/terraform-az-fk-aks)
- [OCI OKE Module (terraform-oci-fk-oke)](https://github.com/mlinxfeld/terraform-oci-fk-oke)

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See `LICENSE` for details.

---

© 2026 FoggyKitchen.com — Cloud. Code. Clarity.
