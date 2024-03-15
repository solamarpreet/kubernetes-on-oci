terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.32.0"
    }
  }
}

provider "oci" {
  config_file_profile = var.config_file_profile
}
