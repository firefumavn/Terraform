variable "env" {}

variable "project" {}

variable "region" {}

variable "zone" {}

variable "network" {}

variable "network_link" {}

variable "address_ip" {}

variable "database_version" {
  default     = "MYSQL_5_7" 
}

variable "database_tier" {
  #List: gcloud sql tiers list
  default     = "db-n1-standard-1" 
}

variable "disk_size" {
  default     = "10" 
}

variable "activation_policy" {
  description = "The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type for the master instance.This is only used to set up high availability for the MSSQL instance. Can be either `ZONAL` or `REGIONAL`."
  type        = string
  default     = "ZONAL"
}

variable "db_username" {
  default     = "web_user" 
}

variable "db_password" {
  default     = "web_user@666999" 
}

variable "db_name" {
  default     = "web_1" 
}