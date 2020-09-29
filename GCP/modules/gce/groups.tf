# ------------------------------------------------------------------------------
# CREATE SSH GROUP INSTANCES
# ------------------------------------------------------------------------------
resource "google_compute_instance_group" "web_ssh" {
  project   = var.project
  name      = "${var.env}-ubuntu-web-groups"
  zone      = var.zone
  instances = [google_compute_instance.web_instance.id]

  named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }

  lifecycle {
    create_before_destroy = true
  }
}