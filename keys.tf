resource "tls_private_key" "poc" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "poc" {
  key_name   = "poc-key"
  public_key = tls_private_key.poc.public_key_openssh
}

resource "local_file" "local_ssh_private_key" {
  content         = tls_private_key.poc.private_key_pem
  filename        = "poc"
  file_permission = "644"
}

resource "local_file" "local_ssh_public_key" {
  content         = tls_private_key.poc.public_key_openssh
  filename        = "poc.pub"
  file_permission = "600"
} 
