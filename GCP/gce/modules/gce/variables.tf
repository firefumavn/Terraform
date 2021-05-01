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

#boot disk images "gcloud compute images list"
variable "image_web" {
  description = "ubuntu-1804-lts"
  default     = "ubuntu-1804-bionic-v20200916" 
}

#Scopes 
variable "email_scopes" {
  default     = "377037058039-compute@developer.gserviceaccount.com" 
}

variable "web_scopes" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

