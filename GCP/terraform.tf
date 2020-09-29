#GCS Bucket
terraform {
  required_version = ">= 0.13.1"
  backend "gcs" {
    bucket  = "tf-dev-tfstate"
    prefix  = "v1/terraform.tfstate"
  }
}
