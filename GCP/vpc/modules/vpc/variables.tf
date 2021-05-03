variable "env" {}

variable "project" {}

variable "region" {}

variable "zone" {}

###############################################################################
# VPC
###############################################################################

variable "description" {
  description = ""
  default     = "Dev VPC"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = ""
  default     = false
}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are REGIONAL and GLOBAL"
}

variable "delete_default_routes_on_create" {
  type        = bool
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false"
  default     = false
}

###############################################################################
# Subnet
###############################################################################
variable "ip_cidr_range_private" {
  type        = string
  default     = "10.0.0.0/22"
}

variable "ip_cidr_range_public" {
  type        = string
  default     = "192.168.10.0/24"
}

###############################################################################
# Firewall
###############################################################################
variable "internal_ranges" {
  description = "IP CIDR ranges for intra-VPC rules."
  default     = []
}

variable "internal_target_tags" {
  description = "List of target tags for intra-VPC rules."
  default     = []
}

variable "source_ranges" {
  type        = string
  default     = "0.0.0.0/0"
}

