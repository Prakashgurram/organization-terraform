output "parent_id" {
  value = data.aws_organizations_organization.root.roots[0].id
}