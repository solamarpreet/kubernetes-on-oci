variable "config_file_profile" {
  description = "The config profile to use"
  type        = string
  default     = "DEFAULT"
}

variable "ampere_boot_volume_size" {
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

variable "availability_domain" {
  description = "Availability Domain to launch the compute instances in. Mostly 0, 1 or 2"
  type        = number
  default     = 0
}

variable "kube_duckdns_url" {
  description = "DuckDNS url to configure DDNS hostname for k8s control plane"
  default     = "http://example.com"
  type        = string
  sensitive   = true
}
