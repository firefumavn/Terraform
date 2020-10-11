output "lb_ubuntu_ip_address" {
  value = google_compute_global_forwarding_rule.global_forwarding_rule.ip_address
}