// examples/06_private_endpoint_file_with_vm/random.tf

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
