variable "Subnet_Id" {
  type = string
}

variable "Nat_Gateway_Tags" {
  type = map(any)
}

variable "VPC_EIP_Flag" {
  type = bool
}

variable "Aws_Ip_Pool" {
  type = string
}
