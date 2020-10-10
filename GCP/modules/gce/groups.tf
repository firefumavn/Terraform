# ------------------------------------------------------------------------------
# CREATE GROUP INSTANCES
# ------------------------------------------------------------------------------
resource "google_compute_instance_group" "group_ubuntu" {
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

#VM Win

resource "google_compute_instance_group" "group_win" {
  project   = var.project
  name      = "${var.env}-win-web-groups"
  zone      = var.zone
  instances = [google_compute_instance.web_instance_win.id]

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