variable "Vpc_Id" {
  type = string
}

variable "Cidr_Block" {
  type = string
}

variable "Availability_Zone" {
  type = string
}

variable "Tags" {
  type = map(any)
}

variable "Map_Public_Ip_On_Launch" {
  type = bool
}
