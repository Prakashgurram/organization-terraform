variable "Vpc_Cidr" {
  type = string
}

variable "Enable_Dns_Hostnames" {
  type = bool
}

variable "Enable_Dns_Support" {
  type = bool
}

variable "Vpc_Tags" {
  type = map(any)
}

