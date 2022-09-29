resource "aws_organizations_organizational_unit" "nested_ou" {
  name      = var.nested_ou
  parent_id = var.Parent_id
}