output "public-ip-ocarm1" {
  value = oci_core_instance.ocarm1.public_ip
  description = "Public IP for ocarm1"
}

output "public-ip-ocarm2" {
  value = oci_core_instance.ocarm2.public_ip
  description = "Public IP for ocarm2"
}

output "public-ip-ocamd1" {
  value = oci_core_instance.ocamd1.public_ip
  description = "Public IP for ocamd1"
}