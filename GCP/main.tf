#VPC
module "vpc" {
  source      = "./modules/vpc"
  #vpc_id     = module.vpc.vpc_id
  env         = var.env
  region      = var.region
  zone        = var.zone
  project	    = var.project
}

#GCE
module "gce" {
  source      = "./modules/gce"
  env         = var.env
  region      = var.region
  zone        = var.zone
  project	    = var.project
  network     = module.vpc.vpc_id
  subnetwork  = module.vpc.subnetwork_id 
  address_ip  = module.vpc.address_ip
}

#Cloud DB
module "db" {
  source      = "./modules/clouddb"
  env         = var.env
  region      = var.region
  zone        = var.zone
  project	    = var.project
  network     = module.vpc.vpc_id
  network_link  = module.vpc.vpc_link 
  address_ip  = module.vpc.address_ip
}