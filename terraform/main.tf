provider "oci" {
  
}

resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape = "VM.Standard.A1.Flex"

    shape_config {
    memory_in_gbs = 12
    ocpus         = 2
    }

    metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    }

    create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = var.subnet_id
    assign_private_dns_record = true
    private_ip                = "10.0.0.10"
    }

    source_details {
    #Required
    source_id = "ocid1.image.oc1.phx.aaaaaaaa37ehmo2yigg3fqxmmodcoah6eprle5pibupeblxetyqnhi3yeycq"
    source_type = "image"
    }
}