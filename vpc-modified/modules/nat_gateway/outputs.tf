# Outputs NAT GATEWAY ID and stores in the output variable "nat_gateway_id"
output "nat_gateway_id" {
  value = aws_nat_gateway.NatGateway.id
}
