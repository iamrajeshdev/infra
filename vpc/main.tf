locals {
  tags = {
    "Hackathon:environment" = var.environment
    "Hackathon:product" = var.product
  }

  vpc_name = "${var.environment}-vpc-${var.vpc_index}"
}


resource "aws_vpc" "hk_vpc" {
  cidr_block       = var.primary_cidr_block
  instance_tenancy = "default"
  tags = merge({
    Name = "${var.environment}-vpc-${var.vpc_index}"
  }, local.tags)
}