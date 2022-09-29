module "org" {
  source = "./modules/org/"
}

module "ou" {
  source = "./modules/ou/"
  count        = length(var.list_ou)
  main_ou_name = var.list_ou[count.index]
  Parent_id = module.org.parent_id
  depends_on = [
    module.org
  ]
}

module "nested_ou_name" {
  source         = "./modules/nested_ou_name/"
  nested_ou_name = var.nested_ou_name
  Parent_id = module.org.parent_id
  depends_on = [
    module.org
  ]
}
module "nested_ou" {
  source    = "./modules/nested_ou/"
  count     = length(var.nested_ou)
  nested_ou = var.nested_ou[count.index]
  Parent_id = module.nested_ou_name.parent_id
  depends_on = [
    module.nested_ou_name
  ]
}