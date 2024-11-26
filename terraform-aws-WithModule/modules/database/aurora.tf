# 8. Aurora RDS (Database)

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = var.private_db_ids

  tags = {
    Name        = "${var.vpc_name}-db-subnet-group"
    environment = var.environment
  }
}

resource "aws_rds_cluster" "aurora_cluster" {
  engine                 = "aurora-mysql"
  database_name          = "omero_db"
  master_username        = "admin"
  master_password        = "password"
  db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.db_sg_id] # Associate DB security group
  tags = {
    Name = "OMERO Aurora Cluster"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier  = aws_rds_cluster.aurora_cluster.id
  instance_class      = "db.r5.large"
  engine              = "aurora-mysql"
  publicly_accessible = false
}