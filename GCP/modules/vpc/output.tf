output "vpc_id" {
  value = google_compute_network.network.id
}

output "vpc_link" {
  value = google_compute_network.network.self_link
}

output "subnetwork_id" {
  value = google_compute_subnetwork.subnetwork_private.id
}

output "address_ip" {
  value = google_compute_address.static.address
}
