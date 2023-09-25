output "public-ip-ocarm1" {
  value       = oci_core_instance.ocarm1.public_ip
  description = "Public IP for ocarm1"
}