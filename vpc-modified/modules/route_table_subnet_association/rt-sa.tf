# Route Table Association to subnets
resource "aws_route_table_association" "PrivateSubnet1RouteTableAssociation" {
  subnet_id      = var.Subnet_Id
  route_table_id = var.Route_Table_Id
}
