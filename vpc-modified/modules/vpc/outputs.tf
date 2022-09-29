# Outputs VPCID and stores in the output variable "vpc_id"
output "vpc_id" {
  value = aws_vpc.vpc.id
}
