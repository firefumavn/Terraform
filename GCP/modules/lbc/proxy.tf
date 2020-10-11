resource "google_compute_managed_ssl_certificate" "default" {
  provider  = google-beta
  project   = var.project
  name      = "${var.env}-ubuntu-web-certificate"
  managed {
    domains = [var.dns_name]
  }
}

#Frontend -> Mapping for DNS
resource "google_compute_target_https_proxy" "default" {
  provider         = google-beta
  project          = var.project
  name             = "${var.env}-ubuntu-proxy"
  url_map          = google_compute_url_map.url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
}