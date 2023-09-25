resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tftpl",
    { ocarm1_ip                    = oci_core_instance.ocarm1.public_ip,
      ocarm1_private_ip            = oci_core_instance.ocarm1.private_ip,
      ocarm1_name                  = oci_core_instance.ocarm1.display_name,
      ansible_ssh_private_key_file = var.ansible_ssh_private_key_file,
      duckdns_url                  = var.duckdns_url
    }
  )

  filename        = "${path.module}/../ansible/hosts"
  file_permission = "0644"
}
