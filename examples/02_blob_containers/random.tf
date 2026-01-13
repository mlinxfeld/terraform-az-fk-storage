// examples/02_blob_containers/random.tf

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
