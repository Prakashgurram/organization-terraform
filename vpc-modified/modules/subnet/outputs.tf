# Outputs SUBNET ID and stores in the output variable "subnet_ids"
output "subnet_ids" {
  value = aws_subnet.Subnet.id
}
