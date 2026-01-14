# Example 05: Blob Private Endpoint (Private Access + DNS)

In this storage example, we move from **restricted public access**
to **fully private connectivity** by introducing a **Private Endpoint for Blob Storage**
using **Terraform / OpenTofu**.

This example focuses purely on **private network access and DNS resolution**:
no Blob Containers, no File Shares, no Network Rules, no compute resources.

Its purpose is to demonstrate how a Storage Account can be accessed
**exclusively through a private IP inside a Virtual Network**,
with the public endpoint disabled.

---

## 🧭 Architecture Overview

This deployment creates a single **Azure Storage Account**
exposed **only through a Private Endpoint** for the Blob service.

The public endpoint is disabled.
All traffic flows through the Azure backbone using a private IP
and is resolved via a **Private DNS Zone**.

<img src="05-private-endpoint-blob-architecture.png" width="900"/>

This example creates:
- One **Azure Storage Account (StorageV2)**
- One **Private Endpoint** for the **Blob** subresource
- One **Private DNS Zone** (`privatelink.blob.core.windows.net`)
- A **VNet link** for private DNS resolution
- HTTPS-only access
- Minimum TLS version enforced
- No public network access
- No Blob Containers
- No File Shares
- No Network Rules
- No compute resources

This is a **private connectivity baseline**, not a complete production deployment.

---

## 🎯 Why this example exists

After understanding:
- public endpoints with restricted access (Example 04),
- network rules as a first security boundary,

the next logical step is to **remove the public surface entirely**.

Private Endpoints provide:
- private IP-based access to PaaS services,
- traffic that never leaves the Azure backbone,
- integration with Virtual Networks and DNS.

This example focuses on:
- Understanding how Private Endpoints change the access model
- Seeing the role of Private DNS Zones in name resolution
- Establishing a clean mental model before adding compute consumers

Integration with Virtual Machines or AKS is introduced in later examples.

---

## 🚀 Deployment Steps

From the `examples/05_private_endpoint_blob` directory:

```bash
tofu init
tofu plan
tofu apply
```

---

## 🖼️ Azure Portal View

<img src="05-private-endpoint-blob-portal-overview.png" width="900"/>

*Figure 1. Azure Blob Storage exposed exclusively via a Private Endpoint using Terraform/OpenTofu.*

---

## 🧹 Cleanup

```bash
tofu destroy
```

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
