/******************************************
	Web - VM Instances - Ubuntu
 *****************************************/
resource "google_compute_instance" "web_instance" {
  name                      = "${var.env}-ubuntu-web"
  machine_type              = var.machine_type_web
  zone                      = var.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image                 = var.image_web
      size                  = "50"               
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
       nat_ip = var.address_ip #if not set -> auto 
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
    ssh-keys = "${var.ssh_user}:${var.ssh_pub_key_file}"
  }
} 

/******************************************
	Web - VM Instances - Windows
 *****************************************/

resource "google_compute_instance" "web_instance_win" {
  name                      = "${var.env}-win-web"
  machine_type              = var.machine_type_web_win
  zone                      = var.zone
  allow_stopping_for_update = true
  // Local SSD disk
  boot_disk {
    initialize_params {
      image = var.image_web_win
      size  = "50"               
      type  = "pd-ssd"
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  network_interface {
    network                 = var.network
    subnetwork              = var.subnetwork
    access_config {
       #Ephemeral IP
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

} 

/******************************************
	Database - VM Instances
 *****************************************/

