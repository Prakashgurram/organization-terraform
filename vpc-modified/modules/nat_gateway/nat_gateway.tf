# Elastic IP Resource creation for NAT Gateway
resource "aws_eip" "eip" {
  vpc              = var.VPC_EIP_Flag
  public_ipv4_pool = var.Aws_Ip_Pool
}

# NAT Gateway Resource Creation
resource "aws_nat_gateway" "NatGateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.Subnet_Id

  tags = var.Nat_Gateway_Tags
}
