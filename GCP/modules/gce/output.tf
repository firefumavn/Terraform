
output "web_ubuntu_link" {
  value = google_compute_instance_group.group_ubuntu.self_link
}

output "web_win_link" {
  value = google_compute_instance_group.group_win.self_link
}
