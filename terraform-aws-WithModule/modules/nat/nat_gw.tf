# 4. NAT Gateway

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

}

# NAT Gateway in Public Subnet
resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "${var.vpc_name}-NAT"
  }
}