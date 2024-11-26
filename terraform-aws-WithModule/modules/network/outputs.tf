output "public_subnet_1_id" {

  value = aws_subnet.public_subnet[0].id

}

output "private_subnet_app_1_id" {

  value = aws_subnet.private_app[0].id

}

output "vpc_name" {

  value = var.vpc_name

}

output "public_subnet_all_id" {

  value = aws_subnet.public_subnet[*].id

}

output "vpc_main_id" {

  value = aws_vpc.main.id

}

output "private_db_ids" {

  value = aws_subnet.private_db[*].id

}