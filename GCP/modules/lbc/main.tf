#LB ***************************************************************************
#Forwarding rule
#LB ***************************************************************************
resource "google_compute_global_forwarding_rule" "global_forwarding_rule" {
  name        = "${var.env}-ubuntu-global-forwarding-rule"
  project     = var.project
  target      = google_compute_target_https_proxy.default.self_link
  port_range  = "443"
}

#Backend Service
resource "google_compute_backend_service" "backend_service" {
  name                    = "${var.env}-ubuntu-backend-service"
  project                 = var.project
  port_name               = "http"
  protocol                = "HTTP"
  health_checks           = [google_compute_health_check.healthcheck.self_link]
  backend {
    group                 = var.web_ubuntu_link
    balancing_mode        = "RATE"
    max_rate_per_instance = 100
  }
}

#Health check
resource "google_compute_health_check" "healthcheck" {
  name = "${var.env}-web-ubuntu-health-check"
  project = var.project
  timeout_sec         = 5
  check_interval_sec  = 10
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    port = 80
    request_path       = "/healthcheck.html"
  }
}

#LB Maping
resource "google_compute_url_map" "url_map" {
  name            = "${var.env}-lb-web-ubuntu"
  project         = var.project
  default_service = google_compute_backend_service.backend_service.self_link
}
