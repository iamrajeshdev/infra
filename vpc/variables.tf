variable "environment" {
  type = string
}

variable "product" {
  type = string
  description = "set the product name for the ec2 module"
}

variable "vpc_index" {
  type = number
  description = "set the vpc index "
}

variable "primary_cidr_block" {
  type = string
  description = "set the base cidr block for the vpc"
}

variable "account_sso_roles" {
  type = map(object({
    role_description = string
    role_grants = list(string)
    role_tags = map(list(object({
      key = string
      value = string
    })))
  }))
  description = "test objects"
  default = {}
}

