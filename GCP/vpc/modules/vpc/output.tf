output "vpc_id" {
  value = google_compute_network.network.id
}

output "subnetwork_id" {
  value = google_compute_subnetwork.subnetwork_private.id
}
