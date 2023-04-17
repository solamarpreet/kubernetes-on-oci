terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.115.0"
    }
  }
}

provider "oci" {
  config_file_profile = var.config_file_profile
}
