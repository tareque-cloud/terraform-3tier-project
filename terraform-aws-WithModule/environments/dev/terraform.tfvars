
# these are the meta values of input variables in variables.tf for the root module main.tf
aws_region            = "eu-central-1"
vpc_cidr              = "10.0.0.0/16"
vpc_name              = "omero-vpc"
key_name              = "omero-key"
azs                   = ["eu-central-1a", "eu-central-1b"]
public_cidr_block     = ["10.0.1.0/24", "10.0.2.0/24"]
private_cidr_block    = ["10.0.10.0/24", "10.0.20.0/24"]
private_db_cidr_block = ["10.0.30.0/24", "10.0.40.0/24"]
environment           = "DEV"