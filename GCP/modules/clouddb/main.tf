/******************************************
* MySQL Cloud DB
*****************************************/
resource "google_sql_database_instance" "master" {
  provider            = google-beta
  project             = var.project
  name                = "${var.env}-db-master-mysql-v03"
  database_version    = var.database_version
  region              = var.region
  settings {
    tier             = var.database_tier
    activation_policy = var.activation_policy
    availability_type = var.availability_type

    backup_configuration {
      binary_log_enabled = true
      enabled            = true
    }

    ip_configuration  {
      ipv4_enabled    = true
      #private_network = var.network_link
    }

    location_preference {
      zone = var.zone
    }
  }
}

/******************************************
* User/pass
*****************************************/
resource "google_sql_user" "db_user" {
  name     = var.db_username
  password = var.db_password
  instance = google_sql_database_instance.master.name
  
}
