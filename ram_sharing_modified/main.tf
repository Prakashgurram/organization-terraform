module "ram_share" {
  source                    = "./modules/ram_share"
  ram_name                  = var.ram_name
  allow_external_principals = var.allow_external_principals
}


module "principal_association" {
  source             = "./modules/principal_association"
  count = length(var.account_id)
  account_id = var.account_id[count.index]
  resource_share_arn = module.ram_share.resource_share_arn
}


module "subent_ram_association" {
  source             = "./modules/ram_association"
  count              = length(var.subnet_arn)
  resource_arn       = var.subnet_arn[count.index]
  resource_share_arn = module.ram_share.resource_share_arn
}
