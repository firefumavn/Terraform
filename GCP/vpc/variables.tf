#project
variable "project" {
  default     = "project_id"
}

#tokyo region
variable "region" {
  description = ""
  default     = "asia-northeast1" 
}

#zone
variable "zone" {
  description = ""
  default     = "asia-northeast1-b" 
}

#enviroment
variable "env" {
  description = ""
  default     = "dev" 
}