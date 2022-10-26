locals {
  tags = {
    "Hackathon:environment" = var.environment
    "Hackathon:product" = var.product
  }

  vpc_name = "${var.environment}-vpc-${var.vpc_index}"
}


resource "aws_vpc" "hk_vpc" {
  for_each = var.account_sso_roles
  cidr_block       = var.primary_cidr_block
  instance_tenancy = "default"
  tags = merge({
    Name = "${var.environment}-vpc-${var.vpc_index}"
  }, local.tags,
  {for tag in each.value["role_tags"]: tag.key => tag.value}
  )
}