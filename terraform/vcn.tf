resource "oci_core_vcn" "homelab-vcn" {

    compartment_id = var.compartment_id

    cidr_blocks = ["10.0.0.0/16"]
    display_name = "homelab-vcn"
    dns_label = "hlvcn"
}

resource "oci_core_internet_gateway" "homelab-internet-gateway" {

    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.homelab-vcn.id

    enabled = true
    display_name = "hlinternetgateway"
}

resource "oci_core_subnet" "homelab-subnet" {

    cidr_block = "10.0.0.0/24"
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.homelab-vcn.id

    display_name = "homelab-subnet"
    dns_label = "hlsubnet"
}