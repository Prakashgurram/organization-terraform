variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list
}

variable "nacl_ingress_list" {
  type = list
}

variable "nacl_egress_list" {
  type = list
}

variable "nacl_tags" {
   type = map
}
