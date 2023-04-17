data "oci_identity_availability_domains" "homelab_availability_domains" {

  compartment_id = var.compartment_id
}

data "oci_core_images" "arm_images" {

  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = "VM.Standard.A1.Flex"
}
