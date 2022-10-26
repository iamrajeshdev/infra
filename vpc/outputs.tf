output "vpc_name" {
  value = local.vpc_name
}

output "vpc_id" {
  value = aws_vpc.hk_vpc[0].id
}

output "vpc_arn" {
  value = aws_vpc.hk_vpc[0].arn
}