module "omero_network" {

  source = "../../modules/network"

  aws_region = var.aws_region

  vpc_cidr = var.vpc_cidr

  vpc_name = var.vpc_name


  azs = var.azs

  public_cidr_block = var.public_cidr_block

  private_cidr_block = var.private_cidr_block

  private_db_cidr_block = var.private_db_cidr_block

  environment = var.environment

  nat_gw_id = module.omero_nat.nat_gateway_id

  # nat_gw_id  is from the network module's input variable and nat_gateway_id is the output variable from the nat module's output
  # 

}




module "omero_nat" {

  source = "../../modules/nat"

  vpc_name         = var.vpc_name
  public_subnet_id = module.omero_network.public_subnet_1_id

}

module "omero_sg" {

  source = "../../modules/sg"

  vpc_main_id = module.omero_network.vpc_main_id

}

module "omero_alb" {

  source = "../../modules/elb"

  vpc_name             = module.omero_network.vpc_name
  vpc_main_id          = module.omero_network.vpc_main_id
  public_subnet_all_id = module.omero_network.public_subnet_all_id
  alb_sg_id            = module.omero_sg.alb_sg_id

}

module "omero_db" {

  source = "../../modules/database"

  vpc_name       = var.vpc_name
  environment    = var.environment
  db_sg_id       = module.omero_sg.db_sg_id
  private_db_ids = module.omero_network.private_db_ids



}

module "omero_bastionhost_and_omero_app" {

  source = "../../modules/compute"


  vpc_name                = var.vpc_name
  key_name                = var.key_name
  public_subnet_1_id      = module.omero_network.public_subnet_1_id
  bastion_sg_id           = module.omero_sg.bastion_sg_id
  omero_server_sg_id      = module.omero_sg.omero_server_sg_id
  private_subnet_app_1_id = module.omero_network.private_subnet_app_1_id





}

