
variable "allow_external_principals" {
  type = bool
}

variable "ram_name" {
  type = string

}

variable "subnet_arn" {
  type = list(string)
}

variable "account_id" {
  type = list(string)
}