
# these are output variables for the root module main.tf

output "alb_dns_name" {

  value = module.omero_alb.dns_name
}

output "aurora_db_endpoint" {
  value = module.omero_db.aurora_cluster_endpoint
}