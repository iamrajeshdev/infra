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