# AWS Subnet Resource creation
resource "aws_subnet" "Subnet" {
  vpc_id                  = var.Vpc_Id
  cidr_block              = var.Cidr_Block
  availability_zone       = var.Availability_Zone
  tags                    = var.Tags
  map_public_ip_on_launch = var.Map_Public_Ip_On_Launch
}
