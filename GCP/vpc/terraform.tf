#GCS Bucket
terraform {
  required_version = ">= 0.13.3"
  backend "gcs" {
    bucket  = "tf-dev-tfstates"
    prefix  = "dev"
  }
}
