resource "aws_organizations_organizational_unit" "business" {
  name      = var.nested_ou_name
  parent_id = var.Parent_id
}
