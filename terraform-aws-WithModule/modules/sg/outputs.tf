output "alb_sg_id" {

  value = aws_security_group.alb_sg.id

}


output "db_sg_id" {

  value = aws_security_group.db_sg.id

}


output "bastion_sg_id" {

  value = aws_security_group.bastion_sg.id

}


output "omero_server_sg_id" {
  value = aws_security_group.ec2_omero_sg.id
}