# RAM creation
resource "aws_ram_resource_share" "ram_sharing" {
  name                      = var.ram_name
  allow_external_principals = var.allow_external_principals

  tags = {
    Environment = "test"
  }
}
