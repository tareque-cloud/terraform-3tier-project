resource "aws_subnet" "private_app" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-private_subnet-${count.index + 1}"
  }
}