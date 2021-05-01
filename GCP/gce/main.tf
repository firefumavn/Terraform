#GCE
module "gce" {
  source      = "./modules/gce"
  env         = var.env
  region      = var.region
  zone        = var.zone
  project	  = var.project
  network     = ""
  subnetwork  = "" 
  address_ip  = ""
}