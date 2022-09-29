# Outputs INTERNET GATEWAY ID and stores in the output variable "internet_gateway_id"
output "internet_gateway_id" {
  value = aws_internet_gateway.ig.id
}
