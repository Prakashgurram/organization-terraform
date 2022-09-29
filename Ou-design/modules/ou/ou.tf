resource "aws_organizations_organizational_unit" "main_ou" {
  name      = var.main_ou_name
  parent_id = var.Parent_id
}