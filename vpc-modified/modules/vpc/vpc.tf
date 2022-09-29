# AWS VPC Resource Creation
resource "aws_vpc" "vpc" {
  cidr_block           = var.Vpc_Cidr
  enable_dns_hostnames = var.Enable_Dns_Hostnames
  enable_dns_support   = var.Enable_Dns_Support

  tags = var.Vpc_Tags
}

