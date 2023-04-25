terraform {
  cloud {
    organization = "solamarpreet"

    workspaces {
      name = "kubernetes-on-oci"
    }
  }
}