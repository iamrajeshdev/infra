locals {
  tags = {
    "Hackathon:environment" = var.environment
    "Hackathon:product" = var.product
  }

  vpc_name = "${var.environment}-vpc-${var.vpc_index}"
}


resource "aws_s3_bucket" "hk_s3" {
  bucket = "${var.environment}-${var.product}-tu-0"

  tags = {
    Name        = "${var.environment}-${var.product}-tu-0"
    Environment = var.environment
  }
}
