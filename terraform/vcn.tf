resource "oci_core_vcn" "homelab_vcn" {
  compartment_id = var.compartment_id

  cidr_blocks  = ["10.0.0.0/24"]
  display_name = "homelab_vcn"
  dns_label    = "hlvcn"
}

resource "oci_core_default_security_list" "default_list" {
  manage_default_resource_id = oci_core_vcn.homelab_vcn.default_security_list_id

  display_name = "Outbound and Inbound (default)"

  egress_security_rules {
    protocol    = "all" // TCP
    description = "Allow outbound traffic"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "all"
    description = "Allow inbound traffic from subnet"
    source      = "10.0.0.0/24"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow ssh traffic"
    tcp_options {
      min = 22
      max = 22
    }
    source = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow http traffic"
    tcp_options {
      min = 80
      max = 80
    }
    source = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow https traffic"
    tcp_options {
      min = 443
      max = 443
    }
    source = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow k3s api traffic"
    tcp_options {
      min = 6443
      max = 6443
    }
    source = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow microk8s api traffic"
    tcp_options {
      min = 16443
      max = 16443
    }
    source = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol    = "6"
    description = "Allow k8s NodePort traffic"
    tcp_options {
      min = 30000
      max = 32767
    }
    source = "0.0.0.0/0"
  }

}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.homelab_vcn.id
  enabled        = true
}

resource "oci_core_default_route_table" "internet_route_table" {
  compartment_id             = var.compartment_id
  manage_default_resource_id = oci_core_vcn.homelab_vcn.default_route_table_id

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_subnet" "homelab_public_subnet" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.homelab_vcn.id
  cidr_block        = oci_core_vcn.homelab_vcn.cidr_blocks[0]
  display_name      = "homelab_public_subnet"
  dns_label         = "hlsubnet"
  security_list_ids = [oci_core_vcn.homelab_vcn.default_security_list_id]
}
