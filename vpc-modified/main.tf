# ********************************************AWS IAC PRODUCTS********************************************

# Source is path to child module. It is used in all parent modules for calling child module.


/* Parent Module for VPC. VPC Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "vpc" {
  source               = "./modules/vpc"
  Vpc_Cidr             = var.Aws_Vpc_Cidr
  Enable_Dns_Hostnames = var.Aws_Enable_Dns_Hostnames
  Enable_Dns_Support   = var.Aws_Enable_Dns_Support
  Vpc_Tags             = var.Aws_Vpc_Tags
}

# Data block to fetch the availability zones
# data "aws_availability_zones" "available" {
#   state = "available"
# }

/* Parent Module for Public Subnet. Public Subnet Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.
*/
module "public_subnet" {
  source                  = "./modules/subnet"
  Vpc_Id                  = module.vpc.vpc_id # Derived from output variable "vpc_id" declared in the vpc module
  count                   = length(var.Public_Subnets_Cidr)
  Cidr_Block              = element(var.Public_Subnets_Cidr, count.index)                     # List of CIDR Ranges
  Availability_Zone       = element(var.Aws_availability_zones, count.index)
  Map_Public_Ip_On_Launch = var.Aws_Map_Public_Ip_On_Launch_Public
  Tags                    = { for k, v in var.Aws_Public_Subnet_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for App Private Subnet. App Private Subnet Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.
*/
module "app_private_subnet" {
  source                  = "./modules/subnet"
  Vpc_Id                  = module.vpc.vpc_id # Derived from output variable "vpc_id" declared in the vpc module
  count                   = length(var.App_Private_Subnets_Cidr)
  Cidr_Block              = element(var.App_Private_Subnets_Cidr, count.index)                # List of CIDR Ranges
  Availability_Zone       = element(var.Aws_availability_zones, count.index) 
  Map_Public_Ip_On_Launch = var.Aws_Map_Public_Ip_On_Launch_Private
  Tags                    = { for k, v in var.Aws_App_Private_Subnet_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for Db Private Subnet. Db Private Subnet Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.
*/
module "db_private_subnet" {
  source                  = "./modules/subnet"
  Vpc_Id                  = module.vpc.vpc_id # Derived from output variable "vpc_id" declared in the vpc module
  count                   = length(var.Db_Private_Subnets_Cidr)
  Cidr_Block              = element(var.Db_Private_Subnets_Cidr, count.index)                 # List of CIDR Ranges
  Availability_Zone       = element(var.Aws_availability_zones, count.index) # Derived from data aws_availabilty_zones block
  Map_Public_Ip_On_Launch = var.Aws_Map_Public_Ip_On_Launch_Private
  Tags                    = { for k, v in var.Aws_Db_Private_Subnet_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for Public Subnet Network ACL. Public Subnet Network ACL Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.*/
module "public_subnets_nacl" {
  source            = "./modules/network_acl"
  vpc_id            = module.vpc.vpc_id                              # Derived from output variable "vpc_id" declared in the vpc module
  subnet_ids        = [for s in module.public_subnet : s.subnet_ids] # Derived from output variable "subnet_ids" declared in the subnet module
  nacl_ingress_list = var.public_subnet_nacl_ingress_list
  nacl_egress_list  = var.public_subnet_nacl_egress_list
  nacl_tags         = var.public_subnet_nacl_tags
}

/* Parent Module for App Private Subnet Network ACL. App Private Subnet Network ACL Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.*/
module "app_private_subnets_nacl" {
  source            = "./modules/network_acl"
  vpc_id            = module.vpc.vpc_id                                   # Derived from output variable "vpc_id" declared in the vpc module
  subnet_ids        = [for s in module.app_private_subnet : s.subnet_ids] # Derived from output variable "subnet_ids" declared in the subnet module
  nacl_ingress_list = var.app_private_subnet_nacl_ingress_list
  nacl_egress_list  = var.app_private_subnet_nacl_egress_list
  nacl_tags         = var.app_private_subnet_nacl_tags
}

/* Parent Module for Db Private Subnet Network ACL. Db Private Subnet Network ACL Resource is created by making the call to the child module 
   and values for variables declared in child module will be passed by the parent module.*/
module "db_private_subnets_nacl" {
  source            = "./modules/network_acl"
  vpc_id            = module.vpc.vpc_id                                  # Derived from output variable "vpc_id" declared in the vpc module
  subnet_ids        = [for s in module.db_private_subnet : s.subnet_ids] # Derived from output variable "subnet_ids" declared in the subnet module
  nacl_ingress_list = var.db_private_subnet_nacl_ingress_list
  nacl_egress_list  = var.db_private_subnet_nacl_egress_list
  nacl_tags         = var.db_private_subnet_nacl_tags
}

/* Parent Module for Internet Gateway. Internet Gateway Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "internet_gateway" {
  source   = "./modules/internet_gateway"
  Vpc_Id   = module.vpc.vpc_id # Derived from output variable "vpc_id" declared in the vpc module
  Igw_Tags = var.Igw_Tags
}

/* Parent Module for NAT Gateway. NAT Gateway Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "nat_gateway" {
  source           = "./modules/nat_gateway"
  VPC_EIP_Flag     = var.VPC_EIP_Flag
  Aws_Ip_Pool      = var.Aws_Ip_Pool
  count            = length(var.Public_Subnets_Cidr)
  Subnet_Id        = module.public_subnet[count.index].subnet_ids # Derived from output variable "subnet_ids" declared in the subnet module
  Nat_Gateway_Tags = { for k, v in var.Aws_Nat_Gateway_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for Public Route Table. Public Route Table Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "public_route_table" {
  source = "./modules/route_table"
  Vpc_Id = module.vpc.vpc_id # vpc_id will be derived from the ouptut variable declared in the VPC Module
  # Derived from output variable "internet_gateway_id" declared in the internet_gateway module
  # route_table_routes accepts the routes of the route table as a list of map. 
  route_table_routes = [{ "cidr_block" : var.Ipv4_Cidr, "gateway_id" : module.internet_gateway.internet_gateway_id }]
  Route_Table_Tags   = var.Aws_Public_Route_Table_Tags
}

/* Parent Module for App Private Route Table. App Private Route Table Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "app_private_route_table" {
  source = "./modules/route_table"
  Vpc_Id = module.vpc.vpc_id # vpc_id will be derived from the ouptut variable declared in the VPC Module
  count  = length(var.App_Private_Subnets_Cidr)
  # Derived from output variable "nat_gateway_id" declared in the nat_gateway module
  # route_table_routes accepts the routes of the route table as a list of map. 
  route_table_routes = [{ "cidr_block" : var.Ipv4_Cidr, "nat_gateway_id" : module.nat_gateway[count.index].nat_gateway_id }]
  Route_Table_Tags   = { for k, v in var.Aws_App_Private_Route_Table_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for Db Private Route Table. Db Private Route Table Resource is created by making the call to the child module and values for variables declared in child module
   will be passed by the parent module.
*/
module "db_private_route_table" {
  source = "./modules/route_table"
  Vpc_Id = module.vpc.vpc_id # vpc_id will be derived from the ouptut variable declared in the VPC Module
  count  = length(var.Db_Private_Subnets_Cidr)
  # Derived from output variable "nat_gateway_id" declared in the nat_gateway module
  # route_table_routes accepts the routes of the route table as a list of map. 
  route_table_routes = [{ "cidr_block" : var.Ipv4_Cidr, "nat_gateway_id" : module.nat_gateway[count.index].nat_gateway_id }]
  Route_Table_Tags   = { for k, v in var.Aws_Db_Private_Route_Table_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

/* Parent Module for Public Route Table Subnet Assosciation. Public Route Table Subnet Assosciation Resource is created by making the call to the child module and values for variables 
   declared in child module will be passed by the parent module.
*/
module "public_route_table_subnet_association" {
  source         = "./modules/route_table_subnet_association"
  count          = length(module.public_subnet)
  Subnet_Id      = module.public_subnet[count.index].subnet_ids # Derived from output variable "subnet_ids" declared in the subnet module
  Route_Table_Id = module.public_route_table.route_table_id     # Derived from output variable "route_table_id" declared in the route_table module
}

/* Parent Module for App Private Route Table Subnet Assosciation. App Private Route Table Subnet Assosciation Resource is created by making the call to the child module and values for variables 
   declared in child module will be passed by the parent module.
*/
module "App_private_route_table_subnet_association" {
  source         = "./modules/route_table_subnet_association"
  count          = length(module.app_private_subnet)
  Subnet_Id      = module.app_private_subnet[count.index].subnet_ids          # Derived from output variable "subnet_ids" declared in the subnet module
  Route_Table_Id = module.app_private_route_table[count.index].route_table_id # Derived from output variable "route_table_id" declared in the route_table module
}

/* Parent Module for Db Private Route Table Subnet Assosciation. Db Private Route Table Subnet Assosciation Resource is created by making the call to the child module and values for variables 
   declared in child module will be passed by the parent module.
*/
module "Db_private_route_table_subnet_association" {
  source         = "./modules/route_table_subnet_association"
  count          = length(module.db_private_subnet)
  Subnet_Id      = module.db_private_subnet[count.index].subnet_ids          # Derived from output variable "subnet_ids" declared in the subnet module
  Route_Table_Id = module.db_private_route_table[count.index].route_table_id # Derived from output variable "route_table_id" declared in the route_table module
}


