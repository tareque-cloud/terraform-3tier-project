
# this output value will be feeded as an input value for the network module as 
# it's mandatory/required attribute which will to be needed for routing.tf's arguments

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}