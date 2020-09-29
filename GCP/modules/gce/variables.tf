variable "env" {}

variable "project" {}

variable "region" {}

variable "zone" {}

variable "network" {}

variable "subnetwork" {}

variable "address_ip" {}

#https://cloud.google.com/compute/docs/machine-types
variable "machine_type_web" {
  description = "1 CPU - 3.75 RAM"
  default     = "n1-standard-1" 
}

variable "machine_type_web_win" {
  description = "1 CPU - 3.75 RAM"
  default     = "n1-standard-1"
}
#boot disk images "gcloud compute images list"
variable "image_web" {
  description = "ubuntu-1804-lts"
  default     = "ubuntu-1804-bionic-v20200916" 
}
variable "image_web_win" {
  description = "windows server 2019"
  default     = "windows-server-2019-dc-v20200609" 
}

#Scopes 
variable "email_scopes" {
  default     = "591032345997-compute@developer.gserviceaccount.com" 
}

variable "web_scopes" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

variable "database_scopes" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

#SSH
variable "ssh_pub_key_file" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgjXtZPwUc9Gnwa6AaDZW4Aki3+OhZ+An227aCEn+Ck4mL6mCe/MdKqeVK/3UguLJr/zdsSLfQSa+jG+fhidJnlrDPTPo5sLdXY6Xm8sOVMbzjmCQnQ6IpmKKPHtRZQFdqir0EZdPrR2H/zXjP/5Ueuh4iOi1wn1fnKZmEGsJ7gl8pHlkbopsIiVQLo1g+juwgcMzwbbGMQ+hZ46MoR5dcxyOFiUlrt3lsuwqfoCUOvFae4u85f9bd0qddooHQgAbTAA+Q2htlAfX8UZIRrEoumPsG/C5DDzDNw6Yy6jIEsfBkxWtovE4fU7r1ZvEM18kUHFiWQbtAjPYqZOg8n4pyw== ubuntu" 
}
variable "ssh_user" {
    default     = "ubuntu"
}

