// examples/06_private_endpoint_file_with_vm/compute.tf

module "compute" {
  count  = var.vm_number
  source = "github.com/mlinxfeld/terraform-az-fk-compute"

  name                = "${var.vm_name_prefix}${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  deployment_mode = "vm"
  subnet_id        = module.vnet.subnet_ids["fk-subnet-private-vm"]

  attach_nsg_to_nic = false

  admin_username = var.vm_admin_username
  ssh_public_key = tls_private_key.public_private_key_pair.public_key_openssh
  vm_size        = var.vm_size

  # ✅ Cloud-init does the mount (no bastion / no ssh required)
  custom_data = local.vm_cloud_init

  tags = var.tags
}