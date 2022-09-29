# Shared resources (subnets)
resource "aws_ram_resource_association" "subnets" {
  resource_arn       = var.resource_arn
  resource_share_arn = var.resource_share_arn
}