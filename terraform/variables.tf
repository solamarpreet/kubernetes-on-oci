variable "compartment_id" {
  description = "OCI Compartment ID"
  type        = string
}

variable "region" {
  description = "The region to connect to. Default: eu-frankfurt-1"
  type        = string
  default     = "us-phoenix-1"
}

variable "ampere_source_image_id" {
  description = "OCID of the ampere image"
  type        = string
}

variable "ssh_authorized_keys" {
  description = "Public SSH key added to authorized_keys file of new instances"
  type        = string
}
