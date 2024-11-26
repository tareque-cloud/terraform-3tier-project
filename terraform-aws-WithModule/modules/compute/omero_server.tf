# 6. EC2 Instances (OMERO App Servers)

resource "aws_instance" "omero_app_server" {
  ami                         = "ami-0c55b159cbfafe1f0" # Update with the correct AMI for your region
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_app_1_id
  vpc_security_group_ids      = [var.omero_server_sg_id] # Associate with the OMERO EC2 security group
  associate_public_ip_address = false                    # No public IP for private subnet
  count                       = 1

  tags = {
    Name = "${var.vpc_name}-Omero_app_server"
  }
}