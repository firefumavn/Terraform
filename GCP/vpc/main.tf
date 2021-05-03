#VPC
module "vpc" {
  source      = "./modules/vpc"
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
  project	  = var.project
  network     = module.vpc.vpc_id
  subnetwork  = module.vpc.subnetwork_id  
  address_ip  = ""
}
