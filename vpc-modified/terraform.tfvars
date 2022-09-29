# AWS Provider Region
Aws_Region = "us-east-1"

#Availability_zones
Aws_availability_zones = [ "us-east-1a", "us-east-1b", "us-east-1c" ]

# VPC Module
Aws_Vpc_Cidr             = "10.0.0.0/16"
Aws_Enable_Dns_Hostnames = true
Aws_Enable_Dns_Support   = true
Aws_Vpc_Tags             = { Name = "myvpc" }

# Public Subnet Module
Public_Subnets_Cidr                = []
Aws_Public_Subnet_Tags             = { Name = "PublicSubnet" }
Aws_Map_Public_Ip_On_Launch_Public = true

# App Private Subnet Module
App_Private_Subnets_Cidr            = ["10.0.2.0/24", "10.0.3.0/24"]
Aws_App_Private_Subnet_Tags         = { Name = "AppPrivateSubnet" }
Aws_Map_Public_Ip_On_Launch_Private = false

# Db Private Subnet Module
Db_Private_Subnets_Cidr    = ["10.0.4.0/24", "10.0.5.0/24"]
Aws_Db_Private_Subnet_Tags = { Name = "DbPrivateSubnet" }

# Public Subnet Network ACL
public_subnet_nacl_ingress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 80
  to_port    = 80
}]
public_subnet_nacl_egress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 80
  to_port    = 80
}]
public_subnet_nacl_tags = { Name = "PublicSubnetNACL" }

# App Private Subnet Network ACL
app_private_subnet_nacl_ingress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "10.0.0.0/16"
  from_port  = 80
  to_port    = 80
}]
app_private_subnet_nacl_egress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "10.0.0.0/16"
  from_port  = 80
  to_port    = 80
}]
app_private_subnet_nacl_tags = { Name = "AppPrivateSubnetNACL" }

# Db Private Subnet Network ACL
db_private_subnet_nacl_ingress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "10.0.0.0/16"
  from_port  = 3306
  to_port    = 3306
}]
db_private_subnet_nacl_egress_list = [{
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "10.0.0.0/16"
  from_port  = 3306
  to_port    = 3306
}]
db_private_subnet_nacl_tags = { Name = "DbPrivateSubnetNACL" }

# Internet Gateway Module
Igw_Tags = { Name = "Internetgateway" }

# Nat Gateway Module
Aws_Nat_Gateway_Tags = { Name = "NatGateway" }
VPC_EIP_Flag         = true
Aws_Ip_Pool          = "amazon"

# Public Route Table Module
Aws_Public_Route_Table_Tags = { Name : "PublicRouteTable" }
Ipv4_Cidr                   = "0.0.0.0/0"

# App Private Route Table Module
Aws_App_Private_Route_Table_Tags = { Name : "AppPrivateRouteTable" }

# Db Private Route Table Module
Aws_Db_Private_Route_Table_Tags = { Name : "DbPrivateRouteTable" }
