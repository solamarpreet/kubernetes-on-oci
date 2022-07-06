data "oci_identity_availability_domains" "homelab_availability_domains" {
    #Required
    compartment_id = var.compartment_id
}
