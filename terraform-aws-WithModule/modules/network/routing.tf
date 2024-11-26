# 2. Route Tables and Associations

# Public Route Table and Association for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-public_route_table"
  }
}

resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


# Private Route Table for App Subnets
resource "aws_route_table" "private_app_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private_route_table"
  }
}

# Route for NAT Gateway in Private App Subnets
resource "aws_route" "private_app_nat" {

  route_table_id         = aws_route_table.private_app_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw_id  # it will get the nat_gateway_id  from the value of output variable of nat module 
}

# Route Table Associations for Private App Subnets
resource "aws_route_table_association" "private_app_association" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private_app.*.id, count.index)
  route_table_id = aws_route_table.private_app_rt.id
}



# Private Route Table for DB Subnets
resource "aws_route_table" "private_db_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-db_route_table"
  }
}

# Route for NAT Gateway in Private DB Subnets
resource "aws_route" "private_db_nat" {
  route_table_id         = aws_route_table.private_db_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw_id
}

# Route Table Associations for Private DB Subnets
resource "aws_route_table_association" "private_db_association" {
  count          = length(var.private_db_cidr_block)
  subnet_id      = element(aws_subnet.private_db.*.id, count.index)
  route_table_id = aws_route_table.private_db_rt.id
}