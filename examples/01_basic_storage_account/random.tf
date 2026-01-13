// examples/01_basic_storage_account/random.tf

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
