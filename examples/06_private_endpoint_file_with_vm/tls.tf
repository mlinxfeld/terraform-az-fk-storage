// examples/06_private_endpoint_file_with_vm/tls.tf

resource "tls_private_key" "public_private_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

