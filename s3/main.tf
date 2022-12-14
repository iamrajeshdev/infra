locals {
  tags = {
    "Hackathon:environment" = var.environment
    "Hackathon:product" = var.product
  }
}


resource "aws_s3_bucket" "hk_s3" {
  bucket = "${var.environment}tu0test"

  tags = {
    Name        = "${var.environment}-${var.product}-tu-0"
    Environment = var.environment
  }
}
