// examples/05_private_endpoint_blob/dns.tf

module "private_dns" {
  source = "github.com/mlinxfeld/terraform-az-fk-private-dns"

  resource_group_name    = var.resource_group_name
  private_dns_zone_names = [local.dns_zone_name]
  tags                   = var.tags

  vnet_links = {
    "blob-dns-link" = {
      vnet_id              = module.vnet.vnet_id
      registration_enabled = false
    }
  }
}
