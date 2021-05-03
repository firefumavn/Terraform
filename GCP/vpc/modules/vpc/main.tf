/******************************************
	VPC configuration
 *****************************************/

resource "google_compute_network" "network" {
  name                            = "${var.env}-ffm-vpc"
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  project                         = var.project
  description                     = var.description
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

/******************************************
	SUBNET VPC
 *****************************************/

resource "google_compute_subnetwork" "subnetwork_private" {
  project         = var.project
  provider        = google-beta
  name            = "${var.env}-ffm-subnetwork"
  ip_cidr_range   = var.ip_cidr_range_private
  region          = var.region
  network         = google_compute_network.network.id
  #secondary_ip_range {
  #  range_name    = "${var.env}-secondary-range"
  #  ip_cidr_range =  var.ip_cidr_range_public
  #}
  purpose         = "PRIVATE"
  role            = "ACTIVE"
}


###############################################################################
# Ingress internal
###############################################################################

/******************************************
* https
 *****************************************/
resource "google_compute_firewall" "allow-https" {
  name          = "${var.env}-allow-https"
  network       = google_compute_network.network.self_link
  project       = var.project
  source_ranges = [var.source_ranges]
  target_tags   = var.internal_target_tags

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

/******************************************
* https
 *****************************************/
resource "google_compute_firewall" "allow-http" {
  name          = "${var.env}-allow-http"
  network       = google_compute_network.network.self_link
  project       = var.project
  source_ranges = [var.source_ranges]
  target_tags   = var.internal_target_tags

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

/******************************************
* icmp
 *****************************************/
resource "google_compute_firewall" "allow-icmp" {
  name          = "${var.env}-allow-icmp"
  network       = google_compute_network.network.self_link
  project       = var.project
  source_ranges = [var.source_ranges]
  target_tags   = var.internal_target_tags
  priority      = 65535

  allow {
    protocol    = "icmp"
  }
}

/******************************************
* https
 *****************************************/
resource "google_compute_firewall" "allow-ssh" {
  name          = "${var.env}-allow-ssh"
  network       = google_compute_network.network.self_link
  project       = var.project
  source_ranges = [var.source_ranges]
  target_tags   = var.internal_target_tags

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
