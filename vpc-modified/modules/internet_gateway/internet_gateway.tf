# Internet Gateway Resource Creation
resource "aws_internet_gateway" "ig" {
  vpc_id = var.Vpc_Id
  tags   = var.Igw_Tags
}
