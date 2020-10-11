/******************************************
	DNS
*****************************************/

resource "google_dns_managed_zone" "public" {
  name        = "${var.env}-dns-public-zone"
  dns_name    = var.dns_name
  description = "Dev Environment"
  visibility  = "public"
  project     = var.project
}

resource "google_dns_record_set" "web_a" {
  project      = var.project
  name         = google_dns_managed_zone.public.dns_name
  managed_zone = google_dns_managed_zone.public.name
  type         = "A"
  ttl          = 300

  rrdatas = [var.lb_ubuntu_ip_address]
}

resource "google_dns_record_set" "web_caa" {
  project     = var.project
  name         = google_dns_managed_zone.public.dns_name
  managed_zone = google_dns_managed_zone.public.name
  type         = "CAA"
  ttl          = 300

  rrdatas = ["0 issue \"pki.goog\"", "0 issue \"letsencrypt.org\""]
}