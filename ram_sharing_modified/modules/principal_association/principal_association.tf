# data "aws_organizations_organization" "organization"{
# }

# Principle association
resource "aws_ram_principal_association" "association" {
#   principal          = "arn:aws:organizations::314179750241:ou/o-u1ig9t1h9b/ou-gsuc-4hnachfpterra"
  principal = var.account_id
  resource_share_arn = var.resource_share_arn
}