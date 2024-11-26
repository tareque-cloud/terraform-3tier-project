resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_cidr_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_cidr_block, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public_subnet-${count.index + 1}"
  }
}