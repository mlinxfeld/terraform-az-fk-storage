// examples/04_network_rules/random.tf

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
