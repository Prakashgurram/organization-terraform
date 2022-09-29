# AWS Provider Region
variable "Aws_Region" {
  type = string
}

variable "Aws_availability_zones" {
  type = list(string)
  
}

# VPC Module
variable "Aws_Vpc_Cidr" {
  type = string
}


variable "Aws_Enable_Dns_Hostnames" {
  type = bool
}

variable "Aws_Enable_Dns_Support" {
  type = bool
}

variable "Aws_Vpc_Tags" {
  type = map(any)
}

# Public Subnet Module
variable "Public_Subnets_Cidr" {
  type = list(any)
}

variable "Aws_Public_Subnet_Tags" {
  type = map(any)
}

variable "Aws_Map_Public_Ip_On_Launch_Public" {
  type = bool
}

# App Private Subnet Module
variable "App_Private_Subnets_Cidr" {
  type = list(any)
}

variable "Aws_App_Private_Subnet_Tags" {
  type = map(any)
}

variable "Aws_Map_Public_Ip_On_Launch_Private" {
  type = bool
}

# Db Private Subnet Module
variable "Db_Private_Subnets_Cidr" {
  type = list(any)
}

variable "Aws_Db_Private_Subnet_Tags" {
  type = map(any)
}

# Network ACL Module
variable "public_subnet_nacl_ingress_list" {
  type = list(any)
}

variable "public_subnet_nacl_egress_list" {
  type = list(any)
}

variable "public_subnet_nacl_tags" {
  type = map(any)
}

variable "app_private_subnet_nacl_ingress_list" {
  type = list(any)
}

variable "app_private_subnet_nacl_egress_list" {
  type = list(any)
}

variable "app_private_subnet_nacl_tags" {
  type = map(any)
}

variable "db_private_subnet_nacl_ingress_list" {
  type = list(any)
}

variable "db_private_subnet_nacl_egress_list" {
  type = list(any)
}

variable "db_private_subnet_nacl_tags" {
  type = map(any)
}

# Internet Gateway Module
variable "Igw_Tags" {
  type = map(any)
}

# Nat Gateway Module
variable "Aws_Nat_Gateway_Tags" {
  type = map(any)
}

variable "VPC_EIP_Flag" {
  type = bool
}

variable "Aws_Ip_Pool" {
  type = string
}

# Public Route Table Module
variable "Aws_Public_Route_Table_Tags" {
  type = map(any)
}

variable "Ipv4_Cidr" {
  type = string
}

# App Private Route Table Module
variable "Aws_App_Private_Route_Table_Tags" {
  type = map(any)
}

# Db Private Route Table Module
variable "Aws_Db_Private_Route_Table_Tags" {
  type = map(any)
}
