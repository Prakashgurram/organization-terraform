variable "Vpc_Id" {
  type = string
}

variable "route_table_routes" {
  type = list(any)
}
variable "Route_Table_Tags" {
  type = map(any)
}


