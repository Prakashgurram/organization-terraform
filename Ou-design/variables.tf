variable "Aws_region" {
  type = string  
}
variable "list_ou" {
  type = list(string)
}
variable "nested_ou_name" {
  type = string
}
variable "nested_ou" {
  type = list(string)
}
