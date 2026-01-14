// examples/05_private_endpoint_blob/random.tf

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
