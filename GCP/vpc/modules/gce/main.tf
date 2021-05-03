/******************************************
	Web - VM Instances - Ubuntu
 *****************************************/
resource "google_compute_instance" "web_instance" {
  name                      = "${var.env}-ubuntu-web"
  machine_type              = var.machine_type_web
  zone                      = var.zone
  project 					= var.project
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image                 = var.image_web
      size                  = "20"               
      type                  = "pd-ssd"
    }
  }

  lifecycle {
    ignore_changes          = [attached_disk]
  }

  network_interface {
    network                 = var.network
    subnetwork              = var.subnetwork
    access_config {
       #Ephemeral IP
       #nat_ip = var.address_ip #if not set -> auto 
    }
  }

  #Network tags
  tags = ["http-server", "https-server"]

  #Service account
  service_account {
    email                   = var.email_scopes
    scopes                  = var.web_scopes
  }

  labels = {
    state-scheduler          = true
  }

  metadata = {

  }
}