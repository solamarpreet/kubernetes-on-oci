resource "oci_core_instance" "ocarm1" {

    availability_domain = data.oci_identity_availability_domains.homelab_availability_domains.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.A1.Flex"
    display_name = "ocarm1"

    shape_config {
    memory_in_gbs = 12
    ocpus         = 2
    }

    metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    }

    create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.homelab-subnet.id
    assign_private_dns_record = true
    private_ip                = "10.0.0.2"
    hostname_label = "ocarm1"
    }

    source_details {
    #Required
    source_id = var.ampere_source_image_id
    source_type = "image"
    }
}