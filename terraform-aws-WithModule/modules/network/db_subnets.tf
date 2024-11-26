resource "aws_subnet" "private_db" {
  count             = length(var.private_db_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_db_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-private_db_subnet-${count.index + 1}"
  }
}
