# Outputs ROUTE TABLE  ID and stores in the output variable "route_table_id"
output "route_table_id" {
  value = aws_route_table.RouteTable.id
}
