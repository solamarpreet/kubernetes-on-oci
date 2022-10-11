variable "region" {
  description = "The region to connect to. Default: eu-frankfurt-1"
  type        = string
  default     = "us-phoenix-1"
}

variable "config_file_profile" {
  description = "The config profile to use"
  type        = string
  default     = "DEFAULT"
}

variable "ampere_source_image_id" {
  description = "OCID of the ampere image"
  type        = string
}

variable "amd_source_image_id" {
  description = "OCID of the amd image"
  type        = string
}

variable "ampere_boot_volume_size" {
  description = "Size of the boot volume in GBs"
  type        = number
}

variable "amd_boot_volume_size" {
  description = "Size of the boot volume in GBs"
  type        = number
}

variable "ssh_authorized_keys" {
  description = "Public SSH key added to authorized_keys file of new instances"
  type        = string
}

variable "ansible_ssh_private_key_file" {
  description = "Private SSH key used to connect to instances via ansible"
  type        = string
}

variable "compartment_id" {
  description = "OCI Compartment ID"
  type        = string
  sensitive   = true
}

variable "kube_duckdns_url" {
  description = "DuckDNS url to configure DDNS hostname for k8s control plane"
  default     = "http://example.com"
  type        = string
  sensitive   = true
}

variable "registry_duckdns_url" {
  description = "DuckDNS url to configure DDNS hostname for k8s control plane"
  default     = "http://example.com"
  type        = string
  sensitive   = true
}