resource "aws_instance" "bastion_host" {
  ami                         = "ami-0c55b159cbfafe1f0" # Replace with appropriate AMI
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  key_name                    = var.key_name # Replace with your SSH key
  vpc_security_group_ids      = [var.bastion_sg_id]

  tags = {
    Name = "${var.vpc_name}-Bastion Host"
  }
}